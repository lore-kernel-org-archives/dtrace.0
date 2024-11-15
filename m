Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE061CF8B
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731638544; cv=fail; b=j0SqCPD8NGTzdKLCdEkBTMmIkljpIvBxNffPi5KGDefuRC8L/IPgq2R46ckVlGMS9Xma3WKFqU6YrM7HJJlERZWA0rdEuEha7RCIflMT/V5wvYoDHODeWcMu/tzHfRVmJtHcm3T7jIh5BxNgba8d8I7YYWnosvfGVOxlGcq06ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731638544; c=relaxed/simple;
	bh=3yB3LgkTcwPqEjdJX05Rj0mZP0S+1Hd6VFrOvyiqGB0=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hu8uAvdDWyA5gZmIxOVRqrs6Hn1X70VDAURNIXlAXvSsfDJvh8elWoCOBCiBOPsyXW/CLKrsZ+yIawTV1oT8GZ93P4ZcEjuKREunR8Y9JzhXPfLGEgoYlMw2HzddxlkvoWmQWsYQ9JiJ9PkmJzro94McBHv+i5RV6NLsK0VEAAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IQlLi3o/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ikobDEcv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IQlLi3o/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ikobDEcv"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF2fd5J003902
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 02:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=+P3bq4etNNFM6PCEpdXLeDl58RGeK0DM4q0f4mUMgqI=; b=
	IQlLi3o/Ddi+7NDCjVDMkT9Lx4e8r7DVASGfOGtN8hc4hj4dCL0Z8dQInE6WeP9O
	tB6FpEBlhLw3Nkx+CpAgKHqR2l0+R/gNeO+DfUj7JPz6jwNoynQxrQ1+15CcftN1
	CApsx8x2q0gH1EFB4yYbIX5Oc43JS3jirWo8ixISv6RI0TPK0TwFBalq4oQJ39Sq
	UmhKXJhTg2NekdDYYxBxfOHwr/smRbcG6+18gY243u43qV1Wjcz5eis5f6dei52U
	xh9Ww/ibxnFOycXbH80KSiMrTuFpnIiFtURJjQ7QaOzbZrs5KkQkpkElSNbHvBZQ
	V7RffnlVeOxq4sLSDlt3+w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0kc2nr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 02:42:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF2cAvp035907
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 02:42:21 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6bnfps-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 02:42:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4zt0dwXsbRS2q9CMvRAC9jE25dfZOHePOyoZW8KFWTg6qfXuv40bba9s7ju5gI5XheNYs1uf/ixAOhLjgjU/0tS5NDLxxZk9kdOqj5jEyvrE6lypJsk5Jth++nJhZ6dTq1NptDpFI9l9Zp9tlibIsEoSsMjKWMXabIq68ORHi4R7QdHXNlMO6ztw4KppEgDS2wkYZliEfcFLHfg0KTp9aOHpS8CbNHayJsk1x9GpRHEgh6Wscy6PtzsGXhvpsqz8P0TrBPANqdjtDs8wUMba4mFCzgWQPe4+XWonTClI/OcvW/VEVq4mJc9nK42zXG91VhZG2traOc280JN9eivXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+P3bq4etNNFM6PCEpdXLeDl58RGeK0DM4q0f4mUMgqI=;
 b=E2LEoCy8sgLrI7N9FKwBwmY7HuXL6ioMxZWUjF8NV3fcV8thiUE8XLTnqRLdaBZVel8BWnsF73t1y/dq8MmRyYupkXe1ykpMJXJrLruPH9Hvtt1Z8+72YaHpcHrYPsgz0t+g3OMrbX1Zc855fWEQxPXntLCZfyGiwpaneZiA0YkggHgmZe60E5NxmGZ7pYUJBWNWDtPv/eYzRC7Gu9+t4X/kblWvauVfVJ+qySSP2vZnfB/LXZGFPxFg8bH6RpnnOlMMUp/Sd2gww8JsNbI7r1kFe+V6BohmNJneVEsxgXFKlXJKnzbQrM2QgNDdiTr+8qkGaS+yHuS56XVk4k/YaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+P3bq4etNNFM6PCEpdXLeDl58RGeK0DM4q0f4mUMgqI=;
 b=ikobDEcv7BALChOX9wqudayttyjpKD4D/7DmNeASvWxbNl0KfuvM33Kd52U/Bz9/NIWwTlB+CQNHZ/qRrYlX+Fd+oLuCe/PdCUbIqaJcluaSp4CldOX71YDqavy0rNYTWJfQyjV5309nikMt1VMD5+kr1L0vWf5nN2JOYsWf3L8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA0PR10MB7665.namprd10.prod.outlook.com (2603:10b6:208:484::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 02:42:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 02:42:17 +0000
Message-ID: <42969f56-3447-b869-c9f4-8a09fce59780@oracle.com>
Date: Thu, 14 Nov 2024 21:42:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dtprobed: handle multiple providers in a single piece of
 DOF
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241114160352.47939-1-nick.alcock@oracle.com>
 <07a4d685-cc8f-d6f6-0d1d-e5933bddeafe@oracle.com>
 <87frntwnxy.fsf@esperi.org.uk>
 <8ec502f1-47cf-812c-8b8a-3258b1a7caee@oracle.com>
In-Reply-To: <8ec502f1-47cf-812c-8b8a-3258b1a7caee@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0499.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA0PR10MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e9b45f-79cc-41be-4cef-08dd051f1e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WERZWW9vazRtSUVZZkQ3aEJVeXFhTlNmUTJnRU9FZ2ZPNDd3S3VvVnA0bUJG?=
 =?utf-8?B?NVY5Y2NTWE9nUzdXQjkrUW5EWXBvSjQ5MFNnamZNV2xuNkVxR1EvbHdaQ0po?=
 =?utf-8?B?bVVXYWIyRU5kZmJhdkNCRE0zVDJiRTlSYXJHMVltaUxSWlVsSkM1QlRKYjNC?=
 =?utf-8?B?UGt0cTh3UVgzNU9GMURmK0s2SjNSK3ZLSGZzOVhCcUwzam5UOFBvT0J0OTZu?=
 =?utf-8?B?eWRPMzI1a1Z0dllKd0xnYjArdUVTSlQ4cTlJdjJnQ2h1RXJOSjJnV0w5R21Q?=
 =?utf-8?B?VGROaHkzR1dqL0FjV242N2NMMHpOL1dFeVZzZnAwSDdJYUZqRFVYazdjOVZO?=
 =?utf-8?B?NUFuaUZTVlk3dEVjVWhTWjdHN2Z6ME95RWtGZWVaUzVmaVpUSE1yWk4vR0tT?=
 =?utf-8?B?L3NJL3Y2UHRZWnMxMHZZMXhBekg4YkZ0c055TDc2TTRyRGdla0tSdU9Ta1Fu?=
 =?utf-8?B?U0ViY0pBWENDbnZjc24zOExrS29vRXhMK2VpNkZmOW9GRHJYa1FwQTkvY3pQ?=
 =?utf-8?B?R2wyanJhK2JkVVhNQ1d5RmFtMlB1MXptQm1rNlFDWnlmZStEY1NxOEJCczZm?=
 =?utf-8?B?OWE4UG8wejN6a2J4QXFocU5hU0dzaEtRblJzSGtONk1NOHk5REpiSjQ3VDdt?=
 =?utf-8?B?NjNnSWpKR1A2RHBVR3hHbENaNlQ0OC9tNm5uRGVGbVBzR3Mvc3hDMDhVWFox?=
 =?utf-8?B?NGNBdVNhZGhrQUFrNllocEVRdGRMbUtYMkVUTGxaQ3N2bDNOQjhocE5QNTVj?=
 =?utf-8?B?TXdVRUcvTFo0ejB3UWZXUEJyakpYN1J2VzM3T0ppTSs1K0xjanlTNHR3ZmNQ?=
 =?utf-8?B?YVRwblI3TWI0MlNJaVY3OFM2cENOdUxZVWtERkFPcmlYVllGcmpab25Kb2Fa?=
 =?utf-8?B?d1BlWnlyaG9kVnRrdithZ1pMWkYxQXc4eW1CaUlpWVB3dDlCTTJtQ2tlOWpS?=
 =?utf-8?B?QzhGekJ2SWZMemFYb0F1Y1NwQWRIZzFSMEhkMlJVNThwd3Jaa1lmNkRHZjZQ?=
 =?utf-8?B?K0NRdHlsanlmRnZCTGpmTno0QW0rZG9oNG5JdHFndkhRNjErc1pWTHgwWnFR?=
 =?utf-8?B?YjhmdVRDR3MyZmg4ZE1aem9ZL0VUMk56ZytzTk85MXB5b3M0OGhwaHhsOXNJ?=
 =?utf-8?B?V1JDSitnTFhVMVdrYko1VCtTUWNCMVAvRE44UkFIR3MrUkVJWFdVRThvR081?=
 =?utf-8?B?bExpMnJ1cTE0NWd6ckE4WlpvRmhSQW1USzBRaVZDalNMTURKaGxtTkhNK1k1?=
 =?utf-8?B?ejRUSzVPSFVGdG5JMERTZlJDekZES1p6cVd3bzc2dDRmM2Rzems2VitYcGZ5?=
 =?utf-8?B?ZWtiSDI2MWNNQSt5VjRpR3U1NnE0SlBjakxRenMvT3BBUUZJUnR3NTVjU01v?=
 =?utf-8?B?VWhWVFJ6aXQrWmorNjVoUnR5UXlaYzhOam1KRE9OTHZJRFFmckUwYldtbHVI?=
 =?utf-8?B?OCszTzBhdHpHQVBXRlZDT3lqLzJudTlxeE5HNlF4RFg2dG9HaWFvMHBQT2tp?=
 =?utf-8?B?MDB5QjNVMTY0aERxOHh5bDRXcVJqMlRSNjlZVFdvRjYwOG1vNEtoV3RheDla?=
 =?utf-8?B?L3daMDEzQ1M2K1FWTlUvanhwUElQK3dLVlM1ZUFieGlmUTBxa3ZBUENZSktr?=
 =?utf-8?B?Q1ZxcnpNbkowemlMRGVhbTU2aFNLTTFVRG01Zmo1U0FFaWZpemFvRXR6YUEr?=
 =?utf-8?B?YXlVTFVNMXdtQ1JXeWZoSGM4NEJFUnhPUkZFa2N4QjQ0SHZxQ0pqbXhKSkZH?=
 =?utf-8?Q?Axn3jEBWSE1GH9l7+OiXTAYWtku7NB655nk3P+o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnNsTjk2OTJ0UWk1YmNWdFRMcGoybm0ra3JyUHphTDhkd3BrSEZtRVNRUFZp?=
 =?utf-8?B?Mk5rRU05bEl2WkhscWp5M0FpTTRuU1NCSWxBRzUzaG9WSkJRNXZaN05yWWhl?=
 =?utf-8?B?cm00T3VBd2lCbEhROXJvMHlWSEwzcS9CeWs4M0ZlNHphT3lDa0M1U1VTRlJx?=
 =?utf-8?B?TjlpK2JmR0FiNk5oZ1FlYVd6dmQxZ3J3WWNzRkhYZlh6aHRhaGxyUTBkYTVN?=
 =?utf-8?B?YzIyRkRScDNaQit0Q0JWSkNpNVJia1F3SXlaZnQybXVnNXYvcGFsUlJ2QVU2?=
 =?utf-8?B?V1gvVUpvaTNJQytEREU5c3ZwcllVR052cFkrWWZsNkJqZVljTVJtWTNHa2th?=
 =?utf-8?B?RGhnWUUrQVhyVXQ4NlB6ZHdZWTlnSDFHeHY3ZncxeEoyYXBaUnA2amcrRjVD?=
 =?utf-8?B?bllmMSthMEtDUXhYbTY1ZHFhMkk4aXUwb3RhREdaVFI4QkhIWXNPU1JDWVQx?=
 =?utf-8?B?QXJVWXhNdFhRY0lKVGxUZXd3SERyWjhUcFVGQmFkVlJuM0pySzVZall5bGNj?=
 =?utf-8?B?bjkxRjRnS2h1TUwwL2svZkZyRmpZQ3VxY3RtS1luckx2dTd5TGdSZUcyWFIz?=
 =?utf-8?B?dklzTktLdVJmWEE4eWJOU0NpUGdqdEFmSjgzbVo1NlNiWENKbkVuVlpMRGFj?=
 =?utf-8?B?YUlYOGJnT0JXUksxV3h5Q2VLZzZRQVhEQXBZamErdXl0K0F4TGpaenBxNU40?=
 =?utf-8?B?TGdPRFo2eDdVU0V2UUQ3YVlUT1FRMG9EVlZHNDBRdldNVkRwZytWSGNwc3po?=
 =?utf-8?B?aDhOVlVBZ2lRUWIySUlBb2VEcVd0TzVqcUNIUTJVa2R6OUZ3b0hHYU9wYUpB?=
 =?utf-8?B?M3I2MlR3OEJWZndoZlpPUUhmT09hbDFDT2F6WUVNWTZxaGFtQ0xzNnBSdWxs?=
 =?utf-8?B?aFFZekpKc3R0NDZyeDhmckZhUThtaTYrekJETEgxd0RjTHEzYTBlV2NjVTM5?=
 =?utf-8?B?SlVESXFiVWdSRGltU3pUbnJBUkg4aFhYaHVQK0ltY0U3YlFQVzErYUpDMUt5?=
 =?utf-8?B?NGMyeThLemF4MC9aUklZNFkxeVRqUEZhVnZCc3dMUUJOQjE1RGpIaDlMY1VG?=
 =?utf-8?B?UzhnSlZMNzJsMkQ3VCtKK1RWelhLV1dZZHIvRFM4RjVTZEh3MTlGMUZhenVG?=
 =?utf-8?B?bHErMGh6MFJNZjlXNStHVVVvdndTMDlOblFaZTRGOTc1cC9HQnFPeEVPZXJ2?=
 =?utf-8?B?SzB1aDVIZnFSNnJvUnlpL1ROQ1pnSDZlMDZ0YmVoSzhxYjQwOWRzMzZFR0dM?=
 =?utf-8?B?WXg5cVdVaURmRk1KbVRRakJ2MmJMUjd6aHdzZG9jUTdqdis2SkNvbWhMTWdF?=
 =?utf-8?B?S3lRWTlCQ08wS1NDRjFJOUttd1BMbmRwUWJ1UFZ3eGJOV2lleDdUd3NkSmNV?=
 =?utf-8?B?NlNacUptWW9mUjlaOUUwUW1NUlloNi9RdmpIc0NKNE9FVmUvbFBaeGlYRDJZ?=
 =?utf-8?B?OGdoY08ydCs4Z3l3OFdXbmdiTWIxUHpKaENyTXpSQlB1U01MNXJNUEtBQ3VW?=
 =?utf-8?B?MkdZcnlsTWhLQVVDR1Y5UTBzTXI2MlFna25nREJubVpTN216WlJydDFEZmZz?=
 =?utf-8?B?dnN5Vm02dVljclROQ0JyUmRhTGR0aG1qTURDQ3IzcXFlWkJZSzFrSHR2NnYv?=
 =?utf-8?B?M1huSXJJVXFXYWxrZHErMkt2Ymc2alpUMi9WY0FMVnQ0bnJxSVZDTFc5VU41?=
 =?utf-8?B?UTM2TXZUbk9mU0E0VmR2MXQ2US93UDlseEthMzI2YVcrdkdyZ00rOHZ0TzlC?=
 =?utf-8?B?dldiV0JRNEtsNWtYaC9UWVBROGNpcE5iUTVUQjMvWW9oZnpiWVcya0FRTlhS?=
 =?utf-8?B?YTVrS1hrOFlNM0t2YXI4eWFwRlV1QWRyWHQvTHh6M3pOVXl6cDIvaE1KdG1G?=
 =?utf-8?B?Q0o5cGgwR2M3cEd6cTlLOFJDUGo2MjdIclF2MThnZVRaYjVOeUpwSkZINXNF?=
 =?utf-8?B?R1JNZi84M2VJZ2Q4NlVHV2daV3V6YTJjYnhESkZVSDhKUU9yNjI3NFpOUWcz?=
 =?utf-8?B?eTNLUVhta1JTZkUyUHVSR09VSTRoTE82UytqYW9LK1lvNGpaV2xCTUxSR3Na?=
 =?utf-8?B?SDVWcFB1QVEwdjR5cGZzL09GeVpCUGFkeElhNW1EcmEzWDYxbnJQN1ZWRVJ6?=
 =?utf-8?Q?T5by2sJtafQfM13tvJDe3GYs9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ffdtm6Na58WyvCC6H261PWiHD7aqY0fRXEH7JKOVhY5CzI5NHS1IgUDOLu/L0Y56TC18KFDqw0nOuIFjXOUeLWrQTCYrkubvdJVy25LU6b2fXX3FQ3QVtHcTyi9aDo5QWtaOxw/3Icn8y1MjpS6B/4hlCq3OkKRqRR85EHaKP9QVR1T32nqfD35DouCws/oRVQqKvA7B9KtytZeEJuDCcOQzN+F3zckSBdF3I96FU0DSGFNv2L6mOc+dwL9j92xZrrSLpq+nYpYgh+GdBwB3PHrc5Y6TWsaohR2BRE19m9VSfoFABcx5xuPsjE7iQEVnUuNsLZom533g+b7CQPDeXJpB95CNYvdllXaGZuP4Cl65tQkyUUU17l6On/+Ub0r900QQsXJ5Fm7TzqP43d4PxstqZhFdEklfht/lv9it8tRPk+sLSnSY1d4hsDnUBQrtdfaiwqXUKjChgpDTbOB9c791K6CwOR8iJ1awKPZJx9f516LKyQM049JPWXH5OYQ2HdDO8RRLf1SISSHmta3876yfLRWjcEw/v56nScH/fTMx2SydIJFeUlNi/G0tpw5vj9AnLyQZznnFx+NwXEx7lwXXtTgC8gn9bJGrxCT5MFA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e9b45f-79cc-41be-4cef-08dd051f1e82
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 02:42:17.3002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6W0JdjU+GfSAavHPbpmybjkVxaZ5Lsw1qASlFSymGfUMGMdhRID6MIGyoQLqTeIQuZ8gMf/NwRTej4GcI+6dRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7665
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=670 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411150021
X-Proofpoint-GUID: DC57B3gXQ48sUgz1XFhk--i22VqAIz2T
X-Proofpoint-ORIG-GUID: DC57B3gXQ48sUgz1XFhk--i22VqAIz2T

I'm losing track of versions, but at some point I think your patch fixed 
the (same) problem with a different script I was trying:


$ cat x.d
#pragma D attributes Evolving/Evolving/Common provider myprov provider
#pragma D attributes Private/Private/Unknown provider myprov module
#pragma D attributes Private/Private/Unknown provider myprov function
#pragma D attributes Evolving/Evolving/Common provider myprov name
#pragma D attributes Evolving/Evolving/Common provider myprov args
provider myprov
{
     probe entry();
};
$ build/run-dtrace -h -s x.d


I had been getting a segfault (like you).  Now it's simply:

dtrace: failed to compile script x.d: line 5: unused #pragma attributes


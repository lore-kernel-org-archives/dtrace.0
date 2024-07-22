Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EEE1849
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721607060; cv=fail; b=hNPPgXm2wWcyuA5bqsAl2FrCQcVbiGlDRRLMr97T0ZRDWaPgi4CICLtOFTXO8rb6MsK24h0wSNW7iENo9lZx7jiss+ZCYuxpzn6XoiTghpjs2aAD9RSKvX9DYRwYRrv3esHelfvg3slEyBm8HibaM5NMDZFqs10RI21nmoi1wik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721607060; c=relaxed/simple;
	bh=vNcCU+8tn+7NdGUo+KTDTbBtlYDEvY3RDoMC/aQzl50=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h0zMu4aK91oktNCR9wZj6Lx4WNuDaYuZr4dl5rVI0N3wRYYupVkVMX30RikBpjbxQ5qwevV4UiFxfebqa6MgHp7T5TyXEU3s5vZ8IY06A28iDMmjEWxbe2Q8OrRZrmDBLBGH8cvEiPFbCWMCrlwxVeheRi0j0C9svbjWLC0el+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j7s/c/P4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uISHJipJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j7s/c/P4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uISHJipJ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46M0Aemv005277
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=WaMDKEmEwECNLRQdiRs8ad3KCcRxAEaezs/hEIByIaA=; b=
	j7s/c/P4nAUH6nlt87iuUEdB+Qj40zLfHLwwj7gaAgqAasSe2nOv1tlEC3VtCzDG
	oOkkWAt+QOyvM7ftGF+P8pynjcofQ7F2viExnyfJvM1X+9i4p4nzXnKF3fmmWQbW
	6kK7QczGsZGnuzdoBKfTkgcv/OcXjJDomDajhjnG2yOsldMWTeXf/iyBFhBeb/IC
	cBmWHPu1woMeK5Kb4uAh+1pYQdGIM++lj9b++cGenYgHezxFwJyMt3rMeGx6+8p1
	H7rC0IIFeosWndJTSnO9qf/qoJJGvPkR7z0quR5lsqmvtghWs1e0Iq8AJlIkrDlD
	joqaxetNX6S/FZ8k91x8xA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hcn5800n-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:10:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46LNdix9038784
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:06:05 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h26j8utf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 00:06:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkR5f1tBJL9dSJZL/td/ZxoaEceEJmXp6zbkNhHLQeZNth38WBl10AFvYF4WE2kL9W0GTBRsP+Ixz0HntK9wcnsXrF69vmmuCd3T06oVCJXruqJeqKl4o9I1Oc/it0LPrcspjz4cJ6iD5st6fptJpr8NPVhBAwG2bwoAl4QhRRrzgisEoxGkhdpHrlolFYdrhWhXpN8HpIyDxz5WnDgiV82///ztUNVkLMA8a1QXcNTG8yCDzbXSsMYDDaKckiWlHoeLIpYhnNcDSsZKAkZiranRpC8TVEvJqwdhhyZaqFfCduSPXndvqRqfUfZXLe7DYg2AjlfsGDKalg34Lk2zfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaMDKEmEwECNLRQdiRs8ad3KCcRxAEaezs/hEIByIaA=;
 b=k5RR9wxOBrCjMszDD0rCoIiRD36J6aYdYVjQ9npri/ZckbtbZyIcP5A7gaU6ihj2doDz/pOWgvkMIKcT9wOrpMLzPn+dMCyzDyPUGL+U0yOIMyzXn/12IlOTM8yK1Pkrsxpmga1fxmMWXdsfvz4VPky6AxVQUqNqrJ1fBUWf2EH7yBUr6iSiU/ahMm0VBZXE4cTq2GkRThNXuf983sbv6uOVQ6a/jixn3No3PqJWMsWnv1zn/rvw/3umrSWNgE8uEyz2O69YhD3+b1hM1SrbM1PHCBbhdfWlaJnuR4HAKOeEOlQ1xCC3acBBLWjNphkTRebRlow+/KUXyL4PNUlhXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaMDKEmEwECNLRQdiRs8ad3KCcRxAEaezs/hEIByIaA=;
 b=uISHJipJ8vfG0N79uzJ9xnBojy/GsQwBpCYpW6N/XrAfrf5b5klufcufF4/qGBgEazdxsRUqJZ12n+0uvpViQqSSqCgwdFN1iCGxRMz9HCn6eyaJsYULnIidC/brFyChszwUwmMlOs8ZY3hYipxFJJDRnnb8VKEEMGvsLF/YL3s=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB7357.namprd10.prod.outlook.com (2603:10b6:208:3ff::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Mon, 22 Jul
 2024 00:06:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 00:06:02 +0000
Message-ID: <8c7515c3-011a-03fc-a98c-3886ef5365dd@oracle.com>
Date: Sun, 21 Jul 2024 20:05:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 24/38] test: Make test independent of specific PC
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-5-eugene.loh@oracle.com> <ZprUa707RqQzlT1T@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZprUa707RqQzlT1T@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0399.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a54d4a-56b3-4b07-8f7e-08dca9e2129c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEJEck5aVk9wKzMzcUc2dWZ0Y3FGLzhvbWpQNWRjaXlqc0d3a0ljdWxiazRQ?=
 =?utf-8?B?eXlsOEVVUmhYUHdUU3d3bG40RzFiT05waUg2UUNjZlgrcnhCWGwyWGhyL1Bw?=
 =?utf-8?B?Q29VYjd3L3YwcGRtT0k0SG5jZmw1dEo5clJHbGlwc0phazAwTXZLallXMXlY?=
 =?utf-8?B?VkVJOHN3eEp4VEtURFQ1eUhqVWxtdW5tY3dwS3pPaGVVUy9rTVVaTStTRGwz?=
 =?utf-8?B?dERWT2ZQeGpKY0tpald1ditIamhVVVhtZjZQMVhPYjFwMVpJK2JtRGtRSzBi?=
 =?utf-8?B?UWdmTGNkYkFaVFllZDlwaGhhNFBJODY1RkFrY29vcHRlcjB6c1JIUStKRDN4?=
 =?utf-8?B?dGZvWTliNDBlRXo4Mkh4VVAvWWpyVUFhUTFLa3A3c25iNytPWmxFVjI3anlM?=
 =?utf-8?B?bTRiSmttMnJSOWVUQ3VNL0FEOUVIbTJUWUZQU3gyMzRsUSthZGhtR1lyV3VJ?=
 =?utf-8?B?U3ozbTh2WlkyYldkRzR4cm9LNDlYYTVUTnpBRHdJcVJmNVhJZDdZY3lOM1ph?=
 =?utf-8?B?VVRONTI5eit6Nm1wTjBXeDVQc1V0ZEdENytuOWZ4K0RwUjkyQVBTOHBZTHd2?=
 =?utf-8?B?NFFCY3RpSldST29lck9TY1UyNkRQZDlTc1NSZGhVV250WTRyYXRQVGVJNGJK?=
 =?utf-8?B?VnFWc0tUVWk2d25JejdjRUdjOTllVHNnWXR1NnVoalhZU2t6VC9NWU1DdVo5?=
 =?utf-8?B?U3VWMzNjNFZ3TTREK29MR3RXTk1UWTF2NktwRWRIWUlucDM4TUg4aUtiT2do?=
 =?utf-8?B?Yi9yellIS2J5ZEUxalRyZDRVSGt0RTVia043OEErd1hIZGRwejlsTW5NZC9C?=
 =?utf-8?B?b0lpQXJtZ0FrbG9oM3c2bHpRc21NbnhuUEFXNTJHNHZDeDNpMkMxeUFiVXhQ?=
 =?utf-8?B?dzlUVWlkMVl0c3RJeStOWmRpUG9ZSjZ4eDVueDlBK05Hc1FVTEVBRGg5UHdk?=
 =?utf-8?B?TEZvcy95cFpsMzhnTnB6MURUYU5kSzJReGRpVEpIdEx0cTRwUlU5NVRQVjlQ?=
 =?utf-8?B?bVF3TjFhdGdXRStmRkZpa213MDFyT2xqSVdZclpXbDRXdXkxZEQ4dWJYZ0NC?=
 =?utf-8?B?VkpuNDQ3TXAwTmRrUzZEYmV6SVdscmwvVDk4R2E4a2ZIc1Q2eXNHWkg1RkI5?=
 =?utf-8?B?NmZUbzhJR3NQOWRmc0hWMHM2cXl3OXpya0NMSUhHY1BkbEpOVjQ3SG9raTV4?=
 =?utf-8?B?MEpYVkkzU1A3MS84MHZGMEJxOXc5Y1dDaTNJTCtiWlF6ek5UaG9nNHFFQnp5?=
 =?utf-8?B?ZmpVOHkrWGhMZmdWYWRnTTNzY1J4R2l0eGY4Ym05cVRmSzNqWFpMZTYxMDFD?=
 =?utf-8?B?ZkJ0VFNWWTdVQ2NaOU9ScHQvSEl1TzVuMDg4T3MyalF4UldkZXN2Mk1nWjVN?=
 =?utf-8?B?cWFjb3Zic1lkVy81NGpXMWZuMTFYS3RsbzRqVFY1VEVwc0M5aUJtNC84b3VJ?=
 =?utf-8?B?eVVEZCsvcU92bDRZN3NtMWcwME14Yk5Xd3FMSndjdWl5YjVWQW9QbGJFdnZS?=
 =?utf-8?B?THNsN2U5c3hZaEIwdjBDKzIvN0o4bjF1UTRVdktoQUJCdFptQTRoWWZkTzdS?=
 =?utf-8?B?OU02ZGNXOU84d2swQnBYQlZJbGd0OHNicjlqWENsQ3EwWGVBaHpsU0k2U2xk?=
 =?utf-8?B?SC9qM3UrU0lvS2kwazhxOTJqMGVpcDR1LzRZeGU1bFd3cjhUUW9ZMDl1Z2p5?=
 =?utf-8?B?dThHaktJWnNySDFrWStpZTlaREpGL3hJUG9vZzV6UUx5WVAyNG5DaXhockFE?=
 =?utf-8?B?KzA0dG96UHFJTnZXOFBrTUs0cVRXTmJBQjdSZFFCQThqZkd2OWJyUWRrMmhO?=
 =?utf-8?B?UG9Ea2EwWGN0aVBNWVJRQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXlYOTZVNmtMdlBueEI5MHlBOGQ3bENvc0duVFIrT1ZPWHdxTDVoQXRhbjRU?=
 =?utf-8?B?M3RaSHBqOUFFNmtGTjhrZ3JEeUhiQ1ZlWHVQZU16ekFQeEJ2ck42c1ZPQllG?=
 =?utf-8?B?TlZVaVZvZGxCT0l3QktIcUxNU3lOcjdEZkROL0hzZHhmVU4rY0tuU1RJa3pU?=
 =?utf-8?B?YjhNUXRMdWFlUVVLblZGOTZ4ejhSMHFvNlREUkU4VXlmVDluU05GTXlnODRN?=
 =?utf-8?B?UUtRdVhENm9wT1dwa0wxNHRDMzVFYW1vNmg2T2xyTnlDNE4zWEk5OWVndzJs?=
 =?utf-8?B?bXl1ZXcyNFNwdCs3TC96RVF3a1hUMDBDK1hKNEJCQUZLc3lReDllclE2VGQ3?=
 =?utf-8?B?V0NnVGtFZ3o0SEx3TXpQWkZpUVpxQTlOb01TckdQMWw3Ui9VdGxzR0NWUGhW?=
 =?utf-8?B?UlNGVW5wbGcrcHFUUTdpMk1xbllQa3lSdEVkTVc3aUswSkJZTHhpZCtEaHhu?=
 =?utf-8?B?WkZ6TDg5dVRZNVVNM0NlQnBpU2UwcEFNeXUzMC95aVM2S0V2UmdJQ0NBZGhZ?=
 =?utf-8?B?LzlEYXpMM0VjY1o3czE1ZFFjNEEwbm5SL3BYZndxMFRET2VBeExHeFMwMzBs?=
 =?utf-8?B?R2lxdm5oSEdGajA3SU5qNEM0aTlmLzlZZlBQNG1RRUVwNm1mRGQ2TEdBWHkx?=
 =?utf-8?B?NlIwM0RET216U3pMUm9kQ2s4c2xoTDlRYWpNc2FoeXg0SFB4V1dEMDkxQ3lq?=
 =?utf-8?B?cExNNzFRU3NiRVVCbkFxanB0SU44YmtUMGFnRldZKzJWczZ5bytnR1JsWk5U?=
 =?utf-8?B?QmFwYkdYZ013WnNRd044bkRxVDFYZzhyMm95VHBZakM1Ky9GQW95V1pzTkpt?=
 =?utf-8?B?VjJIb2pFWXp2bFpmclowb2J5ZEdBQ0JOZlFQYTZ0YnVaMzB5b2FrVTZVMmhr?=
 =?utf-8?B?V3BVeW5Ja20wR3Y0L2hxZTVHbXVjWDhId0dSZTh0NWtuYmVFWXRiaVgycGJE?=
 =?utf-8?B?MEpzNFQ1bEtSeWg0a1FqUWJOVVhSeGc0S0E0VndveU8vN0E1YStmcnJGS2Jh?=
 =?utf-8?B?L3dWUUlKam8zTVBpcHFGckdad3FjUTh3TGhIZDZEaWt6S3RBYmR6dTh5Vyt0?=
 =?utf-8?B?VmhaT2JVOUhtT0JzRURhRTRwQ1BJZS9lalhIbU1rbVptWHVOQnVwSEZ5Umd6?=
 =?utf-8?B?cC8zbDNuK0tuS2toSlkwemxldndLS1RXeFhsSElaSG9zb25heWlMNmRaNitN?=
 =?utf-8?B?eE1ISUNMaW50L2M4UXZ2cmszMEZmZlFxQ2JMYmNTbTBlY3J5Z2JaN2M2N3JZ?=
 =?utf-8?B?OVE5YTVEVnZhQjk5ZDJzQVNRbEZUeGY1R3FjdmFMc2h3K1NicW1DVEl2enk5?=
 =?utf-8?B?ekRmb0JnZHpNZHJ4azlNd2xKVENOYnJBNzFRaTYvbnhaVTVETnp5YzdUanNZ?=
 =?utf-8?B?NlhLaDRRT1k2OHB2cCs0UGxFVHhsckNSVmZnSE5NcTVpbDNIL3plYXBLSjBT?=
 =?utf-8?B?WlNzYVROL3drS1Uwb2FVbkxwbTZ0VUV6WkZZeEJKUFJpdWp1SW1KYzFiWmcr?=
 =?utf-8?B?ZmI2amlpSGc3SEFINXJYOVRvZ0VOYVhicHdmMFFhalNUWFN6bVFLNmhPeG9T?=
 =?utf-8?B?M1JaZU9JVHJlaStvSGVtNk05Nms0THV6OHNDcmlkRjJhRG5SMCtqZU5mNzJk?=
 =?utf-8?B?Y3BPaWhMdDgvaE1kWmN0NDVGTGVWLzQwYk5FMnIvekxUek5uOG85c2pMYXNW?=
 =?utf-8?B?dVFEdmRzRmt4ZkVxeS9USFRxbVl6UTFuOCtwdUhNYXJJWFo5NVJLRjg3dUtT?=
 =?utf-8?B?cG11VDRIakpFQVN2NkpEYkxuT2p3TVRxODJFckFDVDJBQ3pGenJhTU1qTmYw?=
 =?utf-8?B?VnBIMW11bXJBMmI4VkJqcWhGd1REV1RjOUNxdHNpbCtKcnM2T1I0VGtoekE1?=
 =?utf-8?B?bWRidW5FOWZUUmZ2azM5TTZvNk9QaU9XZmpSejlEN2FXRDZCc2x6Rkl3eWND?=
 =?utf-8?B?SjFJcStYQXRlSUcxNlBWY2FSbjFXV0ttdlloY1p4a0U0VGxCbFhvYStPejBG?=
 =?utf-8?B?WkNtWHZ5b0gxTkhraFBzbGRWM0VrTUJlak5NWGl2azBya0k3L0g4dytDZUcz?=
 =?utf-8?B?cGpwNXc4SDljTUxVNHBGU2cxcUU2N2xsNWwxUkdjMkpoRmx0V09IZHlpU2dT?=
 =?utf-8?Q?jnb3lW/L+HePJqonZWE5RAf/d?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hBdRBLeyxKPOnsSCUUUMXXQv3jmVKVquPzFRIUyaB1V+2/2zC0fH+MlXjP1UqGIUPar3JpBZqMsMiqdxiodqLcSHWfqRvNyb/XAa8Ra6CYmx7oRRshGUiSlqK3j1ongNtvgcNLixci+MBTjxV81NCCMEWLV1Z6HXqeyYDkT1gkLWmb+j0ZBLlSPU3KSiUzu3IxBWmu/OB1Vorj0sB+IEBzP3HLzIGZfskvGLTzc2clHGq21/nHd/rcWMn50gRhdvAgjepSEE1g1UEmf0q58vjcz4awS22g8E6rlylwYzBKHks5w23yjjiFFwnZ8FVcQIuinEkqvakcHCEqBHV/+3815Z0ykGjL15aZkkH7tUB7MCqqXBE2QAUr3IWPOg8C7lQV5RLA9ubMg7kZEmeJkm7YnJKdZg/oUqbQDkSytHayntyCSbiU4jQNxHEYUVOiGq0umVBt/uQ8k1QaPlLxzZUnWqyRyLwgPxHFWgZw7Ie31fbEaMEtSMAJux5uY7kgeaMdeqsVtzFJ3AtJKZu3n+gc+u6e5YGjrUeRqc7+OjrKKxMVHyiGTVr/jzVoFN1srVdqRVVtJ4U8Go+UdWeIBjtG3dio0S3w6OdZl0Mcnjl6Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a54d4a-56b3-4b07-8f7e-08dca9e2129c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 00:06:02.2096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmiTt34EEY4qpcghkvq4iyrqrmx0CgO8eu9VRHXs+zIjAA4U3HOWBXnonkX1uWRjfArRhb6cumdA2TdNzFw2/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7357
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-21_20,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407210189
X-Proofpoint-GUID: SxmD47kG76oZpBxNNg3pdld66ncXWn9C
X-Proofpoint-ORIG-GUID: SxmD47kG76oZpBxNNg3pdld66ncXWn9C

On 7/19/24 17:02, Kris Van Hees wrote:

> On Thu, Jun 27, 2024 at 01:38:50AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
> I agree in principle that this test should not depend on a specific PC value,
> but that leaves the issue that with this patch, I do not think there is any
> real test to verify that the PC value is sane.  So, that probably should be
> added.

Hmm, yeah, I guess so.  Okay, I posted v2 (with a tweaked title "test: 
Handle dtrace:::ERROR arg3 specially").  Also, I posted a v2 of patch 
25/38.  You already R-b'ed it, but it gets modified (in a very minor 
way) by the effects of this patch.  I'll assume your R-b still stands, 
but take a look if you're curious.

>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   test/unittest/error/tst.DTRACEFLT_UNKNOWN.d | 6 +++---
>>   test/unittest/error/tst.DTRACEFLT_UNKNOWN.r | 2 +-
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
>> index 001903ff..bfc77bf5 100644
>> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
>> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
>> @@ -1,6 +1,6 @@
>>   /*
>>    * Oracle Linux DTrace.
>> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
>> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>>    * Licensed under the Universal Permissive License v 1.0 as shown at
>>    * http://oss.oracle.com/licenses/upl.
>>    */
>> @@ -19,8 +19,8 @@
>>   
>>   ERROR
>>   {
>> -	printf("The arguments are %u %u %u %u %u\n",
>> -		arg1, arg2, arg3, arg4, arg5);
>> +	printf("The arguments are %u %u PC %u %u\n",
>> +		arg1, arg2, arg4, arg5);
>>   	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
>>   	exit(0);
>>   }
>> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
>> index b11f6c99..3e7caac4 100644
>> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
>> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
>> @@ -1,4 +1,4 @@
>> -The arguments are 2 2 4 1 64
>> +The arguments are 2 2 PC 1 64
>>   The value of arg4 = 0
>>   
>>   -- @@stderr --
>> -- 
>> 2.18.4
>>

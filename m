Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4C13939BD
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086478; cv=fail; b=qyz2qeRQ+xyQ/zxCMDWI7gPblKMINAdBpyl1p7TFEm8EzzrWv2R1psvXewqbUOFfAWNitH3a1nHwimYsebRmHM4jGk7Hoh1b/BtHlRLhstmCb6F7pki27FoJ4hu6hE/OC6Otq31mkgQZqNuUSG7vg7S43nkpDVnSAK4aXn2n6Lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086478; c=relaxed/simple;
	bh=ezSetwYPVFmS6dIlpU1VJ8NmXWuJU93ZW5+hoQqrKds=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=erdtbpMdM2iYQ6QojI4Bm6EfR/xJAfhXRgP+vIacy0jAHzdCakbhtKlNk0P8uN/NkhnGDUZYD5v3Dh9mp6goGPaQ+9kGCb14IY9OUy44UwLi+8yEn+9/S49NTsOcAZCt14dl/On7lPBs+6gY5VN8H7d4Vkce5uDB1Ru/21TPXr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EX9UlkXU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ToNkMvmC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EX9UlkXU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ToNkMvmC"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UAGsHP3537858
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=p5/PHNWk5ywZhPZDDMnlmbz1th2B7P88we5AaZpD5IM=; b=
	EX9UlkXUmCjMG+s5ybeL5o30OBtzXg5IKVMY3yXPFbw7hv+ta+vo8EIJ8UCr+H0x
	gnwy9EOulSs+DpWQmV59vipFqF+nww4h4Z30h545pmvuVfuiohcEzyOwULALAzFv
	zY/FJKaBWlJ59Nlq5fzM6Q1bTB/+SiGYWnQM1pzp5FIUGwKOHAIqRctH/tH85Y67
	/rUrIkn3TYlAquny2b2GETwGV2jURkGxjxAVi6W79OF3k3QJyOJWuZCAi927voBY
	OYpycrqtBzyVLcqKfAuQjfUW5IlbpZiSS+m7TEuw4LDE/6L88QRq7/jw5H5Hd/k2
	0ecEhPZTJW1GVLMGRs8YgA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbpbas83v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:41:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67UAeVLH010361
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:41:14 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvnkr89-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:41:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lg2ZA7DhjRv/Paru2dWRTxWiZbSn+o/oJOoi4EV1jNOSw1EBbiR+tiqDvPzf/OVyOKcOEZtH5Y/cQY5uipl40OSYtIZpHsy+DSci1br7tmsvJ9RJGJnrWJcJa5KYYqBPe1VlcxgJBrcD6qOhrE0DQASby+FO+sQ+QLRwUNOilNzgT7aZxyoTlH+NZ1sZlxYaWl542HYRZr3K1zrvLvCNzl8y63wN5oyd4zatiLDDVz3QRZfQBH3V+/vmn2AFbw2eHnhPJfaloeweGqgZRFjydyA1p1u8icHPsxNuPSwCFTiTxYXqzlgHI1a47aBHm19J7wTb4g/qpu4zxmXaRem8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5/PHNWk5ywZhPZDDMnlmbz1th2B7P88we5AaZpD5IM=;
 b=MCHF7JJjn/8MljImPMUJJsxmgMhDpXf9PN+fGbELL+scEMzT1X0OIago6XUiv9pzSZVVdgwQe8AHWg1CtfXx6tp9MSgAtf9GXYPSdvq6AN9sFzqt5CImxsZGl5uGiezKe3FLuFwoOOhmuDibNDDk/eaFj1bJyd4EOf+OjnYZl18fXi9BWcIXgIjtnb9dlsA8OdVBFZUQ4pzqskDb6R6WOtpC9YmCraEp/j8WdOk9S9KALedl/yxuvO7CeiMLXw3BVTGffKBmPulW1YFohq9UmnI3ooKiVNbHRloTLQIXIym60ika3b3xk/5WS0Wy/xZ2OTYamjq8EMgdkm++YtJtBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5/PHNWk5ywZhPZDDMnlmbz1th2B7P88we5AaZpD5IM=;
 b=ToNkMvmC3QVpWEOBSij/h5PnMHrrqP0PntBjMgcSmdi6hJlZPqyukbGgOLA6T6/ax/j/q4SAiS3xY6KTMuJNHOZxYpcIeOEev4A0v4Mr8v+ZP3vD5CZmfg9OTgWmLWwszvwaxqxOisLjAWyRqEEuBa08pgpeDusnIq4gFBT7CaA=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by DS0PR10MB6872.namprd10.prod.outlook.com (2603:10b6:8:131::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sun, 30 Aug
 2026 10:41:11 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%5]) with mapi id 15.21.0382.007; Sun, 30 Aug 2026
 10:41:11 +0000
Message-ID: <5ee321c2-d2d1-4fda-b542-9e2b9a63550b@oracle.com>
Date: Sun, 30 Aug 2026 11:41:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] dtprobed: fix dof_stash resource cleanup
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <c330147d9064a35a28bdc2606068251a@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <c330147d9064a35a28bdc2606068251a@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DO0P289CA0014.QATP289.PROD.OUTLOOK.COM
 (2603:1096:790:20::13) To BN0PR10MB4901.namprd10.prod.outlook.com
 (2603:10b6:408:126::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|DS0PR10MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: fbdd9a19-284b-475f-1ef0-08df06833544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|17002099007|22082099003|56012099006|3023799007|10067099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	LO7V1hz90adjoJ4aUe94vuH+rJx8AWJUzT5nQomN20x43rOWI79TXhirI2bwfWMVHzMlONSU0gFTeIiMZEktrgIbuMWaKdJqFqgdXKUWZz20FQ19/mOPVuSS5rVdiWXndFCsNAe8IARHx3N2xB9JuLtxlfd1YF5/3a7T6B1t2K7bhb6ilQaGDpi5qMc8zsq9JWS+3s4xA8yprwIYQSFcpkMqB1z1hjKVOtnfj9Q6e9XQd6aBQ9wsiHL3wKBXT9HKAPxoPNw7CD+nVc7IrCTSZpx7N4wQ0YGPltpxpfeHOpcaeX1sw1Sgzd5euJKwKob4DP13AEL6UFXjoQlEZxQq6TsMk8f3T5isWKVyetAMjDYB1UZ0UaNumqJEWiVi13uypphjy6Z6eZpfKBOPHJT68gEmr0udKEeV177m8IKNmulxn9qhvhSTzlLFAGf9cOMlZRqPvdQjqYIviQ4m2qx/mxTK2GoY6kWWHCZnX9Ho6wAY6CpiTAWwqxxFsffAmxJJmhZqs8N/HpmRKM0UBaRaWb2CA+QguniDYDbXx6K+2tSjLKOY+Wi5HrQMqErjVoKsZJrTjDML39AbycLfeY65iskpyOw1KQh6cw+zyCdLFZ3TbKT9Rhflnt8qtzAXeXE7hGRS0QEFe+0JSVKRXMfELPKiGyMagdshqmQATP/uoOc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(17002099007)(22082099003)(56012099006)(3023799007)(10067099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0VWTzR3VDVsNlRvaHlwTngrYVQvc0N6cEFEZVFwM1lCeGp3YzEyTWtLU0Fm?=
 =?utf-8?B?OWxUL1RLRFJkeTdMZ0FJOVhJZDRqbGxqRWx6dTJIeU1pWHVRV0JYeTBaUm83?=
 =?utf-8?B?QnI5WUdCa1QzS1BWb2RWSmRTMFVWQ1E3blZQa0hGUXJXdGM5Y2tLRkhZNjVF?=
 =?utf-8?B?enluNkw1alhJUisya2FDMDdQQW1pZGZTM3ByYU5IV2t0U0srRUpRRW9Cdisy?=
 =?utf-8?B?MkZBMU1VbEZPdTNLMURISmRncGhFbUorTjNLZXZPUUpDaVpoa3RJcldoY29a?=
 =?utf-8?B?V2FTZjZybWZ0cjR6eTRnWGh0MXRwZURtRWQ0clNTY1RjalpSa1kxSG45bkd4?=
 =?utf-8?B?NzQ5VEM0Q2xnTlZwbCtUYVFuRGFZak1FNzlyTTZIWGNldDgxSWp5c2VibHgr?=
 =?utf-8?B?N3RMK0s3cElDY0oyRTN0dXhmME1yTnNsMDNkY25ZUFRhMFNIUk5OSHAyR243?=
 =?utf-8?B?VGREMDNNb1g5ZDlvRW5waUE0ZVZTUHpwWGppR0h1eStsMWRVNEQyTmFiTzJS?=
 =?utf-8?B?OUM0US9JMW45VmprWitWMjhkNHlRemRXZEV6aktSVFRLWC9VVm9hdHczYVFG?=
 =?utf-8?B?cEI4bEgxVFJwUWNRS0lxdGljaTQ3UU40RkFkaFR1SGN3SDFwS0RBb2dYTEg2?=
 =?utf-8?B?QUxsZURyTjNONU94Z2hZVVgrK3hGYStkNjlZaVZ2amlWNTRGc1ZuUnhtSVBy?=
 =?utf-8?B?VUdLR2JNUm1tQXZPNWhUN3N3N2wyZ2ZYb0k4Qk53MGlObXBMRXU1dU4zWmti?=
 =?utf-8?B?WkhaSUFpRjMyUGdnVjB3TjI2SW9WYlJ5QjFxOEloOEhGZ2dCT09pdjVCSUgr?=
 =?utf-8?B?blhzVkg0U2x6aXFwcUlScDRrYlEzaWx4T1IwdHR2S3ZHenJKOVBiTDBHTW1n?=
 =?utf-8?B?MkowYXg3TGFxekMxZDhZc0QzOGJ6cjdvV0cvczZxbmxUaGZyUHVGcWVYQ2Uw?=
 =?utf-8?B?aWZnWCswZUZkM2VWbllqWW1SV1lEN3JFNmJneUFDRmpiTHlkR1pnRUJ0Zm9y?=
 =?utf-8?B?S1FGV0REb1hRcUFiQm0yYjdkV0ZsZmF5aWhweVBDTnBtSVYvd1FjR2tibW1h?=
 =?utf-8?B?M3lLbWVKOS90QkxVRFk3YTB4eTZuWU5aWDQwNUZmMWpsR05tdUxZcWdPSGNG?=
 =?utf-8?B?QzdJN0NiTEJxSUNWUmQyN3FKNnVzeVI3eWUwZHNtK251S2xlbnlveWxpdS8r?=
 =?utf-8?B?eXRDeDVpVDB4U3FMdXBvSnJjV0p6eW9vQ0prdWMxaVdEcktzeU95M1B2NHhq?=
 =?utf-8?B?elhKQVA5VVdzcU85QzVDdTZ3R2xOdXc3cGpJeG50VDcvdCtyZzlIK254dC8v?=
 =?utf-8?B?ZTliQSt1UFpTN1p4Ykd2YlAzL1NKQW5mYTMvZTB4WTV4NmFUVjZocDVCeWh5?=
 =?utf-8?B?QXMraVlyWXJ6ZzBua2d6ZTZqVkJEelo0TUFyZWtpbENtWVoxTUdaNkxJYzUx?=
 =?utf-8?B?d0wwbEVUUWlweC80ZmluUE80MXNKUGN4RldHdE5Qa2h0c3plOVNLRVVCOEFt?=
 =?utf-8?B?MDBVM2IyM2NDZVJaVTg0ZVBqNUJUL3BGdkxQZmtIWWRleXNGWm5Pcy81d01n?=
 =?utf-8?B?SjhXOW9TZUxPWStaNHFEZVo2RlhzcGlqREpkZEJneG5aT1QrakFXdlZJOWZh?=
 =?utf-8?B?cU1KdVZIRHoxam9mUkMrVzR3dk5ybEUzWEhoRFA2OFczTWJMYjgrSDF6T1FL?=
 =?utf-8?B?VmVHaVY4SVR1RzhjUGVFQTlVUks4TkRLL2JNOE5BbkNpcDFoNytQaUxUSUxC?=
 =?utf-8?B?RXZmSTdUbDZ6QnBTc3pRMFdIRkdVSHdqVFNYSUMwRU1UK3FZNjA1Y3hCd1Bz?=
 =?utf-8?B?anlnQkVuS2NaQlE0TTE2MUpGaEdhRkwrbDd3ZXJIVXd3dmNIaHdObGdMaDc4?=
 =?utf-8?B?NXM3a2VlelN5ZG9ueUwvVUxhemFYVTRaMUMyNk1EV0lMTTdCcFVONmp2NnZw?=
 =?utf-8?B?NzU3SUVRUXpzcHpSNFNRbVZ4d0Z0dGpMcWpIZE1lbURGWGovVC9pdEZBeEdr?=
 =?utf-8?B?cWd0ZjY5eGFNUkxnc1VoYXduTEZPWVY5WStsS2FHRjBMTHhrS3ZKdHJjUG92?=
 =?utf-8?B?eWFsZlV5Si9EWUFTbXlVZ0hOUHdKQTZWMEVFQWZvVmxCeG4weUZ5MEtNbkVz?=
 =?utf-8?B?TERlTVBMRUhlZHlNL3ltWW1aTVV0eGFsNXpPdE5RWTJpUzNvcktYUTRrTzlz?=
 =?utf-8?B?aHZGYnZMa1V6MUdMVEl6VS9tdVc0YUdqaHkwTHZBOTRhakFFczJ3UWMrL3Ew?=
 =?utf-8?B?UDcvQVhhTTJabjJoQVV2QmJ0ZTM0SGlFWUJZMTU0c2JEd3A0UlBpTCtkVkdq?=
 =?utf-8?B?RXNZQ3phdk4rU2JlVFBybkJmWTIzOWx1SXdJaThJMTZaRUdZY1lXUT09?=
X-Exchange-RoutingPolicyChecked:
	372Cb8fiV7VXd71zPzRYdmxRd9Gir9D39exqQz0TxMf+nMXilQOGqI6HuC8LaMJ/FyItxq+J8CBOfXpAB6r1FiYt+sQb1ZOkCKCrX4W0/95nXxh7xs39yyOgK82StM16YXywL4GUhHTWmBIdvIZWAMCxHViX5ZxQNvqakVZ5ux1il2JRRHcN0uQlRNAY+OrLEJASE0t5A3OpKCE4kcAs718uyhsIehsjHzKOajsvGiOXkn1mNUFy8JC+gBmcFAjjWWLk3qxupL/OoNFJx4qsIILYxn6pS+hzuTXerTOQ8RVSN8SJDCP1xZnmR8LP6Fhn7ew8ld08c8brCDQ/m09tag==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xnKAsL6E/5fIDy2yrHSOIASHeaGQ+XprQmchGd7pyX6BBy3NfDgnx99dmNdqiFrEV23NXJ4ztKOIx9CpeneJieATp5oRsqq54Ro/2YecExeqw/sPsyovFTphAUcMvclxdbGkcTs5jSFyorw8DdzC3XjYcdVPtYkCb/upOe140pQUta75UZvQJAsdUjKVL88/7rDIyiWYSsLKK5MVUG3NysJlVguHYhGiJNOquaclxCKj44XgQYd+Icgrkirln7LI/rCzB2uRCdcRzvT0ABOhveEfk3QA0AUCOMGfAQJm+x9Z4CwbZ0HW9ZH0RpAN0F+aswsH0w89IlT8EOXK1S/bNw55+SjluCqVCsglGh4B4X3r77js1I6iv61XLwlVZRDHFP6dimlSZdWjacn1k9DiyU+uuzd8oogK9x1HImMdq/LRMCRz6TOUgYxH/pFxNGj0vr6sWU8qIG37kDM5h6jWhu2MTAfhk2h7RWKUMRul22yVxZlZ+dhGtDGIXQ8chJAawVNH/t1D5V05O4bBmzmjpIFG1b7Owzli7h67xvYNqs4yqojT8WpcKmGaoEL50TI6hHOARIvqBKamE9+f7p6qHFPRV2sfG6/D3ew+pNstPj8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdd9a19-284b-475f-1ef0-08df06833544
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4901.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 10:41:11.7717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0S6G8PfCC54fyZf2n7PCJPokiHd3uIY38OYFn+WFnuZHiWWnfzm1LfDA2cpyjZNGLgDBPYQCXYLtasTclo/tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6872
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608300090
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OSBTYWx0ZWRfXxEW6toooARCf
 yac58pj4DRkUdVcBBVZmuLtXYFMhM6Yq70TR+GZ0H27c26GeEE1eG7drwWkCEFVd2kvIeV7sJg9
 hYJ5I6h9gPmGU7tEX2PBDvlCYa2p7KTzvwucXM+k+C+3Gi5HO7IL
X-Proofpoint-ORIG-GUID: jqJF-ztVz-Y2UbLiNxiffJFcr8A0EDBw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OSBTYWx0ZWRfX1oFbZ33I00zC
 ouBPFn99Vb9edDlTGoNu8oaXOQHvkWZ7GB/DtrAY/2gyIk2m2s8qKXtKeQfF9TX0CWOPnDjWzqV
 /swnObrGlKWp10pZrgJX7sG3NqXQMd0KpaQh9yCJwFWEJev4nLC7v8Fa6Dh50B84HxMG9mJYyb7
 kNvL6PKEJCvofDlziqbfoIEVJn4w8zxC0o3Mvx7ZoGlMG0t+kEmiDP2GMvMPegQ//I8HPyalguE
 27/6ovd3ISBucEygrIz/jFyauyeGdSdyUrsi0f0TQuuCTwMEjeBA7euxoH1leGe/6b95rhj+bh5
 N+aeXtBoSew0iVZUpIUSaNxEWPlZTKjvDJntlW+GJtJPkhSreqIG3UygJDCzgdO9huS6dhTdyy9
 MHea06+ezJusEkkiZHZwj32sHSvFcJ5WfJLFSBV5gwqO4nRoY8gOenxy6An5/qUbAUxEfE3yiXf
 JwwyAFblMe6iZaQqKHUsjmb7dyAFXKpuB4SlKbvU=
X-Authority-Analysis: v=2.4 cv=DMi/JSNb c=1 sm=1 tr=0 ts=6a9408cb b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=eL_1wEreiF7Rnd4EofsA:9 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12101
X-Proofpoint-GUID: jqJF-ztVz-Y2UbLiNxiffJFcr8A0EDBw

On 28/08/2026 20:09, Kris Van Hees wrote:
> Close descriptors and release parsed buffers on every path when scanning
> and reparsing the DOF stash.  Treat any non-negative openat() return as
> success, clean up exec-mapping and raw-data reads through common error
> paths, and avoid leaking mapping descriptors when reparsing can be
> skipped.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

> ---
>  dtprobed/dof_stash.c | 125 +++++++++++++++++++++++++++++++------------
>  1 file changed, 91 insertions(+), 34 deletions(-)
> 
> diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> index 891d7a69..6e62bdf6 100644
> --- a/dtprobed/dof_stash.c
> +++ b/dtprobed/dof_stash.c
> @@ -304,7 +304,8 @@ make_dof_name(dev_t dev, ino_t ino)
>  {
>  	char *ret;
>  
> -	if (asprintf(&ret, "%li-%li", (long) dev, (long) ino) < 0) {
> +	if (asprintf(&ret, "%" PRIuMAX "-%" PRIuMAX,
> +		     (uintmax_t)dev, (uintmax_t)ino) < 0) {
>  		fuse_log(FUSE_LOG_ERR, "dtprobed: out of memory making DOF name\n");
>  		return NULL;
>  	}
> @@ -317,12 +318,41 @@ make_dof_name(dev_t dev, ino_t ino)
>  static int
>  split_dof_name(const char *dof_name, dev_t *dev, ino_t *ino)
>  {
> -	if (sscanf(dof_name, "%li-%li", (long *) dev, (long *) ino) < 2) {
> -		fuse_log(FUSE_LOG_ERR, "dtprobed: per-pid directory name %s unparseable\n",
> -			 dof_name);
> -		return -1;
> -	}
> +	uintmax_t	dev_val, ino_val;
> +	dev_t		dev_tmp;
> +	ino_t		ino_tmp;
> +	char		*end, *ino_start;
> +
> +	if (dof_name[0] < '0' || dof_name[0] > '9')
> +		goto err;
> +
> +	errno = 0;
> +	dev_val = strtoumax(dof_name, &end, 10);
> +	if (errno != 0 || end == dof_name || *end != '-')
> +		goto err;
> +
> +	ino_start = end + 1;
> +	if (*ino_start < '0' || *ino_start > '9')
> +		goto err;
> +
> +	errno = 0;
> +	ino_val = strtoumax(ino_start, &end, 10);
> +	if (errno != 0 || end == ino_start || *end != '\0')
> +		goto err;
> +
> +	dev_tmp = (dev_t)dev_val;
> +	ino_tmp = (ino_t)ino_val;
> +	if ((uintmax_t)dev_tmp != dev_val || (uintmax_t)ino_tmp != ino_val)
> +		goto err;
> +
> +	*dev = dev_tmp;
> +	*ino = ino_tmp;
>  	return 0;
> +
> +err:
> +		fuse_log(FUSE_LOG_ERR, "dtprobed: cannot derive dev/ino from %s\n",
> +			 dof_name);
> +	return -1;
>  }
>  
>  /*
> @@ -366,22 +396,19 @@ void
>  dof_stash_free(dt_list_t *accum)
>  {
>  	dof_parsed_list_t *accump;
> -	dof_parsed_list_t *last_accump = NULL;
> +	dof_parsed_list_t *next = NULL;
>  
> -	for (accump = dt_list_next(accum); accump != NULL;
> -	     accump = dt_list_next(accump)) {
> +	for (accump = dt_list_next(accum); accump != NULL; accump = next) {
> +		next = dt_list_next(accump);
>  		dt_list_delete(accum, accump);
>  
>  		/*
>  		 * All parsed memory regions are terminated by an EOF, so once
>  		 * we encounter the EOF, this region can safely be freed.
>  		 */
> -		if (accump->parsed->type == DIT_EOF)
> -			free(accump->parsed);
> -		free(last_accump);
> -		last_accump = accump;
> +		free(accump->parsed);
> +		free(accump);
>  	}
> -	free(last_accump);
>  }
>  
>  /*
> @@ -972,7 +999,7 @@ dof_stash_execed(pid_t pid, int perpid_dir, dev_t dev, ino_t ino)
>  {
>  	char *exec_mapping;
>  	size_t size;
> -	int fd;
> +	int fd, rc;
>  	dev_t old_dev;
>  	ino_t old_ino;
>  
> @@ -983,20 +1010,42 @@ dof_stash_execed(pid_t pid, int perpid_dir, dev_t dev, ino_t ino)
>  	}
>  
>  	exec_mapping = read_file(fd, -1, &size);
> +	close(fd);
>  	if (exec_mapping == NULL)
> -		goto err_close;
> +		goto err;
> +	{
> +		char *nul, *tmp;
>  
> -	if (split_dof_name(exec_mapping, &old_dev, &old_ino) < 0) {
> -		fuse_log(FUSE_LOG_ERR, "PID %i, exec mapping \"%s\" unparseable\n",
> -			 pid, exec_mapping);
> -		goto err_free;
> +		nul = memchr(exec_mapping, '\0', size);
> +		if (nul != NULL && nul != exec_mapping + size - 1) {
> +			free(exec_mapping);
> +			goto err;
> +		}
> +
> +		/*
> +		 * Current exec-mapping files include a terminating NUL, but
> +		 * older files do not.  Always append a terminator so the parser
> +		 * can treat both forms as C strings.
> +		 */
> +		if (nul == NULL) {
> +			tmp = realloc(exec_mapping, size + 1);
> +			if (tmp == NULL) {
> +				free(exec_mapping);
> +				goto err;
> +			}
> +
> +			exec_mapping = tmp;
> +			exec_mapping[size] = '\0';
> +		}
>  	}
> -	return !((dev == old_dev) && (ino == old_ino));
>  
> -err_free:
> +	rc = split_dof_name(exec_mapping, &old_dev, &old_ino);
>  	free(exec_mapping);
> -err_close:
> -	close(fd);
> +	if (rc < 0)
> +		goto err;
> +
> +	return !((dev == old_dev) && (ino == old_ino));
> +
>  err:
>  	fuse_log(FUSE_LOG_ERR, "Cannot determine if PID %i has execed; assuming not: %s\n",
>  		 pid, strerror(errno));
> @@ -1146,7 +1195,7 @@ dof_stash_add(pid_t pid, dev_t dev, ino_t ino, dev_t exec_dev, dev_t exec_ino,
>  		 * already-existing file as a do-nothing condition.
>  		 */
>  		if (dof_stash_write_file(perpid_dir, "exec-mapping", exec_mapping,
> -					 strlen(exec_mapping), 1) < 0) {
> +					 strlen(exec_mapping) + 1, 1) < 0) {
>  			free(exec_mapping);
>  			goto err_unlink_nomsg;
>  		}
> @@ -1765,7 +1814,7 @@ read_raw_data(int dirfd, const char *fn, const usdt_data_t *data, int idx,
>  	      int dummy)
>  {
>  	int fd;
> -	usdt_data_t *dp;
> +	usdt_data_t *dp = NULL;
>  
>  	/*
>  	 * If the file does not exist, we assume that we have reached the last
> @@ -1786,18 +1835,21 @@ read_raw_data(int dirfd, const char *fn, const usdt_data_t *data, int idx,
>  	 * to this next pointer and end the block chain.
>  	 */
>  	if ((dp = malloc(sizeof(usdt_data_t))) == NULL)
> -		return -1;
> +		goto err;
>  
>  	dp->size = 0;
>  	dp->base = 0;
>  	dp->next = NULL;
>  
> -	if ((dp->buf = read_file(fd, -1, &dp->size)) == NULL) {
> -		close(fd);
> -		free(dp);
> -		return -1;
> +	if ((dp->buf = read_file(fd, -1, &dp->size)) == NULL)
> +		goto err;
> +	if (dp->size < sizeof(size_t)) {
> +		free(dp->buf);
> +		goto err;
>  	}
>  
> +	close(fd);
> +
>  	/*
>  	 * Raw data blocks are written as a base address (size_t) followed by
>  	 * the actual data.  Set dp->base from the data just read, and adjust
> @@ -1810,6 +1862,11 @@ read_raw_data(int dirfd, const char *fn, const usdt_data_t *data, int idx,
>  
>  	((usdt_data_t *)data)->next = dp;
>  	return 1;
> +
> +err:
> +	close(fd);
> +	free(dp);
> +	return -1;
>  }
>  
>  /*
> @@ -1930,7 +1987,7 @@ reparse_dof(int out, int in,
>  			 */
>  			if (!force) {
>  				if ((fd = openat(mapping_fd, "parsed/version",
> -						 O_RDONLY | O_CLOEXEC)) == 0) {
> +						 O_RDONLY | O_CLOEXEC)) >= 0) {
>  					uint64_t *parsed_version;
>  
>  					parsed_version = read_file(fd, sizeof(uint64_t),
> @@ -1940,6 +1997,7 @@ reparse_dof(int out, int in,
>  					if (parsed_version != NULL &&
>  					    *parsed_version == DOF_PARSED_VERSION) {
>  						fuse_log(FUSE_LOG_DEBUG, "No need to reparse\n");
> +						close(mapping_fd);
>  						continue;
>  					}
>  
> @@ -1957,8 +2015,7 @@ reparse_dof(int out, int in,
>  			}
>  
>  			if (split_dof_name(mapping_ent->d_name, &dev, &ino) < 0) {
> -				fuse_log(FUSE_LOG_ERR, "when reparsing DOF for PID %s, cannot derive dev/ino from %s: ignored\n",
> -					 pid_ent->d_name, mapping_ent->d_name);
> +				close(mapping_fd);
>  				continue;
>  			}
>  
> -- 
> 2.52.0
> 
> 


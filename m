Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC9C1C9DE5
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755210313; cv=fail; b=Is3e8vc80RXzfXAwFDW53Wq3U8A1+1gbcikrmyhZKeUEhJgNJYFF36q2mgYiv2Ez6TkFqabf0NeD2GFEONrksWj9BdQWHeJ5ioB1d3Z82Z3HmswsRJwwe86qH7E/SvBfWfa7BHXYS2U7fyAjvzCr8HRXb8Z3SfpOFM50tFZAmvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755210313; c=relaxed/simple;
	bh=ttZNOvIoHLAhzvH7btSJ+dP9vqKAphb5pn8CYNRtLN8=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SrmAFy6k9/Yz90VNpPBCyr59oX1OIc8uPTx89UEGOryMu4exKcwuAGKiQ+59M8YDtzBzNm+sbmEmKwEs7PUc6kTGvQzCPVwdDpRzLloG0XpAQ5mmygYpUiZ4kgtGiseXWCyb2cMPWUWlYczFqt8tZ29F7Rti4/SfwzoGv+P4SGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Mk7DKDot; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vUTDOxbv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Mk7DKDot";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vUTDOxbv"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfqQI011986
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8ecnLeUowdFgwmT7Qi11L+GhXvMoUM3Pi0IMjoSFVlo=; b=
	Mk7DKDotghWNQKzVgnNf3p9rG4p2G/g8pnI9G06MPL1eSStfLdG42FN/73U9Soo8
	+C7vufi8UQnao1fMnSWQ0u1xP9/vjX1Hkvx0ehfEVSN+mY0yTP4c6a7nUspWajxj
	D81mDX34OaWEHvTFagb7XDKe4aBLeWJohzCEEWm36B4UK+dzkzU0VDD0R09OuJeT
	HxpL/E9n7BvjzIhGtw7QhlLlBJCnvRLS1ZfttVI2Y7Ks1kFdecRWLmcs/W1JWrdm
	gvreyT+UwvCZq7w7a1QBkFMdKGdYvTtXnoTVRcdiLW87GZjIm/6QHUyHwOpKrv45
	lPkLHIWY7br9W56s/+kBFg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4k2yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:25:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EMOsf7030039
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:25:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsdapua-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:25:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAM/eL3/tc/X6n3OTG1hsbVmiJ4Kk3Gw7CihpV5SRPzwI5kz93gFv1QB6UQ1tJ0Wqm3H+gfQZGnOAF1Hxvtm2GJnOzmQEd/uSGQ13p+OcKLPR8uHNlVmGUtJLDJhnDSO9NzoTJKYMDvcOLYKmIIFeZSD2onNhpktyn6fWIEYrmY3Yy4OZ9tnhbEr4KJsIeDnlMU3lT0U0eDrXm5Qg11Vke7Z0pR4enegfpsN5bXcz005J1fU54FET6H908AymutHASkAxfebL4brre6UNpZwCJ5L9+CQ/K/YmHTq+RApzBTCZp+G2/iFVmu2PV4hc8syZvSU8R7MeRMgkdlwhs7IaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ecnLeUowdFgwmT7Qi11L+GhXvMoUM3Pi0IMjoSFVlo=;
 b=VN6rYrkfRfnXmZvYvwNe7z3N8GN4jjmQMyUqvNXKvTTuQrublCtgVh95anyClqGKr/nv/URLCJ4Jfn8N9NbG8zfcoOyzgdX7prog5mbLAu7uOBgcW1ht4xIIewqnLxPHhcVqDD7QPm8kN56Y1UNG4reELzwvz+ct2/tZWjNpupd31/p4PWkfh90M5TlUO9zQlfZGZJex48JW0xR1t6PBzZWwDUAnNg5yZAkkgvu2miHVsytztjgtEVKvc2Gp4yX4pIWUOS5Z7GoPcPzTBeX9vXnYQvTpuHyGULMjPvfn8XgAzblghO8DU5C0QEY4cm4+w18fjvy7DRetpG3xOh1vzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ecnLeUowdFgwmT7Qi11L+GhXvMoUM3Pi0IMjoSFVlo=;
 b=vUTDOxbvI8oF15gQ1Q0rL9e4EnyECDenYCadOwt8F8hT9OSbM0PnbfHrk9IwueXvGhWsMIBYfkYTvqHo8TjSth3bc/5dYE5X7O+JyfdhvNpQ8ArV4WRk8Imm1XEbdO3oc4hWXyZea2XET36f5rbZAjyiM/LxjsdUvGtLZUcje9Y=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by CH4PR10MB8099.namprd10.prod.outlook.com (2603:10b6:610:242::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 22:25:07 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 22:25:07 +0000
Message-ID: <f7f3d5d9-4400-3544-858a-d7440ba79afd@oracle.com>
Date: Thu, 14 Aug 2025 18:24:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] examples: update the comments in script fcalls.d
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250814222249.13445-1-eugene.loh@oracle.com>
In-Reply-To: <20250814222249.13445-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::16) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|CH4PR10MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e679f3-0a7f-4920-0f6e-08dddb816c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDlMU1NnaDFBSDQ0V3BvL1E0cUlMMmFVaTZPNEpENVY5bTdlZVBrVTJadHFF?=
 =?utf-8?B?Ly9OSDkzaWZjY0hON240WWJOVzRwWTBwaGpKUFEvTTkxb2NncjhhRWxEM1B0?=
 =?utf-8?B?TGx6UVJVZytWOUhpcW9oekFJQjgwNDA4TklVbklmM1l1OUszVVhaWnY1OTdS?=
 =?utf-8?B?dVkrZExhM29FckJaQTdTeTcvVHg3Ymh6V0FvcDBwMUpRNGNkeFQzWThvRytS?=
 =?utf-8?B?Y0d1bTdoOWxxU0RKRHE2bVh1NkRTZkV0aWoxOXdOdFNXd2NNZVRJcWdDODR2?=
 =?utf-8?B?T0JwTmF0YytqOGt0Y3ZFRW5UMXo5WnJQSWVab2lzOU5hUUNmVzlCMCtoN1dM?=
 =?utf-8?B?MDlsMzAySjVLRnJvNmxCU1RtT2hEVWc4dFVXY3ljZkNtNHA0b0NvbUZqSWpI?=
 =?utf-8?B?aEMzTEtJSHBFc2tqcExmSlV3Um5UaEJ5S2o4Mld2RVVtS3JCOVpDYktldzkw?=
 =?utf-8?B?OFpLUnZIWmpXTUxBamEwTDNsNkpkcnY5NWI2WnNXbHdWVDNxeUFzbFFMOUhk?=
 =?utf-8?B?Z1BVWVZWNXVjTVAxRDJKLzREcFJOWC9jOGEvb3hObzFNa2JtMlN2b0gxbVJZ?=
 =?utf-8?B?cXFjbE1IM2xjWnh1OENvODJJdEhPNWZrOEsrbHJiVk1MR0RWUzN0MWNDL01P?=
 =?utf-8?B?UmVvcm9abm50Q3JVWlVKSGJVN1g0RTBDVzJuVm5LSzYyVjVia1FqYUNZbFB6?=
 =?utf-8?B?QTRLdkFHNGVTMHEyYnllNmhDMzRrY0tmWVpWdVZwWm1nUnFGWStsM2pVdU1L?=
 =?utf-8?B?UmNncE5uU3JYTU9oY242RHRqeGdYZTlWVnY2eTFORnNOL3gzMkZZdFhieG1Z?=
 =?utf-8?B?cTBNclVnQ3YzM0ZSRkJNMHdwTm5yQUxJTmdFNm5sQkR6NGRPU3JJanN6Sjgv?=
 =?utf-8?B?a1NvdjZaVmJRdHdUNU9qWHZ4WDFnY1VMQVo4RE1RUHpKVC95QTh2NDJZVVlk?=
 =?utf-8?B?RVhSN3lxYnMyWGxUb3pzNDhTalR1SWJNcTZ2Y1V5MFVQZUs3bDdiaDdjRVFt?=
 =?utf-8?B?TFBmUk1RdlJxZWZhWklkL1NHWGJQL2lmUXdaMXNRVjh5MnkyZTlJN2pBMFN1?=
 =?utf-8?B?ZXMwbmk3RmNiY2ovMW5pWHRxV3R5bTc4YitWOWFWRnA0bWVZRXVCYVRpZWRu?=
 =?utf-8?B?cGJvMzErUm4yRFB2T3BVWXlzNkZNTm04cmxhQzFDdTFMQ3lzZ0plOXdhRnlD?=
 =?utf-8?B?bzh1ZEJiZ0daVS9HTi9vU0NqVW9hajNLUEhUczE3c09JZEdVMFV4aVpjYzZh?=
 =?utf-8?B?R2UrN1lvNlpFTFdyclZHWVV6Qk9DQlRWWng5Y05lejhPY3J5WnpNdTRiQWk1?=
 =?utf-8?B?Z0ROZ3BjU0srakM5VDIvTXdwZ3V1ZmMzdXl2cDlheTRjSVAwSkFXQ0l0c0Zq?=
 =?utf-8?B?aGg1bmxEOHdkdi9uWmV2QytxZnozL3RqbXExeDBLdWRIUzNvY2NUcGpQNFcx?=
 =?utf-8?B?d1pUVGhiKzg1L1VsYkc2RWlJcGF5N0tpQ2tWcmNsVjhkK3kyOWJCK1NncWNx?=
 =?utf-8?B?QnZONy92L1Avdlo5R2lyNFpzM2lHdnRlQnNCZkZJOVpvQTJBV25RYzR6Q0Jt?=
 =?utf-8?B?QnAxQzBoRUVDM1IwanNTWjJ3dU0rVzdYSW1JTEdKbyswcmtycTl5aHoveU00?=
 =?utf-8?B?K0lHNmozbHM1TlBuVXUxWHlKWEFNQzI3SU5Jdmh0NEltNWt6R1dWc0NSMGJv?=
 =?utf-8?B?NVpRdXJqUThOdmpVSi9pWkg3QzBSamhyN2FseC9IQVRDNy9KTGdLbmNXYjEx?=
 =?utf-8?B?b09kVTk1Mm9pMHBiMHZJQkRvQ1FTL21jMGxmS3dNVExUWEZwOCthUTE3bmJa?=
 =?utf-8?B?RzE0S2VMU2VNSmdDOHdHZGFQTkNmS3FCNVNlQjNsaTBoQ0tCZXRFUTJ3cUpx?=
 =?utf-8?B?emI5enAraDVSSVozK2FueUZMWFZrMWd4STZ1a0lxR21PK0ZxQVJwby95K1Rt?=
 =?utf-8?Q?uTRJMSKlxpg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nmt4RndPK2htV1c4RE5xQTlEdkFsNWlvY012WWoxRWE1clV5aU94WmcxS1cz?=
 =?utf-8?B?RmxFVjRlb25ycE9NYTFYSk00Uk00VkEyMnRhS0JFV0FJT091QUFtSnoyMXBq?=
 =?utf-8?B?Yk43dkpQUVJQSDFmdmxPMnBHRUpscm42ekVjaUVVVCtiSVVVeGE0VlYxaUpF?=
 =?utf-8?B?TjZaakpldm9FeUx4Kyt5UXNUa0NEeHZQZUdZZldsZW1VYjZ1MnNKQVdiYkRH?=
 =?utf-8?B?MFhYWUlFUldmdUhKL1lUTGRoMDdIN3VPRTR2L2xuUkVDZk1WNlJqNmZZNjZz?=
 =?utf-8?B?YmZobVZUZzVabDhHSG44YWg2REVvOHFmWE1IMkNDUTdjL2lOZHlLREF4NUJC?=
 =?utf-8?B?MlhMZFFJOUJCNE9yZExyRFR6bnA5S3FLTFM1SEZJNDVoK1FOUk9aYW1VSkJa?=
 =?utf-8?B?K3N2NHJHYnl5U1I1WElpU3JiVE1ndnpEK3NNUUJzMGQrUXE4clJhb2tub1dI?=
 =?utf-8?B?dk1aRGREZkg4TTM5M0JHZ2pzYm0yT3k2Zk9BWkt2alJKMExYZ2xpRW5paStI?=
 =?utf-8?B?MW01RjFDcE4rZnJDOXk5THRtN3JqWjgwRzJnMTNIK0E1S1BRWWZQZTVLOVpP?=
 =?utf-8?B?TlllazJwLzIwellSeGx6YjFsampPYkhHa2F6ZFdNZWptdnh6UEYvNXNBb09m?=
 =?utf-8?B?NllZNUhoTnFiRzlhS1ZXS0tPb1dqbW8wWXpPVm5XVGpHR1B5bW5KOTV0WmhZ?=
 =?utf-8?B?RnJoT1hFcTlxSWNKMFNpV2FJbWZ3ZHRNWGdkOExrZEdra1dhMGY2Q1dXclJ1?=
 =?utf-8?B?VkJLYnFoMnZXVEFjYmRXMTVZWFlTdlhZK3ozWldxdGt2WlpZVGFOM29YMmU1?=
 =?utf-8?B?dHVrUmlRRkNzeUpTTW1tRFROaFpzYS9IZ1o4Zkg5R1JRZVE0WC9NUDBDcEd6?=
 =?utf-8?B?NlRoUkNSZnR0aERRenY5QzgwSHZsbnh4NnRLM3lUY0xvYmtQdFR3cXBYVEp1?=
 =?utf-8?B?c1dKTkNZUjJTbmRjYUtRRnpuK0NBTUJ5dXV0dVdoTXJmUHZoeEhvS3lDSnU5?=
 =?utf-8?B?Mm82NUpzMlJsZEhPS3ZQME51eUt4VUQ3ZzZ1RXkwckt2djMrRDZoZFAvdlhw?=
 =?utf-8?B?akJBaWk0VnhqcmUrYmczV2d1ZmhGVUp2ODhCcVBDZE8xamhvcEhrbEhKdmF3?=
 =?utf-8?B?Q0VSem9EQ09SY2ptbCtOdGkvUm40ZERjc1g3UXVHMVhmYzN5MmVYNlRkRWR5?=
 =?utf-8?B?V3JYaDMyUUhuZXRYcEN6RnpEemVYTWNHRzNtcWpyemkyOVJWVEd5eURxTXpY?=
 =?utf-8?B?Zi9pS1p6Y2dXUU4vZTdjVkR3dkVqd1VmSy9uRzlDT041ckkrcGVSU093RHpM?=
 =?utf-8?B?Q2hrc0dBTDExTkpsVkR0Z3hyQzVFem1CVW1PV3A5YjBKc1dXYzZJcjlOWlRr?=
 =?utf-8?B?S1dvOWFtajY1TFZzQ0EvU05ROWJ0VlRwcGFkK1kveGREQVVnM1dPUGwrSWw1?=
 =?utf-8?B?SHlPTlVieE0zSHR0eGhHTXU1T2ZEWkgyQlJsbTNmSjFZZVFybFJQZ25VMStE?=
 =?utf-8?B?blFQY083bWdON3VhdDZGdDRaWHNtcEJIZ3pGMHVkQ0h4RmhMdFhkUlpxS0ty?=
 =?utf-8?B?RzVKS01MTElyaDIybU5UQk5vRjl3bGtUWjlVd0xFckdHQnlGY3J1TEJHSExZ?=
 =?utf-8?B?ZldCRGl5VWhzbEN2bWVCTllaU1ozczJpbTE0dHlVeExHdDJ5bFFESHFVQm9U?=
 =?utf-8?B?Q0kwSDVOdmlUUXVycHJRcWgyMGE2MXVnN0Z2Q2J3Vy8wdmpESGFsV0JVdXNT?=
 =?utf-8?B?Zks2eENzVkJmSklIcTJqOXVvV0xxYXhxVFlHNWpCVmNUbjJkdVBVQVRvMmZH?=
 =?utf-8?B?a3Q2SDFBNUs3dUZrSllQaG9TQmJZTm5pakhwM01QZkZDZ1BEV1lkaTBWa3d2?=
 =?utf-8?B?bWYrZ0ZlM0JQdmFjNFdjK2ZnYVFqMk5vSmZrb3ZRTGVTdkFhZjZHdTIzd3hD?=
 =?utf-8?B?QWVvajU5dFVUK0U0YVFabnJZVENHL1JpTUJkVEhzb3NWR2Z4QzZ4TDl4bk8w?=
 =?utf-8?B?WGlRUy9pa0Fya09VdjNMdzNBYzVpN21wYjM4dzQvbEZKbzlEZ1VjTm5WRVA0?=
 =?utf-8?B?amZYTWVhZkVUUkJTcTNBZnRyVlc1YkdJYjBodVFvUUhnT2Y3dU11N2RPMlRB?=
 =?utf-8?Q?vNL5qrSROVXzhAJqyPjQ1EXEH?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j9TtLS+5Aq/6gjgY6jCkXqbFUHlPEHD3bRHrB20C6WbNS1GMW5EWved5GRrSo/m4CF9JqMz19QYvr4jWm3fEQvu5Jexsxu041zNWzwol62+AWHwBvKPoqnB9n+gJ+T8UGojKWUmJ4i0vsSwCXgJ5Nmf/m61VYNvHInCBgQXUwW8llK+zwfjfdkPK1NJnewiB6p0xk+vGEzisDVBwYDcvEwR/d4s3mcSroHS0x43FLxXDlkYSjrVLlPfEBhiC4s42VpGERAKqQ9qUpsdk7ICF0xweqOBdrROC7kLMkllzuxVQW5S0YRjFyL30UxMIxCLuhnJFvm42mt5nCmouZaDoJVKeZFcHFVTkltD3cD2EI3vlgEse3m8s1+Hd6s6NjZZ1czeJblaMuR2NYO+6Ckst+oPwj28eVnvk1ySD9evkKzBKix6llPglUcGntjD4tHiN97q201D6ZCDrvDE1buZwjDrCgvS71r9rAtiFFdf5EnG2SjwL3gHEMyrQTBxTZdhes1BisyflmQVaaWeKFAc9rq+qIyLqsPcdVaaSKuD1zAY/pldxRxzVLsSTiZM8RhOfV8xHl4IlKAlnm2AUUYKftroEJlskJ0cj8ess3xAlpfw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e679f3-0a7f-4920-0f6e-08dddb816c95
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 22:25:07.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0b+YCBxfRX6CpepsV0nrt9P9MpTiO6gO+yz7/6I338KxJfi1uK/JINcGeMa70cpPiu6sm3fA5pvE5B6NfRdddg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-14_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140192
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE5MiBTYWx0ZWRfX/sH5wWLrz2o7
 yLra/indJACL1rx7rLK2N34S19B5ivwlfm0FW2u1NkdeC+lnmRERuJ19nbc0Tecw+rJ/qAfPyvi
 AQtB/S6gTQ0UxfMzp50m/kN3CJG+P/NM0PfYRRo6d5brod7SHagfcU4N0dfb82l19E/McjgGmjO
 EEKUvTsLOUjUGBvfP3BgV3KLICrZUSwPzmYnSUtUSOB+4hcK32S2h87LEDVxUmARcaVv26MaqLS
 QrtCHj+PIEUoAmvSBZ02K6d+CAxvdX4uWEixrpa8iNJRaD4IyU6dCfQmb+b48C6eHohKOHcLQn7
 +i/NBVa2kH/rX6tCAg+Xk+EaNT7eqhv0RMCwAJDkFYJPsQH4V5rBDvN4pRyOld/4CDFs3Edd/k3
 YWfkXqogLK5rIZgAVInCA/FQmO/JFdEp+LHwVSJErM+YynerfGDUgI8u+zc7YkQT1OE9U+Xo
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689e6247 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=NrQJfck29BxxNzEAzGYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: EM9crZUgOpMMxnhb5cSN7MZkjYEpbDoc
X-Proofpoint-ORIG-GUID: EM9crZUgOpMMxnhb5cSN7MZkjYEpbDoc

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/14/25 18:22, eugene.loh@oracle.com wrote:
> From: Ruud van der Pas <ruud.vanderpas@oracle.com>
>
> dtrace/ChangeLog
> 2025-08-14  Ruud van der Pas  <ruud.vanderpas@oracle.com>
>
> 	* examples/fcalls.d: Modified several comments.
>
> Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> ---
>   examples/fcalls.d | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/examples/fcalls.d b/examples/fcalls.d
> index 9e42f0041..c332dce40 100755
> --- a/examples/fcalls.d
> +++ b/examples/fcalls.d
> @@ -8,7 +8,7 @@
>    *    sudo ./fcalls.d -c "<name-of-application> [app options]"
>    *
>    *  DESCRIPTION
> - *    This program lists the functions executed by the target
> + *    This script lists the functions executed by the target
>    *    application.  In addition to this, the number of calls to
>    *    each function is printed.  This information is given on a
>    *    per-thread basis, as well as aggregated over all threads.
> @@ -19,12 +19,14 @@
>    *    duplicate the probe definitions and in the copied lines
>    *    replace a.out by libc.so.
>    *    For example:
> - *    pid$target:a.out::entry,pid$target:libc.so::entry
> - *      { ... }
> + *      pid$target:a.out::entry,
> + *      pid$target:libc.so::entry
> + *        { <clauses> }
> + *
>    *    - It is assumed that a function called main is executed.
>    *    If this is not the case, this is not a critical error.
>    *    The first probe is used to capture the name of the executable,
> - *    but this is not critical.  The probe and printf statement
> + *    but this is not essential.  The probe and printf statement
>    *    can safely be removed, or replaced by a suitable alternative.
>    */
>   
> @@ -45,9 +47,10 @@ pid$target:a.out:main:entry
>   {
>     executable_name = execname;
>   }
> +
>   /*
>    *  Use 4 aggregations to store the total number of function
> - *  calls, the counts per function and per thread, both
> + *  calls, the counts per function and per thread, both
>    *  seperately and differentiated by thread and function.
>    */
>   pid$target:a.out::entry
> @@ -57,6 +60,7 @@ pid$target:a.out::entry
>     @call_counts_per_thr[tid]                   = count();
>     @counts_per_thr_and_function[tid,probefunc] = count();
>   }
> +
>   /*
>    *  Print the results.  Use format strings to create a
>    *  table lay-out.

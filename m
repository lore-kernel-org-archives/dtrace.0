Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD60F4431
	for <dtrace@lists.linux.dev>; Thu,  7 Nov 2024 01:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730942064; cv=fail; b=HB0epyzTjQ7H+VVi1qt2fIkULQiFsDNHyg9Smv8pIMeWlQVJ0ZkqonXtJiYSze5JA9sD4/jnw2noOmz0IGwXVvvwPGmHIiI5pMoKn5YR5hSLT0DpKeDENgk4KygDSpLheqVs6vFRwXgUIUn2l8pubXR6oGkF1ekiTn2yD92u89s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730942064; c=relaxed/simple;
	bh=8v0QO2QYtb/GZewgdomTCbukHlPpPB8sRv3uErcky8o=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P71IfDKFlMOLB0KQdjzuBqPN6RJgkZequtOJL+GygK8hzvKUuGtrdlT5DhU7UVY6u/kSlfanjISgMkGN2XQhLi+8Uvf1uHWKUqjomfB1dIip+q5dshfFNtLy2fBd5ZNqUrAbMIYgXA5GtZJ8wsM2/WlMlmr04OJJCJMpzzpoPoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SE5PeBYg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rLcw9zfF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SE5PeBYg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rLcw9zfF"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6MSjng007290
	for <dtrace@lists.linux.dev>; Thu, 7 Nov 2024 01:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=cRH5C32M5n9Voj6E7I47ipr16ErXPNKrwARQ6j9nfMY=; b=
	SE5PeBYgm1MM4j3mmIaV+SBYD0Zyv1/1eTH4hrZp0oYg86+XOrdcQV+mZA/Yyqs8
	xa01CVr8gosrNfgLqyN+Xa+bg4DXc0CRqdHQPt++Sbbx0IwF8qSDghVpTjXdRDgn
	2dcwyLWs27MVk6llzf4CkgeYqBEhS4rn/zuPVNqQlPdRiSBjrEn+F1Pl8Lr1tT9d
	3tRVxuuapcLzMD5aq87UNZEo0VJFCKsOunHYZruinxL+kjqreimO/cLuuASVqryU
	cJ/85WXVIjxrsDJyPtYtwj3WFx2OITj/Gs6Jc98CmmueOeOp/PAc1t3LyOGmk3bI
	y94NII5OO/N36boAVtupdA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42qh03ch1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Nov 2024 01:14:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6MYXaL008430
	for <dtrace@lists.linux.dev>; Thu, 7 Nov 2024 01:14:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah9afnb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Nov 2024 01:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvPGMTjp6auf8PVal3FcHPHFNCavJz/rC4hYBJXY7WfY3Clq2Bfx9N3SHdTSQ9gNRywaE+Rs5E7Q7D3vzXljlgol8KBaXqEpXb2qOGKWpZysnrUdDlyWnROfWOciNohslaydIBThXxjXFkpmfnBJRouhqE92d/+MwsmZkVDbUf37zsIDF9ee3ABNpQPYn0H2eiFghK5GhxNFPTN/Ha+t4+UmjS7QIHkVdhTRc3jRo9ppmp6v6OMavGOw7IcDQJtLq9hijqYcAiCUxRtLt6OtK/GrrnkQgnnsa8G9BHhME04XdVMAZ/b2h5jc64ibyhfkkNilgcoIrvKS7EVrngJsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRH5C32M5n9Voj6E7I47ipr16ErXPNKrwARQ6j9nfMY=;
 b=ULrAM5fiuXiv0RqNSXyPoUSw5pF7zujmRowE7I4BHQi2oR1bp3R4iNXcol1C7mnqLBktTcyYNjWCykkhMf08Gnv/G74Fc0Avny4GIMQ+k6OlZvVoeWOdW7R0UnIiXOjwV+PO3ccS/cRzU1clu3sM/j3CkUWqIo8KgHUPe4Uflq7KOqjhIQ6o+YYL8EJo1w15BbPE5Ylt5RJkCVOkWpV/nhmsZpW1hyc1rzaYEZkOj76ektceWN7VETP+K9NB0zBcmEKiQY/x0W+BXnLfZBPcrZ7Pr63VePWaxcuZy+k1TjnOovtSYsj6nicFxDhIS8u046h0fyzonZlJVeU5sah+Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRH5C32M5n9Voj6E7I47ipr16ErXPNKrwARQ6j9nfMY=;
 b=rLcw9zfFwkOpgpMfIXH9iRRGBGw30iRQJY7B/2K6yGyXTvBZ6QF/4NKwB8DVHExkxG5B7lK8a3LaYhARjHFESW5h3Tn6qTF08dTJDXR/mY4x760roogBNRy84cyR+VxA/c/Vonw++UoQ5NARxEtocgkL8oTRw0wy9FZ3Re2/oTY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN2PR10MB4126.namprd10.prod.outlook.com (2603:10b6:208:15f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 01:14:17 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 01:14:17 +0000
Message-ID: <09b50c9d-f2b5-8284-53e1-2050afe4421a@oracle.com>
Date: Wed, 6 Nov 2024 20:14:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Allow arbitrary tracefs mount points
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20241106164656.421931-1-nick.alcock@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20241106164656.421931-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN2PR10MB4126:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ceb10d2-984a-44ef-e61b-08dcfec98074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXZLUXFHK0ZEQ3lNaUZwbjd5VStQWGs4VENRWkhzb0poeUJCeEVqUTZCNXh3?=
 =?utf-8?B?SCtuUU5JdGFpWkRYTWNlMUM0YmpHaGRIOFZFaUovV2NlMXFuSjJGaTlyTm5R?=
 =?utf-8?B?OWhzWUVNSUtGUThTZ3NzeFFLank5bUxic1NTVG5FanIzVHZpRUlzWGc0LzYw?=
 =?utf-8?B?dWNuTkRqRW5BaUdnWHpkTzArWk13cUg1VUczRUZ6VTRlcDdSVy8zTHQ2SWFE?=
 =?utf-8?B?Q3R5RzlqZWdRbGIySmE3YjZLUW1kWWQ1UVd4TFdhSnBha2FnMlBqWnZlZDFU?=
 =?utf-8?B?ZzY0aGdMOFJmeXdHSkJlMUd1dW1zeXBKSWsyN1NqUkh6RGQrOHNhOGtuRDg1?=
 =?utf-8?B?a1BySXNXNVB3TGI1M1RVUnVXSU10b3RNbWdQSDJEbXF4RG9xeDdJTW1UK09K?=
 =?utf-8?B?R0tudExZaVgxQldkZi9NQmlhNDZWL2VXeFQvMEt0VVNoeXZPV0FLeWlrODlF?=
 =?utf-8?B?Wi9ZYVFGektSM3JXb3FabjBQOGtRdkVEZElya0V3N0FHcjNXb2dJUE40R2NH?=
 =?utf-8?B?V3N2Z2tOTlZ3Sm5Hb1VtVDQwcWIyNjVtWjgyS2d5MVJxdVJFbmxvRUh6Zzc1?=
 =?utf-8?B?QktYd2RQOTBtZTBzQktrVDBuRVQ2TzUvV01MUmltZFV4cGJCZkZibXFpa3d1?=
 =?utf-8?B?ZmZtQnpYaHBwUUk0QU1NQm1mZ3ZPQWYydUgzd3JXZVVYa0hRbkpFNGhlalZh?=
 =?utf-8?B?TXlNbGdPbVdVK2lmMGNhNmFQb21RQjBnUXIxcHdFbTNtbThiTFVGQXFtdWFQ?=
 =?utf-8?B?TTBBSjUySDgyN1c2SHBwdzZHV0ZxeDBRc1c0UEpFRUlyMVk3bzhFZTROSk4z?=
 =?utf-8?B?b1NVWjFMYWRkczFVUGlYRmJ4RmF2YUtycG9FRWhzV01ERWZDNHV0RXVieXo1?=
 =?utf-8?B?MWVRajdjM2dzN0ZZci9oOG0xeTJwdjY4Y1BYZ1RjdlB2RlhFcjdUWjYxV2RY?=
 =?utf-8?B?SUEzdzRwVTh0anpnOWZ5VDBUT1ZON052TDZsaXplS05adTNvWUw2MGticEJl?=
 =?utf-8?B?a2RHVVRkMTUxVTlaRmo3VFNKU1BYa3AwcFVMT2QrN3pTL3N3UEZ0UVlkYU1Z?=
 =?utf-8?B?elRIVVJacjFhb1BTSnlDWmFpVnc5VUxDWWlvbVJSQTBqckt2VmYrOFdVVUFw?=
 =?utf-8?B?SS82dWVNRjRBSEVXbU1Dbkw1T1I0c1QyREduanNLVkl1eStEOU5mNFFock5B?=
 =?utf-8?B?eHBuMUN5Tkx4NmdyeE0rS0pFY0JRZTQ1WXRMRGdld2ZyMlVxckNub0JXVk5G?=
 =?utf-8?B?QVRZODV2emlvVHRZRUJkMHFMNmVyeXcyV05Tc25oM3A3bXo2S2JFWTZyenNv?=
 =?utf-8?B?RUZ1UGtxZ2drUm9ZRWljUFF2MXFwdnVkVzNFNXFVeUJWRDlpSm1CbHZpZkRU?=
 =?utf-8?B?cklhSUxFMnFWV3hCU2VUcjZtdmI5ZlNoYWlSN1J1eHZTNTk2L2I0aFdQalQ3?=
 =?utf-8?B?SVBkTFhKcml6eVJOdUNsaGMrdXhDdDFoTjZQYkprQVJpYXQ3NzVCZm9DaE90?=
 =?utf-8?B?azJDajVSbnI5eGhOQWpkdm1adERkS2JLQnFqRmNrZzVVWFg4eVd6d25TU09B?=
 =?utf-8?B?ZjFmQTA4bnYxYTROWGRySlBqRWF2MC83UnY5MEcrdlR5Zm1MY0F6OHRON29u?=
 =?utf-8?B?Um9FM1dJN2tkd2MrOGU5QVpabTJFYkxZQ0lhQWY4YlAzaEtQYnBsM0Z1UDRE?=
 =?utf-8?B?ZzUrdFZGNDE0SVpLaDY4L3RoQkpQMXh3em9oM0VqcVR6ZTN1dlZpVk4wcnFW?=
 =?utf-8?Q?lb0BFi6okBslJFWadq0epfM4ECH+vizdVRrWu+b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHF5eXZCdWVXMHRiUFMxUG5xZnRMaUJQcGxaKzN3WjJ6SlBuVXBYaTF4VDFo?=
 =?utf-8?B?djlaU2lhWEYrNFJwdTdPTnphWEtHRllZVytUZEZOaUFzeU4wTHZVVVNRMHRJ?=
 =?utf-8?B?YUlqa0JsQXBCcUxZb2s4ZWFUbnNqY3p2WEE1elBudVdzcUl0Y2t5eWtaYzQ4?=
 =?utf-8?B?dThyT1o3NHRMamI5USttV0EyR2hHVTZPSkU4bEQ0OUxBRjM4bUgrU2JuYjUz?=
 =?utf-8?B?eGFzcWxSM0VHR1JpZ2ZaQzlhUlhlanJVRmtaT1lGNkdDSVJCeGpOSWxLWWpq?=
 =?utf-8?B?UTc4SGwxWWZOVlVEK1NHNGtTYklQK2pEbU1ld0JueEZrTWh6ZjYxTzB3S2ZG?=
 =?utf-8?B?U2k3ZFhyY3JRaHorblg4WFdPSVRmNEpZOXR3VEdad3JHSzd6RW9YbGVRZmU0?=
 =?utf-8?B?eGJCNUIydGdLK0VUckQxWkhzNUZ2S2p1ZVRrODN1azdUenQxb2pTTllLaVFN?=
 =?utf-8?B?T3BnQmFiajF5TWU2UHB0YlJrc21yRW1xM3V4c2JiUzJaa1Q1Z3ovQkZDYzgz?=
 =?utf-8?B?U2o2ZS9FMSs2cmZqKzQyVnJYSWFCM0grcVdUMVpCZGhVSzNMWXJqbnFPeDhy?=
 =?utf-8?B?RnVkWU5VQTFiVHRTQWNEa2M1d3Mvbjl5clJ1QXN0MGQzeU5mWHBIZ3JPN05s?=
 =?utf-8?B?RWF6aVFPdE5tZW9URVlXaTRXOHlCMGNjMFhtZVZNa20xd2tpUEtzU050aE04?=
 =?utf-8?B?VHErL1MwOWliaVpXNmRlcEk4R2FyQTZLbnp1SjhIWWh6TmtYNVV6OHpkWnpN?=
 =?utf-8?B?MHAvTjdxd3dIcUgrckx5dlJJc1lNaHIwcWJTZi9KYVhaRFhRZ0Z4TUVOQlZv?=
 =?utf-8?B?Wll3cFJlYmRMRExGeTNoZzVkTkhSbkJLVlNLYWVGMlNCcTErbkVYK3BEZHRo?=
 =?utf-8?B?ZkgwNmlvQUxwLys1cVN1SjRETmI5S2JyQThNRUlRdVFnc0U3YVozZGl1N3BP?=
 =?utf-8?B?ajY1TENFOVhDQnROeE5WK1ZMcGRMakdJRjduTHd4UmxVQkF5NTFLcHQvWGdC?=
 =?utf-8?B?bWtvL1BRSDdnNVhPSTJlT294Ukx0VUxyK0dVbm04TGtPeG8wZy9QZ1B5aFdK?=
 =?utf-8?B?aUFJSUxDUXpyRjFidlFoSjA3N01TcUJ0OVNtRWV5ektxc3pacFZLWFU3Mnk5?=
 =?utf-8?B?Wk50VndoYUd5bDhncmJ3d2lIQ1BXak0wRk8vUnBIM01BVlBBTTRSNFFvOWpH?=
 =?utf-8?B?bitKYm9Jc0d4U29HanBuZThDVTFiSEN1SWNRUkdMaFdFRFhQWEJZRm5ZVFpE?=
 =?utf-8?B?d3g5ckt6T0d4Sy9rKzVCTk1wNjBTOG02Zk40Rm5haGxhSEVvdGFLV3c5ZHJS?=
 =?utf-8?B?Z1lsRkRkSmk1SExZanQ2SHhzQndldzJSL3RPaHJEd3ozTVZ5VXFTdmhZSit0?=
 =?utf-8?B?UzhCZkZaVjBiZnN4ZzNpRW9LMEVIaWY1VmhVK3dPQmMwMjJoQmsyb2liclZC?=
 =?utf-8?B?STFJcUs1UjZsUHJKTHAwaEZnTytCb21walZGQjF0TE14YXRBTy9ybkJkN2hO?=
 =?utf-8?B?d1p2V3hyelZJbzIvelo2ckdCZnFNQ1N3R2I2akZaWFZwZ1c2Y3Jla0RGZHQy?=
 =?utf-8?B?ckVwVUl5bmNVUXBlbnZQczRLUy9wck5EdUc1cHEwVEUzazBBcWEvY1FZK0xY?=
 =?utf-8?B?QzlwMDNpZUVDWGFieEJDdEx0cjFWc3BRTGQyZUVRc0Fqb1M4cHZrU3ErdHVW?=
 =?utf-8?B?MTh0cWdoNzZNeldHU2pPN2FsalFiMGRxTTI2NDgwQVp4V2FjVHpQaXFJTk5i?=
 =?utf-8?B?Umc2TVJuL1lKNWRTVHpUemxrSUpqcm1Oc3FIREZxRHp4T3dnS3FvOExGNStN?=
 =?utf-8?B?SVZQS1plSmRqMlVQaXR1ZFVZclBPWVBsVi9kYjJuRnJPaUsrSUpHVjdSbDJn?=
 =?utf-8?B?dkxYMzV1S2dIeDVFVXNPN1BNUldqSkFSQWZVTHYvVFhKUkV1em5UcUlncjdv?=
 =?utf-8?B?ZWpCT0JGN01ONGFpV0RHdjU3ZFMzTGI3bGJmWGd6VjRHbmMwOGptankrNUVO?=
 =?utf-8?B?czY0QnlhR0tmYitJMXVReGh2aThBYjEvQXRXUkxsSnl3VUNzUUhteTZxUUJ2?=
 =?utf-8?B?dU9iK1RJY3BOdW9QRUNza3pFZDVXb09NcEhsV1dORU9wZWQ4NzdIRHZtYjkx?=
 =?utf-8?Q?1XbpyuGxV533ysduEpD7Yji0G?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EEQTzK6R/hcvtFGou6qnHc3pRxb0Mxrd1VHkpwO+Yr5gk9l+3XMrGzg0M9qOIgzspwh0AKx6oHiAvLccHb6kdAryjdTqdgodO9NQx0ZkHuOw7KLG7SBffzmjIU7/PHHxVJCExwNdXt7Nkg+u8beCVBc06xvodh5CPXi0ioJrTijt9X0D9oH5/pCPLMMcxHWPKsSplNrhd2cXRCe98OYr5lrQDou6r982t9sHg6OSdzJ87hUsVxGvGCn8HZ25br/NtwVjFLKb/18fepexiAUI4rwNM/ySoKZZxz9+Rfz1dvL1SwKNSxLm8aze+U0yRHdT9aSdnZcTgUwKVxg+H6Jrd6lbh3XLHk+2nlGSPrUEslCytJj6ioqoWsESrRFg1ncBf7bL5FN4Elynm2z5VejZG14CAfv/pnLIA4wjlxh025oh6X33WyTmBDa/tsHd4VS/rLES94MFwW1Lj5yVJk4I6lPXCOzCKvZsYTT8SqROvjWdvw50WJEmL/zTSxYsi1XhoitDt1CLTJAZ+j3Jm6c5iWxN608EGDflvCGLm0IzfLjaYRHgwhfMPss5hCEjNfIIoVvsgFeC34u51y7+2/zKGZ1WmrboEWkTJ2DV3ZFNfW8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ceb10d2-984a-44ef-e61b-08dcfec98074
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 01:14:17.8235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FjmfA6CvKhAfTKqc2x2Mi0v0VnMo6ejL1QVJ8YyTt1/TBz1qbY/gCmq3MK4TU0mKLNe9oo4PAYo1cj8Spbzaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4126
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_20,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411070007
X-Proofpoint-GUID: wJyackok40eDLbqg9ZRmkqQhP7es49-T
X-Proofpoint-ORIG-GUID: wJyackok40eDLbqg9ZRmkqQhP7es49-T

The whole thing with dtp->dt_tracefs_file is...  interesting. We store a 
temporary string in dtp-> just (if I understand correctly) to simplify 
its free.  It's kind of a cool trick but also kind of ugly.  We'll see 
what Kris says.

In dt_prov_dtrace.c attach():

*)  We should convert "len=snprintf(NULL, 0, ...); snprintf(fn, len, 
...)" into asprintf() for the format file name.  I realize that in some 
sense that is "beyond the scope of this patch," but it seems like we've 
used a couple of patches recently an an opportunity to fix this sort of 
thing.

*)  Using the variable uprobe_events first for "uprobe_events" and later 
for "events" seems confusing.  At the very least, how about naming 
uprobe_events to be something more generic.

Those two comments also apply to dt_prov_fbt.c kprobe_attach().

And...

On 11/6/24 11:46, Nick Alcock wrote:
> So as of kernel 6.3 (upstream commit 2455f0e124d317dd08d337a75), the
> canonical tracefs location has moved to /sys/kernel/tracing.  Unfortunately
> this requires an explicit mount, and a great many installations have not
> done this and perhaps never will.  So if the debugfs is mounted on
> /sys/kernel/debug, it automatically makes /sys/kernel/debug/tracing appear
> as it used to, as another tracefs mount. And of course there's nothing
> special about the "canonical location": it's up to the admin, who might
> choose to remount the thing anywhere at all.

Anywhere at all?  But the scripts in test/ only look in two places.

Speaking of which, could runtest.sh look for TRACEFS and then make that 
available to any test script that needs it?

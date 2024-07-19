Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEBA59168
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721421884; cv=fail; b=h3Jq2fBBWCErnOUlreOYQZbnganreY/lpKqT6uAtIfio6cb9S7NPFTtCHme98HHxadlTliAqB6bhBDv+/chkLifh1TqKndIVoW+H98RfCKihF4TPH43afIxg5UguUc0m9MO75y15SOU/VYp0vL+RgOLSD5XgsjqOZk5yzbFQ8lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721421884; c=relaxed/simple;
	bh=vlXKA5YC/OBWXuBKlQPtEZMo9PlkcrXMByzczvALQBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UraRyQCgazxzSUe315hw4rb1cjFJUQSx091tFC/iOMFHGFvgOw2MyF0DtNIJQeb+s8qifdakB5PNGbGezKR/Ja7pBQCbRmr4ZhWC6JN7LnNil0RuneYQYZHu1PtBjOYZT7U5e1FkNe9FiwFaCIgdgnGFzx+mIVnvfIeCKYIgPGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TQzcY5HE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EE18bHT1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TQzcY5HE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EE18bHT1"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JKfIXo015355
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=lmsMEf/V5uUBzNZ
	jiLUNOybPEL4GiwZV3c+aDdH7YkE=; b=TQzcY5HEDNfqkNAjeGWkVaYt6lvOgco
	bMLwYkDOlb1C7OY7WkFbNuiHlDKn5VH/kIo3OX9mUAC4YDmK7OG1JqRY8JYfM3cs
	UKWnlNXI1LEWUS8KA1aABGSur+7otJcUKU55cNEAnoOcsmKLs+47u0CMtAHybEDh
	DXkTVHIFeUY+thkNLSvMAdXsoek3Jeb3YiktlvlkZHx8q+wBQ6P02mWaYM0I31m4
	AvR8V0cDPlYE1rdh52UhQJfb6Sa+GZ5yJM7/9FKp8TmBamODywtlfKB353EflApU
	jXDfexIUTWMxitTDZZ+KH7aPOFI7xSOiXilssKAQNYubNXCaeFhYTwg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fycq009a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:44:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JJrcds003756
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:44:41 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf26yg4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:44:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgPeTXMc30uhSTVX3b5C3vxxudKb0hRucNOPAjb+WSW9a8FyEYyCD9pYgkipmW0AZ2P5beghs24UFG5A2jeNMxuTyrUfgngyechQqY2V3B2I8vd+z4TlCmrEAPWqsUiFe6Fa9v1/pohId802Mu39EmhiU2xRUXq0+93DU9DHSrrZqRocasy9EeJGWTYSy1n5Nyi/uZLBAypmT1tHRPJWBKS2588HLlyowVZrHI13dBedMIDjP47yCOhiMaXfekyeP5xwKhSSraJ8VqutsC6MINfVC0zwMbmoniWlb9n9/JThIEz98KsprM2VKC8qkCFjEWdtUSNqSGbz2RS5AjHBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmsMEf/V5uUBzNZjiLUNOybPEL4GiwZV3c+aDdH7YkE=;
 b=CdQKxgb46/fx3j6vaV9V6A2n/pjZqNuyODJoq2wYcIFdhNN9FImdpcL5LGxz7GxdH9rAfsqf5Ds54XXQTrdIy3C5YDqTDMODh+I8KJyg757TwH61iQHUNWyrbAUSskYmCsWTdDnQZ7d81ItY4/1U6r2lTzmGe171NxORX9+AilKs6BWXbhHq0FrLfY7iXabMLNlK2Uas7++Bp56EY+i8yqLOeRFc4OVlaEUvBf21ZRcYi7g7ugFd3pqFk4qkUY00HrOcFcr34iyqqqJ02PrsO/+G3k2n2VVt1/3eGpBdFxfEtpdEW8IVDNQDpjhZWnOrvpHkf60maNegfV19mdpkQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmsMEf/V5uUBzNZjiLUNOybPEL4GiwZV3c+aDdH7YkE=;
 b=EE18bHT1mP8OXBKwVk8d5PuaHodT4gSLqSYOMLxgwtzHm/ORJtqxyz4s/L83pvsf1rARP0AqS3l7DkdI7KEqP4YxigE40fZ4rTRPwkLBk2m6fiHV8GUYaWQ8XVRpBdPwAe7wv4j3gURbE/pzrwKx5C26KIF5tbldc28hbbJTA40=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB7171.namprd10.prod.outlook.com (2603:10b6:930:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 20:44:37 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 20:44:37 +0000
Date: Fri, 19 Jul 2024 16:44:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 22/38] Fix aggs comment in dt_cg_tramp_prologue_act()
Message-ID: <ZprQMxWRXqxRrsGn@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053904.21996-3-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR22CA0014.namprd22.prod.outlook.com
 (2603:10b6:208:238::19) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb57889-7c16-407f-7ac0-08dca8339b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IrmCEy2Tyw1qcrdeEMsv38u+zLMmtOL+dsUBklPhnLjo7/M16RICiQjknmap?=
 =?us-ascii?Q?Ka+sHCcfxdSwoXb7/xXFOza3VKdvT8YPvESsLByJ7IK9I+ViZKZRhklVxs6W?=
 =?us-ascii?Q?/x5hi7CGg4Icopttdmzj1mF6jevfZft+ojXmac3db8mPGHD/as1WmDAopmwL?=
 =?us-ascii?Q?9KqAWT4IrwbdCIvsuO3qFheNfUBi697aA0FhaPsG3nqYiH5FNIWxAZ0UioBZ?=
 =?us-ascii?Q?8s5iBfQSYAvJuqTEycjvKvT51k0AyScK70K6+sUou5/+sXHNNbJ7d/YG54Tw?=
 =?us-ascii?Q?kkpyDdevkJyf7kM0X4DD7btDQgCi7K4DWh79nqlcS1tT3T8hvKXroEKKMYbx?=
 =?us-ascii?Q?VcurAIdSjakC6JyHQ31D5JMgQkE0bsasxGm3+D28YAhTGw7Xgv/ZXO2JtKMC?=
 =?us-ascii?Q?HrT3cAtbk+cYZR1soY706sU4hR9+Shovs4lAa9po7qbQC6WonwHt4D99j1vy?=
 =?us-ascii?Q?ECEc9X+wIJIXqD11t6By9ipb/ryXWZ21qtLhoTKJ33zKlV3Vwh1C7W5iKAjh?=
 =?us-ascii?Q?iTSuHSQtLuQ9l8h0szChWR43L/Wu8yQoSVgwQ+nrCvWQDOS9tZ/G7PELnW2w?=
 =?us-ascii?Q?oWXJc8XbbfhN4XPWjJLcZ+1U4R5sNjiZwKNZmGdxztBLShzy02yFtpbqwq1/?=
 =?us-ascii?Q?u0VDKPw95JDkyFWj8gWMCHkg5Qo0TmqTixJ8J0sAV8UR+uktb35KKgDa2bEX?=
 =?us-ascii?Q?xNBPI6LbCwhOOYg9aiYuOwrx1Wk0drPTsJzm0prcQJ2DfZ9vvve7PHxHbxB+?=
 =?us-ascii?Q?PHZpQ4T/938qrtMJWmppzq7mJIFwTqZNvacG0nxcB6D/mGdi50S3rwp5/WS+?=
 =?us-ascii?Q?DL30K5K4xQJ/094X+X6P09i2Q61cSBosqf3gVLjol25IZrqQSgrJuCq3KTGc?=
 =?us-ascii?Q?BhaKk2B0mgbYTdNBYKHM7wYgYNWAeQpFEsIXP9JPY77n+2JQbEnTCO9wM4Vf?=
 =?us-ascii?Q?SHSiFR9gFwp9C9nhErXZL5iysWwYo2pFuxlrLu3GBVOmsF91G8sJzBKOzkQ7?=
 =?us-ascii?Q?09niEvTOcVea4L1ZhBHt5iOn7xHSOE8YhYQoc/vj/gMPrcMcWNFaC1ZHlE7V?=
 =?us-ascii?Q?EjwPlIwRMJDzWMrDnaCcdgNDmJ3OsWEGE5dZO4HhPk0hyiSnCWLjyjJu+p/N?=
 =?us-ascii?Q?cb8lrh+FMubBVlkiX1e8y9j8Us0R9+3N5gpQYJiscg0UvwISMNxYsKdJP2ON?=
 =?us-ascii?Q?n+xtJjSuUYB30fOSBSWX2kxy0Hd8ulkF1SuuXrRGNpVPLGpiEpPhKGhpAk7k?=
 =?us-ascii?Q?Wk8bLFtDq4r4ObJazDGVsiKPtOfxJpVmSaGvva94GRX2wrDU3o+JTsiP+ONT?=
 =?us-ascii?Q?H8lxGO/6X15GYbxPNodOuA8wWS9eF2AQTIzDmZXJ3JODJQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1dgVRyt1QB6yR3BLzK0HLFEVmFPmL7HJiRiAyp7qW4Ws5LEFNouWXh1LVYgD?=
 =?us-ascii?Q?3roTmqtYWZ+WEP7KNkUHjFL/qBQNksvUrPBVhIjDwu2sbzSPxV3QHnOZEZiJ?=
 =?us-ascii?Q?Hm5+7bEkr1n/VY6YnlxZOtlb6XlXG18uWid6eAkZs1tNWHpQfHMFR9cWp7sS?=
 =?us-ascii?Q?Jj17oeFCw3lT+O4QYrdEqs4NFx/4x8V0iW16VNZBIkZgbYpdtxRMweHuVnWo?=
 =?us-ascii?Q?X2xKvfHJPaYkrKwqmjK2k+J76MhHceksFupK8O/Iq8KgmQE0DU89XjMVZufG?=
 =?us-ascii?Q?QgLQQYXplGb/NvsdDJQBMOnovDdgQmUdKpCwViE4oBjS3+HRP4WezYzlNHfK?=
 =?us-ascii?Q?wlLGlYciYAdSkBUb9ztrZBBKzSpApzfR3l6R4+0k8zP3UcQ1/mIGlyBP/sgV?=
 =?us-ascii?Q?wrj3RZeLM4LvJZZKgpQjNANlejKqZT+84Lh4lu7gbxEdRI1uZfmI5w9BxxVI?=
 =?us-ascii?Q?3ozFecGlUpzGpbA9H+xlTbznOszh2LctVjGzGVsAsNIGkXKyDsCHuwLZbIFc?=
 =?us-ascii?Q?avGYZfmbEeiHh0GBpnMnZ8cs9zFXzGrAnopEbai+iX2ZU5Z+dt7CkV3E//15?=
 =?us-ascii?Q?49Hs09iX+B2hr1mzDrpattNSgjbu2Q4EnQR9Y0/ZDEvcxdLZNXc+538dtQ2E?=
 =?us-ascii?Q?K1bOjIRILayPWXMbfFRHT9mAtBZin6nRJcOJXHtRpYrBT2GqokNsGCtnc/E9?=
 =?us-ascii?Q?iEQY+zxXvOaSP1AWRtnlsHt6JwABI2ZL2IjV6H12KsI9GDja1dNCniFwGE65?=
 =?us-ascii?Q?pncuUMiFhTEQpN0CuEb/oJl69cEqMmZj1wWuBHXlusqQZ22Fhlq4SOEMY1Iu?=
 =?us-ascii?Q?lKmZVgH7FOPUw0pDTHJbOHh4d10GsXYmNZ421Exiaj8QKSgMGMcIFuoWkLyO?=
 =?us-ascii?Q?f6EUPM+Gvb+ayTDCuRhXlvOLqfURHI8smrTD4zmdAQORZSHudAe1pdNOasvs?=
 =?us-ascii?Q?GkAYguleOlCiNIj3K85tyAsRbzWRR3zKZG1VXCvgqSlPnITSeMcBq92qCjV2?=
 =?us-ascii?Q?L3sUvJN6b7SNbmz4QTTZT5v6QTFwF0r7FQpSp7fKyRGdHHkXI07ukUXsR9Ss?=
 =?us-ascii?Q?nFPdSHsF3JS0cjtuNJfiN5C70IGREQLOnGd4tXPWWPzUQlnAs9ztW4DWdPZ9?=
 =?us-ascii?Q?j2+69KRptGxRpoqSMOTcgGJZpJMO46COsmNrJTQFIA7G2hgNxCrWWnWLqI/Z?=
 =?us-ascii?Q?6V7CScKZthYGRBaLxeB2993VzHJQFjhrmxXriB++k9H1LlA/2mlzn45nS4uN?=
 =?us-ascii?Q?oBqrS2VQteeY2XGCbBz+vXxfUop2Mc26V1d0WlDjQUO160GsTlkx8/2cTi1Y?=
 =?us-ascii?Q?57v6eBzcaeDOfRpbG2Bzauqv5OUxhNCHi1CrEwDTI4SYUk9bYclwnYFehetk?=
 =?us-ascii?Q?9EaMwLpmZ2hzwZlIcVA0KqSF6CtmpwsM8pFtUaABBiURl3n3wE28Dwgr5eud?=
 =?us-ascii?Q?KJhBxbuWi5nRzAmgoVyxu2HzqPUQv8GajDzuPrvtT/o2Qpf0sXRqvj3YCjM6?=
 =?us-ascii?Q?Zz0jWNU2VLRF+ewbSd34jb4CX28S49n6Y4mZawAK+FyAVq81N8VMx+BwINsu?=
 =?us-ascii?Q?EazZBj0XVuncLBGMc/M6gYxr5gBvmyLqOw+t+NbQs5PT9iPJvcJbaAo8DO6V?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	GKG6WVyqE6TvKdXZiLr1/FotkyN6fI9F5ADTLZY/m9oOny4KA611/pOUCiFS+yXj4OI3JPcf9PLHj9NcfA6js9pEJsUL9ob1cJ4dzZ6QFlK3+8AX1Kr0w7vRDs5SWy2GcREKfHCq4koPEf5yrUVpPF/8Nk6AZF6k1+SEUgOChK7g+thtIhwXup9m7sKPTgrnzCcK9Bwak7W56BsXu2jgPvVTAl8FCEDldWiAC2SD/tBYZT0bkBRBTYmIo+RqVYUmg3dj+WXJQOGDbkjfYQ3rYK/3O5kEydLNPAHFSDRzFHM7pMx1SnL2JYH6Vg0ZGbk/FpdW8IGA9OxnQh0PGTBEOjJHRVDWxTlYGweysX/O3nOkYDiE2rCp1E57QFSNOoKoJ76Pxl5Blx9bE/Ew3IcQIOtgBwcidts/sRyTQlQmfBaIr99IZK+9sNahZdg/iPEGsjYWquDJcBnbghM5DU9CXj/zHQSOZwbHNw7KESNmQmwI4aOwJG8xgPgbwcShaKBOUt5nS2054cj+WGx26PILHfxIi1fRUgo31pIGUqWD2MoibVdZRvuDTIkkcAzCNIavCf2xMTRbXRXcxnWnKW0w9wVyYuvF49B5I0BPih5HXSs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb57889-7c16-407f-7ac0-08dca8339b05
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 20:44:37.8069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYfhTPHdTpk/uGyD2bfth0Gp3cMOPXeHRxair5ws42JC9kIgC9X5KQMMuP6woqoHum8O5GoctVYOGoiXWJTE/WeIh0eJVw0SxPkm+HXFNOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7171
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_08,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190153
X-Proofpoint-GUID: lA4uqm68It2ZEx2BwCQ5xl5pJhDc4OZF
X-Proofpoint-ORIG-GUID: lA4uqm68It2ZEx2BwCQ5xl5pJhDc4OZF

On Thu, Jun 27, 2024 at 01:38:48AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... provided you mention in the commit msg what you are fixing.  Because
looking at the patch you are removing a big part of a comment block but
without any indication why, and the patch does not provide context to be
able to assess that.

> ---
>  libdtrace/dt_cg.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 4fd2d359..2fb2d0d8 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -372,17 +372,6 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
>  	 *	if (rc == 0)		// jeq %r0, 0, lbl_exit
>  	 *		goto exit;
>  	 *
> -	 *	key = 0;		// stdw [%r9 + DCTX_AGG], 0
> -	 *	rc = bpf_map_lookup_elem(rc, &key);
> -	 *				// mov %r1, %r0
> -	 *				// mov %r2, %r9
> -	 *				// add %r2, DCTX_AGG
> -	 *				// call bpf_map_lookup_elem
> -	 *				//     (%r1 ... %r5 clobbered)
> -	 *				//     (%r0 = aggs[cpuid] BPF map value)
> -	 *	if (rc == 0)		// jeq %r0, 0, lbl_exit
> -	 *		goto exit;
> -	 *
>  	 *	dctx.aggs = rc;		// stdw [%r9 + DCTX_AGG], %r0
>  	 */
>  	if (dtp->dt_maxaggdsize > 0) {
> -- 
> 2.18.4
> 

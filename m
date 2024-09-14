Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2545C208DA
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726337288; cv=fail; b=HvFHzLVtAfkla2+l9SDI0PD/7DqoxUL5h0/duauttY9hLqwD6IoJAaDIrPfkzN767d/CsQs1TlBbzMj4oBZPqSygfQJYBW/1R7djTODkAt76l5zkH7GW6JgwjSo7kxsH+Ep2FnYr++2MvxiktdouzTtKt+ZM27lkcwUQwQUi1uU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726337288; c=relaxed/simple;
	bh=3LuVT8yDjv8WXdA65LRf9qa+zBBjYt7I3fbeVSCnMWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W8g67qBEteDPkRVDKtpMmYtZ+4+bOn6qNbPqbK7vMZUtC+4tRdqHBXMHqZ/TegyZhFrmYDK1daalNl0kd9xWZ8rEtO3EMugNIj+dDCGmA0/NADaJ+TtDQ4p+xJxCkdZjDpsRh6JWjQaC0ahDfjTSNdGImOZjnjjmI3RN8ZYF9DA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OSuv2Cmn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=h0vME9uD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OSuv2Cmn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="h0vME9uD"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EFmtrN011301
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=dspKZ7qq6E+5xuj
	iln/m9/Rs2XlamqQNxwPbN+FJUZ8=; b=OSuv2CmnPu8cpgjr47vMXjtjh2QVpM1
	hpSV72HsAFH/fTGWZqb2tnbGmWxK/7lDN1tKHRrP3Pcvy5KA8qVuWZaEuW7ntHyt
	vwthk4UBeaoJ//4yezLaPMzA1uJ14VRtM7F42KXHJxhuGM5/Q9M+z22cLxtbLR8v
	+2KFpYGstYoT4UIBh1NpbyFrkIKLbCSfpt5oAEE86U81nwWGfDjov4I93VSdK4RM
	IsKwbksRF+HBci7zpyegOZzopHhU41j1WsPh/A/zNvxMc90T6aNjurBqmiTMrzuv
	+lE9paGqkVGhhcFb+X5tj1b1+6BGXUSrAPJ8bL4Rb+CU1zk4c7CE7Vg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3ns8njp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:08:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EF6gbd019192
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:08:04 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6dvv6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:08:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdeNnBOZ7N8E/ysZOHTMujYDAaa0lzDnRItOjylxHFC9BSlbjJ577Gm5W1zptSd6NzdhyD488aHGMm+BwzVlYfwuJumaJX0hAx6aInnkP0cYxQFZZqb4OR/H6xyya0PMSFq+y91pfN/J/HyX01uC/WGQsN0xIISuNKDPq196wq38uGFFHzAUgT/6cdDh/ttviOTWSJtJY+eOBagvKy4bySaKDsqqIRVlZ+VYH9NcftFqAO7OvItnYgq5GaXA1MGeCW+cGNnuuKygn2gSBdFWRcir/WDgw9kDe61kENOTsoz6cu1ziwEQX41GegyRP+0wSrDFFPrCK1+aPaXP4ey9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dspKZ7qq6E+5xujiln/m9/Rs2XlamqQNxwPbN+FJUZ8=;
 b=BJlFKoUnZXmWvO3s9z/TikQMi2rtWr3K1cmdNpqn/aXBJUNRJYLb6MdnxrHj0o8ZJ1LTvkR13UbkbI3lRWkDV9qy3YqYfqW/PY6C/JNf0mPy/UzzPbwMiKCywuAbfbhiaVqTFiak7hEoLiItLrJWEfZ+HNiiGJvO1+xndTjk4kisXJ3YYwfJAs+Tbbo/q4J9RpEVgSU0hkIepR7SdSL3a2m5WWNG6QlxrH0md01TBJRe3OFZF7A6PXlp4K8Qj0c/u87k1gB+mU2JrH7cOn2cVSkHn5VHrEBHJQlucW5w2P76zmnsDqmtxdPMGN20mLTNVH+EWd3ICK/silU4GiKMVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dspKZ7qq6E+5xujiln/m9/Rs2XlamqQNxwPbN+FJUZ8=;
 b=h0vME9uDbGFCXwfXXbfbbD0k3L8VXB2DKb9Kk2Q32LOdxe1oTsP3GZrQey82CFxYSEZiucgUFDZUK+Z/WJhrq7ZK20gpeU7ISBq+8m9JU1qTvA2p+vmVMOHO5/OgycZA6u910aQ5mwR5L+mtI7xCbRgKp191x6gwy+Tax7W0Nqs=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY5PR10MB6216.namprd10.prod.outlook.com (2603:10b6:930:43::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Sat, 14 Sep
 2024 18:08:02 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.011; Sat, 14 Sep 2024
 18:08:01 +0000
Date: Sat, 14 Sep 2024 14:07:59 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 17/22] test: Tweak spec sizes to bracket size jumps more
 narrowly
Message-ID: <ZuXQ/4CMmzk0nUmo@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-17-eugene.loh@oracle.com>
Content-Type: multipart/mixed; boundary="aptZCZwHk8iUOI4Z"
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-17-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::21) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY5PR10MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 788c8d61-b1b7-48c4-7554-08dcd4e82c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dJN5gro2d978SJ4AFC/NeQV8rHL/w1DsWIvs/gvZivkI3s+Q9CEDJmsPQQAA?=
 =?us-ascii?Q?cBCwBiW+j4nlGY0+mZIFdtQyJaCMtDS1DNZFe8/d8ptZXf4X8ggUlPhviwPb?=
 =?us-ascii?Q?BnPIHwj+zRYkRRMUI2q8/Mse6OpDbyFtrKjF1B1lY1zNgGB57/vInxPWGbD6?=
 =?us-ascii?Q?/h9wcjoMomQx4t1e9r9uE1FOZGnxL5M68pSN0f9IzHq0hoazjV5m74IcdNAe?=
 =?us-ascii?Q?y10Tqfvt8IrzVQhM5kP/jkJA2YQnv0p94xwuod42lwG62n5/7JP/CBpkZQOt?=
 =?us-ascii?Q?tyxCX3SVjGLv3yma+SmjisEbrbDn7WJZzYakp0wBNgxXXUSsDpubw5YpmG2v?=
 =?us-ascii?Q?2Uv73V4XHa5/4e07DXPJFlNiXUkE57nKm6SllcxGnjDl6C5N1KyRXbzmiwBo?=
 =?us-ascii?Q?ai8MuwV/6cXAoCOikIIwUGFD7JZ8pb99Ms+bs7TUWO2pyeI9NORVjSvycygC?=
 =?us-ascii?Q?+AhYxRfMUfKtdRZ1UYQ1fD7ezvZElTNUr3mOxgC3SLUtJLph/QmadtH4X1EY?=
 =?us-ascii?Q?gWe/kr2TodL9MOgywXAhPME7WuIL1bNTFrKNOpTBi8bIDW8hcdfT4lV5D3k5?=
 =?us-ascii?Q?lhCqHL+aQpDOjbciyudIuu6aY/USA+IVuZbEIpZcHpYXrKwxCLZooruDEODw?=
 =?us-ascii?Q?hyrrI7qcSW5tfIfZeLrZsdIAVEs90CJ+SCeX2E63mwNGSogge6gUEzmWwxQh?=
 =?us-ascii?Q?YxyjlzKv4SR9VJVsizS7q6zp4odpik2eGvZ4RE5MikyK81QTAVVWDi4YWp/5?=
 =?us-ascii?Q?nwvOp+KcfmghKJ9iBW4qorBPX2C/pcypPc46hAfq0KtMIOrv/hI/4t0hojwx?=
 =?us-ascii?Q?A1lGQPToWzr0ai36+xIVjz2mYjuD5YjM3M02Aev1LYcS/j4eUIeqFqQUsB+Y?=
 =?us-ascii?Q?6NkLQHw1SzvPi2UJRNuHnuLOivT9u3IsujLuHqGTrMP7poR65BVtgWsQnU+W?=
 =?us-ascii?Q?/lztsCH3ejbPxV1lTXtnd/+nVlcTvlwUSilsOJstzAPLQcuVq1oax9b7ZsS3?=
 =?us-ascii?Q?Au4EqCX7vviFWgRTyrEuhqkClnI878uW+KxgWVBIC5cYOwddHzR7hzEwxi7g?=
 =?us-ascii?Q?e7m4SLRFEc0Wm0YyFpdpDNTEhiJYgMIGFhMcf+qDJeaHA1jEm2H9ZoUlC5MP?=
 =?us-ascii?Q?UTJ22uk7lcAwUiAinXSOn3KdZrBMzv1qgk95K4TEhVTBWF1ddcQgBKE2DpoY?=
 =?us-ascii?Q?rAW8xDFgUTsqEtF38oulNfPKwjjhquMNpwpq3lGt6oySmlIxN+eq5I7bOssZ?=
 =?us-ascii?Q?MV0BEAoHO7JXgOpr7oPbhxTMekKw9rSK3IM626eAMv9CEr7Bt80CPEf8hNGf?=
 =?us-ascii?Q?/a3q+vZ7SIhk5tRMjJDzQO4cTdABNar3aezpQWun0uVEpQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IBSTpRSQTSoT56+YwkRB3HG8KNXpAlgA9OAmAMsQ2XETr0eozQAKtfDQXE03?=
 =?us-ascii?Q?2nGiuNKj85DIxxlhjHFEythIfK6VipE+7H6YxCKNZau8vLLP9arEP9LqWkwF?=
 =?us-ascii?Q?B2K2bnbRtI76nZqawsdxuu4xckLKozRfyZ+d/XjTf/6+qxjM0V8+H13ROMmD?=
 =?us-ascii?Q?PsEVqZpvP2/88sulDEnDqlThTDcXtuYZtOvRkxZn+jzkCTCIizFOZq9uX27a?=
 =?us-ascii?Q?vc0U91W1XIbZrbwj+hKTbh/mJyUIxM4bttaZx66+WrIK0JaojXKGX2Q2ZI7g?=
 =?us-ascii?Q?YyGQNBLLcPDTwfqs8wd4fqC1mrAo9+KeVHKqkjhqRJ2avefqSqxkkJ0CE9aZ?=
 =?us-ascii?Q?35VWkFsKNEAWSzdF/B5WzFdQ+argy4b4kWymvWLL/xDKt7JkzwwEm7gLzuVI?=
 =?us-ascii?Q?mVbJxK0p3ObS9P22o9Rvwb/2i5odyGZbfg2LC+Oyg+6afKKMsuecZy9goyrj?=
 =?us-ascii?Q?e6zopaXFKw9QU5BuoMcESj3TAcub6S3CY1MI2SYv8Z3jUq+C0xBS7RRgPcMu?=
 =?us-ascii?Q?wB20v1IpvNGddelPEjg342l+Be3VE0BBsOQe8wNa4z4uwwe4q5Q7xgZ5F8zO?=
 =?us-ascii?Q?4IHQWfPl8vaS0Bl4B4bzFv/CKuzVZWyQJAbOI1qqwwzkejqQ1ERlauH1LHDM?=
 =?us-ascii?Q?YeLYDRAtDFVw3nexDIfXk6BVsU3t8PeriM8wmwgT5sDgXgnOMCcU7B6tmi1m?=
 =?us-ascii?Q?KmbzvQ5ARY6h5sEU1ATpE1r0rHGxxePj5D7/c3y2KMXkzHZjvcizfOXoubfw?=
 =?us-ascii?Q?vwM6EAhC5XGm4q3lsnBmHOCt3LA8MCbi+eNKc6bv51ou1gziNwkX66jpqM4f?=
 =?us-ascii?Q?G0pdgRbyeCKx+iRQJCQsufRk5nHr0T+phiBNxMXg+nle8ZOPOasFk32It5B/?=
 =?us-ascii?Q?Dxi6Cq0tPNfyCTxFPDifwFqlJ2FrXYaZdHPhK+BtbduhqC1nNBRTIYlnpmIR?=
 =?us-ascii?Q?DzKcpxdw9WL67j1chAk2jk7nzSkKiZ/kRod1nhsv+9CV0dUSjNrbTffn9aBz?=
 =?us-ascii?Q?eR6VRRY4+t54afp7gxe0Cq4zIkcEI3s5iRHKuCOBeDBVXMnD95icLlr3dxhn?=
 =?us-ascii?Q?eV62gjN7HaNj0hbA1q2YH/qaUg+725q3oIjFRPEpCV9mUQYqVnL3J+61ORJi?=
 =?us-ascii?Q?NzOVk3Jl4aywwWv/6Ob1jd8K+XUIkWSKWcmAw0/+sXbXUaUw7Xg1jeRhSCoJ?=
 =?us-ascii?Q?cg0sn9HlJZDR67g+fyGEHdOKpyzI3CLQbh+C7JJ9Jd7nTu/Jb9FYpLQSBBN7?=
 =?us-ascii?Q?UueDxpYoxaY9y7kANxpRQuIPeypEsm5sWLH1eh5AJbIWpoGjF3zkr2bPfECY?=
 =?us-ascii?Q?52c1jqC9GbZ7mWqhOYLYXviWuSozhBH96Kxc24OQeNppHfS2gQE3h7OuY4mG?=
 =?us-ascii?Q?YpJuyBIhRHSMf8E0xU09VQ2SOTM7pShJZtCTd9+OS1iEOLExhZpKMa+95fCy?=
 =?us-ascii?Q?VINUIidc/bmQoSgHAyLVTbF/viVEYu6NhEQ3RvCky95UW0QfG2j3mYvrEmoV?=
 =?us-ascii?Q?Cw8qINq7+RSAEzdEr7qTYLX2TLLD+TbXRZOXzbKS6WdIPFfDSPOcoGOjXvu8?=
 =?us-ascii?Q?ePGjV7Dil7++WKu2Kj4EHrmBi+cVH+t7xwl1B+EIkMnvixjTu5j9vrv8wQ+P?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G4waPYCoxCROQMZNXCK7Mw7sAf4O4v+KFeSA0csT7+08UpEh997zHipLavvC6rhcm4NfbxWyn3x0lsxO6vjTYvCIohjeP90BvuVCN4RlrCpBzvlXN56JMJLamr/5pqMlvjywAsNcWQPPsy8tTEWNch7uQbuQTBL2yHSLf3SawjKpHV5LY2qcnqv6fTZRTfRfYHDKKywmsAkr3sd7J34Gx4itIisnY2W2ptZRuVqsZDo57ADkXQSa/VZbFCpUb1Rg+XvHzuoIxoRkC4/pFXospQypY3j/T4wXFydiv4ePBfNXHp/MrenrUHIslHJakB6JJ+gC0FO8+rFO2lYMRvCH7Hnlz+18ecZk0wrPBJJa0v6mK2mSZ+vBKBkDhkdItB4aGRKXDKzQoel05v+xaMU5oRRdf+MMMB/uymvDiqL1FYButpG+ZcJmuGDkvO/fHvv9yUIWsCbDzWBXr2KBozI3rzLpCTdAak+3hJ2Y+4EAWS+6Fp6uVdWZJtU4WCBjxDuzg/jrCdmFMw3WzA6Te1+gMA7lFCeBp4KHDyDnFWsFwGrqVO7vZkPY1RCXyyziJo0h3rGqw7/Ls/omQGfy2R+qT1hDKqEldf5/kgqg+HLS3fE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788c8d61-b1b7-48c4-7554-08dcd4e82c1f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 18:08:01.9193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8loQDv7uMPKdC+72cUghF6GhhTsiuGE+RSZz3/oF2dn5oT1QYo8/bgyeptSb0kj9l9XtPyXSc7VbyRJJKErhgXZjOge/47PsFxKWJvJIFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6216
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409140127
X-Proofpoint-GUID: ofBhQBoa1sT5n6wAS9z9_AiFmCaGVgIo
X-Proofpoint-ORIG-GUID: ofBhQBoa1sT5n6wAS9z9_AiFmCaGVgIo

--aptZCZwHk8iUOI4Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This test gives me faqilures.

runtest.log in attachment

On Thu, Aug 29, 2024 at 01:22:14AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  .../speculation/tst.SpecSizeVariations.r      | 22 -------------------
>  .../speculation/tst.SpecSizeVariations.sh     |  2 +-
>  2 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/test/unittest/speculation/tst.SpecSizeVariations.r b/test/unittest/speculation/tst.SpecSizeVariations.r
> index 51f0596c..2748b307 100644
> --- a/test/unittest/speculation/tst.SpecSizeVariations.r
> +++ b/test/unittest/speculation/tst.SpecSizeVariations.r
> @@ -11,26 +11,6 @@ Speculative buffer ID: 1
>  123456706
>  counts: 1 1
>  
> -Speculative buffer ID: 1
> -123456700
> -123456701
> -123456702
> -123456703
> -123456704
> -123456705
> -123456706
> -counts: 1 1
> -
> -Speculative buffer ID: 1
> -123456700
> -123456701
> -123456702
> -123456703
> -123456704
> -123456705
> -123456706
> -counts: 2 1
> -
>  Speculative buffer ID: 1
>  123456700
>  123456701
> @@ -64,5 +44,3 @@ counts: 2 1
>  dtrace: 2 speculative drops
>  dtrace: 1 speculative drop
>  dtrace: 1 speculative drop
> -dtrace: 1 speculative drop
> -dtrace: 1 speculative drop
> diff --git a/test/unittest/speculation/tst.SpecSizeVariations.sh b/test/unittest/speculation/tst.SpecSizeVariations.sh
> index 75e527d9..79995b59 100755
> --- a/test/unittest/speculation/tst.SpecSizeVariations.sh
> +++ b/test/unittest/speculation/tst.SpecSizeVariations.sh
> @@ -9,7 +9,7 @@
>  
>  dtrace=$1
>  
> -for x in 63 64 79 80 143 144; do
> +for x in 71 72 159 160; do
>  	$dtrace $dt_flags -xspecsize=$x -qn '
>  	BEGIN
>  	{
> -- 
> 2.43.5
> 

--aptZCZwHk8iUOI4Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="runtest.log"

dtrace: Oracle D 2.0
This is DTrace 2.0.1
dtrace(1) version-control ID: 76d327b2d33c377041b8f1b3dbd67de7f2cc7b65
libdtrace version-control ID: 76d327b2d33c377041b8f1b3dbd67de7f2cc7b65
Linux kvh-deb-bpf3 6.8.8 #1 SMP PREEMPT_DYNAMIC Mon Apr 29 14:26:32 EDT 2024 x86_64 GNU/Linux
testsuite version-control ID: 76d327b2d33c377041b8f1b3dbd67de7f2cc7b65

test/unittest/speculation/tst.SpecSizeVariations.sh: Running timeout --signal=TERM 41 test/unittest/speculation/tst.SpecSizeVariations.sh /scratch/dtrace-bpf-user/build/dtrace 
FAIL: expected results differ.
Speculative buffer ID: 1
123456700
123456701
123456702
123456703
123456704
123456705
123456706
counts: 1 1

Speculative buffer ID: 1
123456700
123456701
123456702
123456703
123456704
123456705
123456706
counts: 1 1

Speculative buffer ID: 1
123456700
123456701
123456702
123456703
123456704
123456705
123456706
123456800
123456801
123456802
123456803
123456804
123456805
123456806
123456807
123456808
counts: 2 1

Speculative buffer ID: 1
123456700
123456701
123456702
123456703
123456704
123456705
123456706
123456800
123456801
123456802
123456803
123456804
123456805
123456806
123456807
123456808
counts: 2 1

-- @@stderr --
dtrace: 1 speculative drop
dtrace: 1 speculative drop
Diff against expected:
--- test/unittest/speculation/tst.SpecSizeVariations.r	2024-09-14 14:04:10.560046706 -0400
+++ /tmp/runtest.27272/test.out	2024-09-14 14:06:03.926307171 -0400
@@ -1,5 +1,12 @@
 Speculative buffer ID: 1
-counts: 0 1
+123456700
+123456701
+123456702
+123456703
+123456704
+123456705
+123456706
+counts: 1 1
 
 Speculative buffer ID: 1
 123456700
@@ -19,6 +26,15 @@
 123456704
 123456705
 123456706
+123456800
+123456801
+123456802
+123456803
+123456804
+123456805
+123456806
+123456807
+123456808
 counts: 2 1
 
 Speculative buffer ID: 1
@@ -41,6 +57,5 @@
 counts: 2 1
 
 -- @@stderr --
-dtrace: 2 speculative drops
 dtrace: 1 speculative drop
 dtrace: 1 speculative drop
Cleaning took 0.022518012 (0 kprobes, 0 uprobes)

1 cases (0 PASS, 1 FAIL, 0 XPASS, 0 XFAIL, 0 SKIP)

--aptZCZwHk8iUOI4Z--

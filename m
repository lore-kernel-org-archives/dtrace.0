Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B0221FF2E
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759851476; cv=fail; b=armsocfxFqOAjur12cwJI/zEcTNoOyFYEo55sLb8Ru0/UYt+x61HWOqaoXQe4DB/xKzR1E29t4aUagrkSXXIlW2zo0eJC4Ji0phrsCJ42gauJQyEnjYSQ9RoA1o/cknXH9aBtSTduW8Qk+4ylO5EPV0KffSjUHNU1D3MYXuhFmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759851476; c=relaxed/simple;
	bh=lVltZO7menz9VRCq60s0K9D3N9579YRsjbSHSt0at7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rT33yVgDbD9fMNkw7zrZKFdOVve2BG56FfJroucE8orb4PTYvBOK6l/OkhL4R02M+nQAjS8cwJFa7r+2qEbRlZsowZAzLxxH0UZNLm7m9cbut5ON0IiZn0eNiMTrQUCbxT0oz0QHpGd9Bcsg9kZ0yfbiENeXGHF1RYOx94dwozo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JpuV9nTI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Na6/Z9x9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JpuV9nTI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Na6/Z9x9"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597Etpgm014739
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=cAUYik2rSrDbXpScQl
	O45nmB9eY+eE06AU1ctHhdFKE=; b=JpuV9nTIZtshJK/FWWQ5uIfUfvd1wQCQ05
	y775W7Mwbk061kCEIwsoFcucpFdW78lMtqRG1GjX4oa8s8XejHWyjpdJzimqBHIe
	5T0M51og2RINGFrMdoIh0ZQb320SNtCa1ukD6VpXiTDjxgQZKT7qPN7WD4I15SM/
	rBxCeBsYAJipfBbgqcwFmR5qkMiF4Y/qXhiqupv+E6Q0PGtpPt9BRh6J2aYWbjnq
	Jbig5gLp2HJyRtZhCF5bLudXTbPYJPy06r0KI+6onDyvoHfPfUvec6DpUVbdJ/jc
	PVl5vgxGheLAFCLJT5eiakRVAesVCHyJztr51OKbuvfWbWdcDoWA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49n2me0h6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:37:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 597EmFcS004234
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:37:52 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012003.outbound.protection.outlook.com [40.93.195.3])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt18m1kp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:37:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXWbiyDayMl/kHjlhYrfjBA8m4cARr8s9nR5s5G6yroYh9thZOBEFW+AkK7UbK0Lx+FcEttkWucqClLl/DCUZ9C7xBvrQEv0Fr2N2NocyNU18BI7Q8jHFMGMF/mCgbSHoWj8/mol9WaUjloP7K//w3TEBzeknf9mQ5cFG4MDW725zeFghVvmmQV6a8X7NOTTHYMY4+6pczXhBC36U6s4tlcGaS7XGJ4BLJ17D/Zy1jhP8ecs46OenfUgbmVDkA7pKPesVSMyc0nA76pl7fa2Q0/WVN7U2OQjz3AhKtsdW+LrVJJtFl2UOvFB7yoPp9MRJcky1M/ap+QO0fWzsr6TUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAUYik2rSrDbXpScQlO45nmB9eY+eE06AU1ctHhdFKE=;
 b=eli8mWfLWhRzUM4NnPXpIoZ6z8f8HoGe7TnD8OaDaV5SGZdN43tVjSh+JpNd6BAsDhlo3/1f0IpwXUTZr6tmuRonttdUAdmCuE3TSenI7qn0+u/zfMz7JCwwFnoVbgoCWHLxxbVLrN2EoDUKffXEcWfzis5WvgTJg5vFv6oB5KC1cbS4T8xI1YwT1XlzRBSd4JrIGKB8Ko323fT2P0RvGwITrFkiDVyMC/xQxNELS0CCfo06JLVJ+Ni3Ke0jAWiy3QEVTv191Az2EtUZXKUZLLrvliiCSPqLCbZgLXNOQBpldHMjraA81MqTh7LM+XMN6NDXajEDDc1Aer+dBlf5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAUYik2rSrDbXpScQlO45nmB9eY+eE06AU1ctHhdFKE=;
 b=Na6/Z9x9pyCVfaNih4f0TDVK3vqtKNRTICj+Q2nedgfj7jTgvDFBhD4W1hhkm0j9p/q+1VE6UoYvNJRLHh8wZAkloyvpO/I1NkOduM7ZpYhsGRif1JQZqiKIb6O4/SaRmKb0kjF1sxoqsyqAMLjsJ3g1kPlPyKDFYNcOFFXLcVk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by LV3PR10MB7913.namprd10.prod.outlook.com (2603:10b6:408:20f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 15:37:46 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 15:37:42 +0000
Date: Tue, 7 Oct 2025 11:37:40 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/4] test: Turn char[16] into string to ignore garbage
 bytes
Message-ID: <aOUzxAmFtyumMnX2@oracle.com>
References: <20251006215726.8893-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006215726.8893-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|LV3PR10MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d0f395-911a-4676-8646-08de05b77498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3sxP37vdYTzaWqh8c65HzuPyrQQHCXVkD2+JTiF4d3tq+a0RlvkHncs8LPBW?=
 =?us-ascii?Q?fwSO24knZmtejh8BIOkOYim+xjpwMf9GKuvz1xpV90SckmyJRVFXnOhfkfUb?=
 =?us-ascii?Q?5PvSNMkYnG/cV+6rkGOVvwx+Nr3G5OPiPjBGDPOoZoztaUdywE3c3P95Onu5?=
 =?us-ascii?Q?Ybe0JQY9jNVzEmeRc5HjDn25O8K3dh198qTlmeb+OwTz/N+kpSuAg60oXYGC?=
 =?us-ascii?Q?eFgOQXyfBi0ukq3Ra0hES3SRsgziKSBF/LOiD7W4KaK/eU5FEFMaEZEV7P0f?=
 =?us-ascii?Q?EBDYcUHv6F0TKe/D6mGnr0nPUIsDSEwNGuX/ewdFxTvUyud7dYcOfsdzEzNL?=
 =?us-ascii?Q?u8k2f2bjaVllK3L/369dHIb/0rv3nBcJi2GWXelEVSdxUbjgTyzHxbai/kvE?=
 =?us-ascii?Q?nmQPGU4160qPiBLvZ6nHVe1mGpK0WTtsn56H44vbsIRlkV2cJctyA2Sl/xKC?=
 =?us-ascii?Q?mDYatrdlXctJBYN+RU4NsplcVBRiFJkVlrYgu3tG6e+jsWZxdPbxdIx6HfLw?=
 =?us-ascii?Q?EUDrpdfqZnxbuXT8AHk+BbvJ++iw1Sk84K56Qv7GVaaesiBjOfeMoWEmcom2?=
 =?us-ascii?Q?GYnAHm4ir0pU9IIIiMuxbVOlpUe3rY20AYfq0JjzqhbfYgQrmYlHkUFAYuYn?=
 =?us-ascii?Q?lJ9a0weoLrYlDL9FPhOnY5HaF9/RcXOlpu81GiPs5/7k/r41YV1JUh1HA2Wz?=
 =?us-ascii?Q?KihK3VBJoSlUY3a2vQ5utmAiqQN54zNKW7mHyoCULyPyNYVa2VkcRqwJ0vK6?=
 =?us-ascii?Q?EgtAtpDqWetI+1xsxEovG2sgOUW0BlqSfogiMH4qRiU6vr6HWyGCWPfZ0MzX?=
 =?us-ascii?Q?foPcM0SnDMcxiuiXVFnm1BCftQlHJVSYLKnQdjRmNP4lK8YjxpEtpAJR+3Jq?=
 =?us-ascii?Q?OpI1iwJL4H6uXtF3lzKpPHWonmPACyfyjH5S+AgrqmFRR7Gq2MlpUw9YKmd4?=
 =?us-ascii?Q?j3TpGb8DtO35eCMIi145k4X0tI1zg7PwPAHT1qGPTJ1Deh9cyAP1u4ULYN9P?=
 =?us-ascii?Q?Pti8R1b2UhbNBYSIl3AA1eRfEQ0HTGAniEJLTmk15ypPoZEHkCloee97nq8s?=
 =?us-ascii?Q?BpRZzLNwPk33riB1hTVJummCTiuqud35ASJRSesCR4RXM94jlUHuSmqC9lWi?=
 =?us-ascii?Q?TX/6lYQ2c9O/1l/DKNFE/YMiNfoU8JFpyuOvE2rbgV0IV+AulPczCrYmGMZh?=
 =?us-ascii?Q?ouyCWkL9i88MEvcqSexErS1Sc/g+2mOyI5k9RRJ+Jw1KBFNfAyeEQEhdnGY/?=
 =?us-ascii?Q?B+fGpRnPboPlM2B9OwqYpAnJRg/LlBCPpdyiHQj7highsQl8LwohFQN2B1tt?=
 =?us-ascii?Q?ZjsfZ/TzIB205+3nlWEKBo+nN3nDwkxYyxgczUX+GllPF41YlIso4fnvlgAM?=
 =?us-ascii?Q?iBBhtJaIEhEV5tpFHbFl4rEXcDqlbUwdOZf/DyBqwhpH4m47j7T9wKan07sc?=
 =?us-ascii?Q?2k05wBQ3xWg4nLCRg/IgE7p6jgKXy02b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VH93Gx+UIdsBaVbtllUiFmJmf5YNtjjinAKFVi7igF0nmY7CFWyLFw55eN51?=
 =?us-ascii?Q?VYOASBr0JhGBatEn38SpVNkFd1HX1LOXU9x075ze/qyjwoSl1pd3BP86KRo6?=
 =?us-ascii?Q?0hMtnIFVOWTBB9JN+MrvlCT0/2QwzTPR8bzOx3F0UpDyBap1O4plHcrtOqUN?=
 =?us-ascii?Q?wxAixk2B9AVzzC3SSOXspTjyz6wLubf+0wQul4Zqlaph0VMPShTE7Yw3loIG?=
 =?us-ascii?Q?jREubEk8Sb3azAWFBqgX+wO5aQtRgOS1s9LHUHcQKj9cCqRrmWQcvGWfQpj/?=
 =?us-ascii?Q?Ih0dCPSxTGGf1cBUzmwvVCIuJcjO2vX93I7rPJQ8qmjdIiwPg+yxgTp/uQ2p?=
 =?us-ascii?Q?4D6TtWuHLPWbAe5i7hdqplPXndfVaKNxcHVMExdg518KRcIg8QuG/LH3qOpX?=
 =?us-ascii?Q?VQvYUhZ12MyWKzyE6+MkKIrC2LYBkkd0GXz8QHJZKtV8Q7+DASUvvxqpFfa8?=
 =?us-ascii?Q?vkodb9XH/8lapq1TViRyCmHV49qh38VmXUcNnm4XtEJmoP9+zOPwW88QQ2og?=
 =?us-ascii?Q?tmWfLB1D0yZS56QevBrg8wOU9uJZVpFW8VD2Wd+cQ1WHljfEhX/JInXIhxvI?=
 =?us-ascii?Q?yxnguE3r4EgufMjqgmbiGHKONNRBx5KsDE+NghVQClRPTa/ZsRQEVc68gj4a?=
 =?us-ascii?Q?bTO8GjytQQG3sk+o6l7onBCPn2pitJfTaxpGi/tK4eoEKSfC6LPfOxpof3rB?=
 =?us-ascii?Q?A6IRPsVwlBrp91swr1AuSGx8qesztBzbqX4YxnZTTwMGLKOMqD9L1laXaHyn?=
 =?us-ascii?Q?m3I66N1aK/VvqF+U5AvgTZ1JmYtSXOEaGSHn3WaDPSrl0nHr1aVdNvMy90uF?=
 =?us-ascii?Q?41ERU1DxKLBYdBOqzU5JX2Iw7crl7XlEXOjPv9Im5jcejOeKMaI/RFJTGC/s?=
 =?us-ascii?Q?kncf55mGfF6N/c3rU7avWjidxX/Gkd6L0k0fwcAL3DYZrf4kycV/gqe3vUZd?=
 =?us-ascii?Q?QzWlm3+77c5Cl0Xv4dLuzb3nXGRfYzAzMZrb5N9zs1iq7CAdaViAXjJu+TfQ?=
 =?us-ascii?Q?87UAJPbs5hc58VlEpcci6uY0s/olaoIYxjoVYcpjbSuwQT8OZ4G27XLsUaoQ?=
 =?us-ascii?Q?N1csyP83yt1Ea26eYxhmGY07axcEVhl3CA52eiMDra5Bptr+051w+i9zUhhI?=
 =?us-ascii?Q?lk8ZxoKicM9PNAm9vHTx6Eo6vqJFJWa6o/NIZIxSveRbQEVCWf2mlML0Zept?=
 =?us-ascii?Q?Fb+BX8OXPKmZ+zQeoqhNNLW1cTAQaDoE9bqo8iRG0q2XFXjirCnAvK2c553B?=
 =?us-ascii?Q?0H9ci5pR018pLqcAIAEjD703FvJ0blSLcpS5TCnIX/XIaILZy4JzODjVEQM6?=
 =?us-ascii?Q?p67JiHalHcad89lAdGUlLFLbGqtbnDr/BsaU05kD+qtHOlDOJgZNQ7QV2SAa?=
 =?us-ascii?Q?CTdjqVn2747TtyYWWvMiqIkiXp95+rgR+Kh+p1CDGY7otIB+sQV6gTAR8V0Q?=
 =?us-ascii?Q?ZZ9gKElVI4R001rDy17/BnFwQ+STOtpGDijZyZtdR5G5Hqm2kFqe58/8vjrT?=
 =?us-ascii?Q?OTp5bh9Z+xNgRBzc7HspUiA4XhN6mTgVr82cujSX98+6EzF2iuCSalnNDLwt?=
 =?us-ascii?Q?01JOkrNLlqvCoaY+Qm7SOq60ajwzD8XQTDh3yoVdDSvp7HM9X66xgFW35Tbp?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZFog1X24LYrNUnIbuLeRaagvt1Jem8vsLfi9W8aIB+ShsPEBEyBVE5upe4uWSZ0kk/6wAX06PqgDW6ZsHwbxca65a3Bki/3TadEyVcoqhBgIUhiLq0So3zfe2/lYwJoQySkDyVyqBFsND26qUdtiAqnfAyoqaMGvG35x3laJFYAhdC/DlA9DPnjP4A5cOlC6qH0SQRIn6+XKqswXDGYwy5fZjAVxf3doNMeEyKQ4URO5jSCj5Gd1Vmzj7/k9QYGG0l0sFxD9hhDldqReWFTldepbX8/k5Wbp/lFLHGHOPAwzLyGnR/saqM38doy3baH9ZvCp8yJRYtg73FlwUggnnh+/ccLG0trf++cFdF+9DRSk97c9DfyMKNoounCHf33Ec9wEd3GX4TgB+kNfJOiFz6bKPW4ygcR3GoMCbxN4Vpw+JDjTgzunp7EBCNjp4YugZkmxLNS2UBDQ55Ephuq4mtPKabYw80Yxnder4ZGcq8nUSPVjXW0/LcsXwyh0BI123s5ieSEZoUNir/fEARKdGuLRyW8YmVyqofr3z0q5ctH40CjuA049FycqKHAYLEQsS4tQ9BoSJ53khhSnWVixcCutAI/OIqPrDT+gtmw6eTk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d0f395-911a-4676-8646-08de05b77498
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:37:42.7696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xRwvaSnuajVmtSfQHc1RCfQAFIvKNKOOcmBcM1uRjjVvLkuKCie65+uEyuSFmiunmodAxvV+00U8vtm+4tWLJqQvsW1g/nQqK4TtsrSc58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7913
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510070123
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDA5NyBTYWx0ZWRfXwRUl0zJ/laqN
 HJ2rtV9drktsgE0btX8soV9VoDLPkHsKy4lW9jv2yGi8IGg46n/Wc3hnMxTtsi39h2oiXrMU0Sn
 XN1glkNpl1bopxySwNFIkFB1q+iA9mcl6a1Xi4HNMSXuDahzDJsSYuo8CsFeT6D5j3uSvRm1tl4
 Km5APYRoj51AfK+93KHyi1cVM2WEeEI8rxMmt8XHPAMZEMg7SauKJhxF6W5gVm5ks9U57NfVXXn
 UmKGwoTiey8Ht6vk7BQ251YjxrZRx9jvk/WnIban8Bw1t/6F/1kMCPKw7mhCTCRqEI5L/Ot4UjY
 YmiqgTWR+W25py2ugTk8Tn6cB7vc1gGA7X/EuV67vRotDXK0GlEBSrI79S1a0qJsRaJyO2ec1D4
 46j6ddUiPp98YYdMDt1r6a4a4JWs7w==
X-Proofpoint-GUID: iUcPi-f7zXthh9XPjnUz_LSehwj1_UK_
X-Authority-Analysis: v=2.4 cv=aL39aL9m c=1 sm=1 tr=0 ts=68e533d1 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=xf2Xk48f588XTbloZe8A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: iUcPi-f7zXthh9XPjnUz_LSehwj1_UK_

On Mon, Oct 06, 2025 at 05:57:23PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit 308e996c0 ("cg, agg: fix alignment of key components"), a new
> test test/unittest/aggs/tst.chararray-key.d used a char[16] as an agg key.
> The problem is that the char array, curpsinfo->pr_fname, could have
> garbage bytes after the first NUL byte, polluting test output.
> 
> Since we do not care about any such garbage bytes, convert to a string.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/aggs/tst.chararray-key.d | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/aggs/tst.chararray-key.d b/test/unittest/aggs/tst.chararray-key.d
> index af45d4a5e..2bb638372 100644
> --- a/test/unittest/aggs/tst.chararray-key.d
> +++ b/test/unittest/aggs/tst.chararray-key.d
> @@ -15,7 +15,7 @@
>  
>  BEGIN
>  {
> -	@[curpsinfo->pr_fname] = count();
> +	@[(string)curpsinfo->pr_fname] = count();
>  	exit(0);
>  }
>  
> -- 
> 2.47.3
> 

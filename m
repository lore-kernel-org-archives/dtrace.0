Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E315323BD0B
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753130302; cv=fail; b=cq65HWVryUmAfL28q0CBEsa49qBwNEQgl/FQX6EHPfpXJ7FiqHTsPwcG8jspRjUbw33R/Y3jK2Z5/nx5l6wR6zrN/mDo6Kghq4NL4WIynsR5cG6bqp2BWkwwIWE43lns2Y+Jr2bYhX/aDsHLK0DiUVotEUGivzQb2I0VA3fQEME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753130302; c=relaxed/simple;
	bh=uCO1IdmBlgxVUqH7g7uyt2ZI7WIlKqJr+vk4hH2uHgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ze7n0ghg3lsu2xvBm/y3OGwBmJqjESfpp/ER8pxYxXf8vGvFP+qE6t7ZH1AfSSRlsmpxSIiH5KbX7a3ARx6lZqzXBzJaa1yeHDZbNWk/GAHD9AgD2obwX0wxynmSRnPjmvdvIDsi/5SWRCeQGVSZ9ST0Zp/m3ZB6c2gl9fwgizI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Tg6G3/oG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kMNu4MrI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Tg6G3/oG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kMNu4MrI"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LKS6VB016466
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+srb7CC52rVOu3ybQm
	lmVt7bqD5r6TJkn1HNpnk9p2o=; b=Tg6G3/oGb3TUNctrqNi3ExgqJp7YVnyMOY
	PjEXrLzjvoIbYTpzbPdXvotiWAar7Zy3ijqoVCObpm94ve7w1oDH/3dereTwjPKU
	6sWLjqoP7GLrrS/hroxgGc4IZa4wyNIyc0TLB0KeO+0R9OwE6AZ9GFmUNrvdqMNF
	mphK+JPzQXQrgworpwL+uWLPfSFQtZNROyvWvs7SF2sZTWYUI5i3oWkUA8OhIs7v
	juaoEW4JE78ToHAGViIn3opYCtbcLtGl6YdEwv8/BfpX835Z5DqHZtFvAmywplS6
	7jAirX0pmSLa+mxCSKPBaUsuT5DZZ0HH0Q3C/DesM7bZYKDUIrQw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805gpkrys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:38:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LK9wp2010333
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:38:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t8gynh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:38:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwqWHtw8muQmQBY572RYNzYWZj59pMU68FYl0sGelygLoygw5lY1lOAGiO65sYEoSPnRI2JI9RGD3pe5dnKbApk6MU9XjKKn2z6Vur1UOaZ4Auh+AEBmzyJWFMlxNuiE5AnIqRvXQ6dra3qUlIfcslGWfpyihH4aUIZnyW24XXAsBIThPNldJhPMGalzSZH4P7bpVOf0rARdhbii/4vk5h28GfmgsJLVDgE84EUTtnsbKyv57PWP31ZwAtzTl1ZWo3DSF88dPid0EQHc55eUG0ZGMuxEqVRbeNWTKLwBVeizHsj73PtKEVKZ96grwboQSlcC3UJiJhR3NU3beuuTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+srb7CC52rVOu3ybQmlmVt7bqD5r6TJkn1HNpnk9p2o=;
 b=PnU8h5OvrY6XXUJc5Q/aeDKsgMW0ILaoM66GXIPtshaKdHBCgliRlLi4xjHK7vgRDk/NCYo0U2+mKLCutZXBastVduonyBxuuci6CBi4H+VahHX/+2+zNXLeSaq7uNCfYk1/4cfSUIEXFq4lepDA0PHvQ/b8LkfRMcpk/iJWijrUbcYIyEg3+8+mLUQgA7W1ktqamMmBfbdn+vqwwjQx7pEHN6LauqZNp79OYUsJQN4FfKNnXPK9JZ1G2lObJt+VKr7jK/8DPg30nBeL1Pft7WrnmUx2D2pRB4+bUhU3WhxjQcvSP1J56K5PHmW39v78eXbQFrFAUWQ/g3zzgyF22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+srb7CC52rVOu3ybQmlmVt7bqD5r6TJkn1HNpnk9p2o=;
 b=kMNu4MrIw2H/FzEDcPbQ29aGC4LxUlpKHOJhlfdPaXTPl+vN0rFBeeb2/Rd9HS+v0BK86hCPBcS9j+jWPzskDuHj/NIWayiQPwWjrJxjJBKFCojHfXt+JbJlW06YO8mA98X3baJXdNE0ZZvJZSI29wdRaUga2US2vWRzwHHKt10=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MN2PR10MB4240.namprd10.prod.outlook.com (2603:10b6:208:1d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 20:37:51 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 20:37:50 +0000
Date: Mon, 21 Jul 2025 16:37:47 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v3 1/7] cg: move get_member() to dt_cg.c
Message-ID: <aH6lG8uF2/mwsC7c@oracle.com>
References: <20250709140948.15090-1-alan.maguire@oracle.com>
 <20250709140948.15090-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709140948.15090-2-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MN2PR10MB4240:EE_
X-MS-Office365-Filtering-Correlation-Id: e6620d9e-0351-4545-4f3d-08ddc89675ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G0efrwTLkDCRfu3KR/1v27xL+w4B5xPwb4rjo73pBaOVnHl+k5ybzY1Hoe2d?=
 =?us-ascii?Q?GNLkDpfybKspCbrbjvAZII6y+gcX/yunCEGRfWexCC1IoOUcQ7etj6COeyV2?=
 =?us-ascii?Q?gEViOoh9tMoxXxBE+wbfujIVftBptfzkvtqtsqKK2RZYlVJeRwPaBRY+i3n4?=
 =?us-ascii?Q?5vKXnHF9SVS9LezjDQpI44FAGs7rxSDdtlAjrXFFdWMoTg0lRiVci+u41YJt?=
 =?us-ascii?Q?HDSVu5BGm3ghlmORdblxz2BDCVjrl0fto3o8aMvvrBmz3IO7GUt460lj5tdA?=
 =?us-ascii?Q?lQ8AasSCNax/7wBImyFCcqPngW5AEb9p4ObiFzMBGsI13IyrWRsbmSXVoXsX?=
 =?us-ascii?Q?aswkLNnCmrbslUyBSrGjrcAfETH8/7TvZm2z57nkHCVVOHQhwvMbbUqkuaFm?=
 =?us-ascii?Q?z0KLKcRRse8yF8EeibBlVpGTNjkqkcN16sI49T3wH/Z7Mizhop8RD1TUcYYO?=
 =?us-ascii?Q?Oqz3kzAlpeCOeW9aKhJJrJ72M/ZJhzbUrlvUPrG4c1d3B9pHQAM83ratRHq6?=
 =?us-ascii?Q?LdTRgfqAmci7lpGmdC2CmknfhdHQOCXMVvazH9oRzhIuROO9eNRRymgGykO8?=
 =?us-ascii?Q?64qLRWXsBR3qwHNJsDpYdq3mh4BNojabP7zw/CDsTTaSrbmCpYdhrsWd2R2O?=
 =?us-ascii?Q?9Uo3SnvVYyq9coDft5Ut1XGr3T3qBaxROVTxVI5XvAjzkBuDzNMPw5qytWt5?=
 =?us-ascii?Q?QGRXjDEBcQPNNVF4oA88ljQlfxeoAjvm4mmxUgdpoKDQMYFtx84Rx3byw6ex?=
 =?us-ascii?Q?mndgzoNpsQHKxqsQx9sxBuA8JZGp8oWtEzIlLoXhvA6s6Y/+97kIZ6WPn2PC?=
 =?us-ascii?Q?dl8ph+In/YmUD7YMG0exgo5nRNatJ0ddXkRdPSXfhLNnjLG5Wg06Re65hitj?=
 =?us-ascii?Q?B63y4O/vLo/1YTfp6d+6UbZ9EGP1kNrMMuEn2WbBotVZTRHGUNjIrjh6PZFe?=
 =?us-ascii?Q?ZUFyOPuMxO312OtH2w8YuD2A2ZYWHbyZSB6jGdg822+XA8y+6aPyGjrVdPSc?=
 =?us-ascii?Q?D4ZDNIZjaaYG+P/FH4DmAewgKR6s4YgWX/Nqh3pTwrMIi2wJzkrwLWsQnIc4?=
 =?us-ascii?Q?gKxrKNOpTDLL70fEc6hH2ahDBUOhdHirxO+P7cV0eTX0mFB+zQr+O9YChStZ?=
 =?us-ascii?Q?1Wv0JCGof6faQ+7J/L+VrWEbv036OhhnzqVfqw9vazlU7AmCagN45cyEZk2C?=
 =?us-ascii?Q?+UVXaC8Sh1C70lyYvzuxJs2s9zBPjRA9cIq35S/8osxQeBXrj+FPXOejji7R?=
 =?us-ascii?Q?JizK9gLMzI1C5FLRnD8XbHf9UgGUE0tTSGhS6NH4SRoJ6YIL/QwJxiKgo0jp?=
 =?us-ascii?Q?9Dk4pRnRoFj35grOoMfpSNz032sKVWqK7cQ+ybjg8pMyosf7h4kInT225+/F?=
 =?us-ascii?Q?XNL8fo+ghnAV6fW5SG9Sb0Vf2DAonsd6vDU03FQLmDCZVTOqqbdRhF0RbY1H?=
 =?us-ascii?Q?6nLlWyajmEA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fHpSem/MQJF+IdNN1HmTF7O3hjMQEDcKPbyCvb2VcfNFL/4FQkl2QOrq85Gh?=
 =?us-ascii?Q?aHeyIfBdDLsgW2sQsfW8/WmOFW98iY1SUaWoNzAVT+hDP99F09Zi+ad+d4RI?=
 =?us-ascii?Q?Duf5MvZRkuAaVz6bi/7+Pi84GuJYNGJOnxV7XMDqKsaQUjsuCY4XSVjAx2Kh?=
 =?us-ascii?Q?Bft9lqQUF7RcadbH8Dq9sMFWPTni50D8bHxI1twJz9q8wL0/oaj/8OYxJSjM?=
 =?us-ascii?Q?cUtjwYnAkvKewz1R1gYxH7W8Qeo4XaN1AZAJENl3nAFph+qSAXIXIdAI3UPz?=
 =?us-ascii?Q?k6JjXqr9zGppoE+L9RSqtqkQc8Al+U0h3qHSDuxFp8IUivhR/QB4ZOhBSSvB?=
 =?us-ascii?Q?6+PPs1lwSO31SXZk6WxyUnRKEqsu1t8pDZGNHZgmGlTjKYZLK8LtVHC/TiKD?=
 =?us-ascii?Q?ml0xX82xOx6ltYMvN1/9ro17lgSKOrx7MG4FKumY9rzR57HaxDmII1T535XJ?=
 =?us-ascii?Q?3gUJP3Vzx66fV6S94nTB4195BSc/nfdhRh2ktQH9WyXvFtmIt4D+qdN5AZln?=
 =?us-ascii?Q?d6sZJJlCWUxLZGJbbxIpBoBNkyrxburSFugMdF0Nt8llc6Yoq25D1ahva2Qy?=
 =?us-ascii?Q?Rbca85JGju5LtgD9fatiLlSKiXO6iPFHsLgKmQeoYziYQrlx3aNhEC7F2cQa?=
 =?us-ascii?Q?2aky2RlRPRPEGiglny2rs0R+l2QWnZM37WKRzdXq16NIaO50t2La/iH3TEpT?=
 =?us-ascii?Q?QcmUdwPILan4Z5w7VpyUnFtcyJExWtXsMA/eVZz+jLVUbME1vFr95UrtLNO6?=
 =?us-ascii?Q?Lt7KJMIqZBPr4D24wgd1V92fDESuVioU46DGh9GhE/sXORCdekbAPgFbFb6O?=
 =?us-ascii?Q?UDe6ypfinXv+JjLrZ0jXhBAPG2JPIPoYeCw7ef1NE6NQR9+XaZNTbB5B06pT?=
 =?us-ascii?Q?DSfAuR/MiJkJGSSCKq2hV7+JVr6F8nBN1lqOrsoTQ/mJBduI7VplC06iuzcN?=
 =?us-ascii?Q?s1Q95jYgJNTQU/SrwHw3b90bvghhdj9ze0lEcICTFCrscvMmbm/5xRK9Z1Jh?=
 =?us-ascii?Q?tCeRPAG/htEKKpL2/bzYsf5TahKFuEbqvLIL8d5xJk523JwowtJyC5ZX8Pju?=
 =?us-ascii?Q?aimWdedj9zwEKadyDu0EaUc30vDxp9Up9ixBm2tjCiNgeascGlIrAInP6Af/?=
 =?us-ascii?Q?jB17oDF35IIWHf3YaKqtilcHFbF52bMgSClZiIgkyM3lChL3KasSs9W2C7Lj?=
 =?us-ascii?Q?BJUmZrFgI3hxHnampXopgIVK007//Mcs8J3fPucsvtVQ4KoaxpgCfHAdOBcj?=
 =?us-ascii?Q?qaYMAJck3T0MuQquVUSZCPy7zZKIWZFQ+kv+R+e6LOyFDLVY96m/1gUnxeVi?=
 =?us-ascii?Q?h1diUwU5hj+SmXmSjVjlRQKbOCwAFqb9GOkN621jKGtmc7XVgQ3ITvIf4qrR?=
 =?us-ascii?Q?4PrqComRGOtiXwwcBwXsR6j2nwgO3yXdVVQgUErILhMlhLpHPDref1lxUV/j?=
 =?us-ascii?Q?XW/lAH1lM9iFcxAGBaICacJuqa5PwaZeu9agojtCZEHKdzJ7auP7e3c7+X/m?=
 =?us-ascii?Q?kgUOALa8n4jT2GZNzSmVZEjMdTMxNwX5Owk7EcHO01o5DBKyfp+n2WY5t8OY?=
 =?us-ascii?Q?OWA+t7m2/09ST+od7DjEeQrmy5DvpimU4hVBd8kWGePPXQnqsTJZKG26KMMA?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LWapiiRLUG04Tr9x7YwygPqy9p6rxJa8bTEPp1QlXfe5QShS64e66xtdkhvf7vYfTsOGWD+0OdkcgrZsLNyxT2E4vZl1Fx6MvsUL6BR2nOc4aDR6LJJ3WpiT1CpOOJLSqV111YDZBzwUK1UYq3wbQPQHjBMwpt+FcPC5OcL/w8CgPWMZJWzoXFoqzgNIaDZ39mHq4NvoKuQPYTNXXvU8lnB/EdQ5UzqZaawWJ3lbTyELcr4iEFOrJ8aHSUnbJIE7L0nwuBEIQFdIIxD/hAlX26GczASizDZlFo7qI/xHRxwdvsNOKIFcnoTYcMg8fvTH13/cYBvwoTig42IN+pnZYWX3qpZxKWZSBb5IVE97k+NapUsnUXGoJhjrOrfLqjcuCPoYY8e86eXHQ7w3PHQdqu9ajOXt1RMz1HDr6NxY2F6gA1SFpYHGa9IvDlw/ETkyVd7CZyvKjE+zuegYfuV1bkhKL68JsHk8oxLeDATCkOtlGRfowLqWRGQp0WkcKvMnfGS1+xTjezBrA2qk4HVHYZWMRYZPvD4C0nb1G3e1atXKm77KR+ZxVvtVH/26wldu97MVTqlaWVO7nUKYSXjdzHfPoa1RcsV277SR9ivdOA0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6620d9e-0351-4545-4f3d-08ddc89675ba
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 20:37:50.3180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4G7gaA5TJRWFNUcoqDWt+oL3Aaq99RKDKOs+kA805l8k2rn5v0OzW3jC5lFCv5CtqW+6AH2uJQQoFlnDMULGHYmfgUP6o1rBcggYHGSv3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4240
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210184
X-Authority-Analysis: v=2.4 cv=TfGWtQQh c=1 sm=1 tr=0 ts=687ea53b cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=vH2_BQLiWLhG2Vo86ToA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: hlTQAxUQIwcIIHJmaLwZ1-jyxCuFDqZR
X-Proofpoint-ORIG-GUID: hlTQAxUQIwcIIHJmaLwZ1-jyxCuFDqZR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE4MyBTYWx0ZWRfX5tBWGK5PD34f
 iJdxNxWGofGZZdUh+W8EiciEB6qFiicOey89JVYG7fvO44wxV7TRVgpj0RAN2j81vrWA02reS5X
 2GpFV0ya9rLplWuXsjvrg+MbHKWnSmcyVoE4HD8lvxbCyxBxbvueAKJJlKfLZTyr/VRIBnP9cgo
 mBp5Mi9ocw5h+0dMHOmmwDP/vCLIbolx0Sbs77OJBJQMuksxQNEp8ZxYNsDqHOsSeqKnzvD4hnR
 ea7ZyxAjpR8tdNInbl+TuvNpi03YLk+KDEzt0A2bNvvUjHTFo6oIkWgQvDNoRnaMUS1QlRh4Qvr
 +VIB2qaPVTmVgMcdmomvTNb1vLjZ8h49Sg2XK/vrs00rZZADo33giKRsdPd+TnIS1QROZJdqzpE
 zy8Mul1ZUGwnwdmPgB1GRILebwSq5rXhcZPV2dOGM9+8dt9LNVyblWCGisngROmUcORZCcoN

On Wed, Jul 09, 2025 at 03:09:42PM +0100, Alan Maguire via DTrace-devel wrote:
> It will be used by both dt_prov_ip.c and dt_prov_tcp.c.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... albeit a newer version that is a collaboration of Alan and I to improve
    (what is now called) dt_cg_tramp_get_member()

> ---
>  libdtrace/dt_cg.c      | 39 ++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_cg.h      |  2 ++
>  libdtrace/dt_prov_ip.c | 45 ++++--------------------------------------
>  3 files changed, 45 insertions(+), 41 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index bd0763d6..d6fc8259 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1901,6 +1901,45 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
>  	return (ctm.ctm_offset / NBBY);
>  }
>  
> +/*
> + * Retrieve the value of a member in a given struct.
> + *
> + * Entry:
> + *	reg = TYPE *ptr
> + *
> + * Return:
> + *	%r0 = ptr->member
> + * Clobbers:
> + *	%r1 .. %r5
> + */
> +int
> +dt_cg_get_member(dt_pcb_t *pcb, const char *name, int reg,
> +		 const char *member)
> +{
> +	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
> +	dt_irlist_t		*dlp = &pcb->pcb_ir;
> +	dtrace_typeinfo_t	tt;
> +	ctf_membinfo_t		ctm;
> +	size_t			size;
> +	uint_t			ldop;
> +
> +	if (dtrace_lookup_by_type(dtp, DTRACE_OBJ_KMODS, name, &tt) == -1 ||
> +	    ctf_member_info(tt.dtt_ctfp, tt.dtt_type, member, &ctm) == CTF_ERR)
> +		return -1;
> +
> +	ldop = dt_cg_ldsize(NULL, tt.dtt_ctfp, ctm.ctm_type, &size);
> +
> +	emit(dlp, BPF_MOV_REG(BPF_REG_3, reg));
> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));
> +	emit(dlp, BPF_MOV_IMM(BPF_REG_2, size));
> +	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_BASE));
> +	emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
> +	emit(dlp, BPF_LOAD(ldop, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_BASE));
> +
> +	return 0;
> +}
> +
>  static void
>  dt_cg_act_breakpoint(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>  {
> diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
> index 81b79399..36f587d3 100644
> --- a/libdtrace/dt_cg.h
> +++ b/libdtrace/dt_cg.h
> @@ -44,6 +44,8 @@ extern void dt_cg_tramp_epilogue_advance(dt_pcb_t *pcb, dt_activity_t act);
>  extern void dt_cg_tramp_error(dt_pcb_t *pcb);
>  extern int dt_cg_ctf_offsetof(const char *structname, const char *membername,
>  			      size_t *sizep, int relaxed);
> +extern int dt_cg_get_member(dt_pcb_t *pcb, const char *name, int reg,
> +			    const char *member);
>  extern uint_t dt_cg_ldsize(dt_node_t *dnp, ctf_file_t *ctfp, ctf_id_t type,
>  			 ssize_t *ret_size);
>  extern uint_t bpf_ldst_size(ssize_t size, int store);
> diff --git a/libdtrace/dt_prov_ip.c b/libdtrace/dt_prov_ip.c
> index c4a3a6e2..37f91e3d 100644
> --- a/libdtrace/dt_prov_ip.c
> +++ b/libdtrace/dt_prov_ip.c
> @@ -62,43 +62,6 @@ static int populate(dtrace_hdl_t *dtp)
>  			       probe_args, probes);
>  }
>  
> -/*
> - * Retrieve the value of a member in a given struct.
> - *
> - * Entry:
> - *	reg = TYPE *ptr
> - *
> - * Return:
> - *	%r0 = ptr->member
> - * Clobbers:
> - *	%r1 .. %r5
> - */
> -static int get_member(dt_pcb_t *pcb, const char *name, int reg,
> -		      const char *member) {
> -	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
> -	dt_irlist_t		*dlp = &pcb->pcb_ir;
> -	dtrace_typeinfo_t	tt;
> -	ctf_membinfo_t		ctm;
> -	size_t			size;
> -	uint_t			ldop;
> -
> -	if (dtrace_lookup_by_type(dtp, DTRACE_OBJ_KMODS, name, &tt) == -1 ||
> -	    ctf_member_info(tt.dtt_ctfp, tt.dtt_type, member, &ctm) == CTF_ERR)
> -		return -1;
> -
> -	ldop = dt_cg_ldsize(NULL, tt.dtt_ctfp, ctm.ctm_type, &size);
> -
> -	emit(dlp, BPF_MOV_REG(BPF_REG_3, reg));
> -	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));
> -	emit(dlp, BPF_MOV_IMM(BPF_REG_2, size));
> -	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> -	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_BASE));
> -	emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
> -	emit(dlp, BPF_LOAD(ldop, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_BASE));
> -
> -	return 0;
> -}
> -
>  /*
>   * Generate a BPF trampoline for a SDT probe.
>   *
> @@ -142,7 +105,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  
>  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
>  
> -	get_member(pcb, "struct sk_buff", BPF_REG_6, "sk");
> +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "sk");
>  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
>  
>  	/*
> @@ -150,11 +113,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	 *	skb_network_header(skb)	=	(include/linux/ip.h)
>  	 *	skb->head + skb->network_header	(include/linux/skbuff.h)
>  	 */
> -	get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
> +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
>  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
>  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
>  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
> -	get_member(pcb, "struct sk_buff", BPF_REG_6, "network_header");
> +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "network_header");
>  	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
>  	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
>  	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
> @@ -168,7 +131,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	else
>  		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(5), 0));
>  
> -	get_member(pcb, "struct sk_buff", BPF_REG_6, "dev");
> +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "dev");
>  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_0));
>  
>  	return 0;
> -- 
> 2.39.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel

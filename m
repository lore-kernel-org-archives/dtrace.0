Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063362877C4
	for <dtrace@lists.linux.dev>; Fri,  1 Aug 2025 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754070575; cv=fail; b=VOMaMijM2i/62A5NGiO6rLAd+iwnhFhBMd9xqJm/78W0v6djnFDZwCLEFaM3Zb+qSQ2iRt2OA8alwdmzQwZqy9I8yqwRn7Aw7GBEe5FoujM7ORuDgE73psBSDja7DXS+lEa7sO5NMqJvq5db1Zt/5F3aE2Gpqr7+goNElwGp1M8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754070575; c=relaxed/simple;
	bh=5O5mF8Qk9IkKr7+AqcYU43wiWK3D0pGCHWRlV9l7tis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ierhc7/xNFkOgJSEeDdgC5TPw3dXeZMQAjsSp8ElNW32ZZDId/yB8qkUnlNPjKo9aKVyRLDGF9jPA23HAipDT/UidOH/mDQZMX8CARb0raeicyIncEQG7OXJqtzWb3zknLOzwdihgPcK4GS5OHZQfL/yoyseWQ96xUHOaGG2fvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CjsV9U3M; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZGtH7s6S; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CjsV9U3M";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZGtH7s6S"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571En78x016943
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 17:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=5lmFB8wUDoYS/mPI9k
	a5e3HdNu0TszRL/CcD8mr136w=; b=CjsV9U3MkXw79+8e79lm0R88CXsIB6j0Ni
	ws16ZhCAx/FYc6DEVMj7Oho1Tdli1qZSuIRHaVicp2R8QW0ZSZCFYmVl7mqw5z8Q
	yvnTjEAZ9K6Sw3Q0qjXlRBmHGIohXaTbxiv9d+tFLqIQ3risiVGiivhjdjRhEJbd
	Gx5FL80r0oGlFulIoJt5+6OStrpqSALlzpdsHon9kjE/1fj3FcaE0v39XxMOr1W1
	js8+PKfEbfTP2fF7mHnk8CvHC23GKLwCLpXLGuNVeMLlyHFnDvwKNH5iCJCFIDvp
	kzQtZiHltaOPBTZa61Bb8KzBlOfCfFgejIzQbqa8bEFDXl4qvdJQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 487y2p3m3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 17:49:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 571Gj3l3035146
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 17:49:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfeaeup-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 17:49:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwWXTyRZwdXOSK9tkpdnXvrdzMqzmg5VTpp+FG6kTxQhzf9yJOv2fCUufcGlBJObwwAC//uibISAKTDLCe0S0LZiCzsdNLQtk4lTvIrIUCD2j6Cx5VNzTCs1slN9YZLIa1MoGdLl6OVxq3/XvVBIIVVgKMJBK5BV5WiWPte0pvgaQlmro3ymD67t5zOXdeoswCNgmC0eFv2P6mgYnv05M1QiquKNR6FtZV9GkqI3i+B/1YFoHhv+8NjChuLb9MCCpK+cc3JvsWejs5xI/Zc3AnZB9rzSpSIMc1YjaXaDPzo7ZGviCjDym3V6JNEnL+IRZfENVy5qEqbJd0mLiZhpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lmFB8wUDoYS/mPI9ka5e3HdNu0TszRL/CcD8mr136w=;
 b=LBfLSr6izgswenNo2LjWiHe0dehrNamY7syzGYQTcKLIXVBWyveAOl6BNHrQpz9t+Z3PVSXH6yNqwlffehoF7PHVAs0E3IflIqO5eWKhd9AjN9CLxVP6sEINOevTSv3mfPBfviNKxGHLtOPYx72Ch08ZAsDZdjVZSDp3BL9iybyokBDxocJSNn90h97CfaB62IyZILByTQN+Os4ZWb4AjpVy/TXwtQcOs6mjQln5j9qTw/NUFPaKTp81Ai9+pGoFF/4kCIHgVPrG4NyLonVDlvQ9oPVZOWKRsX8ctMeJmssM246RQIRcwmajhRVg4l3s6RlW123oodkr4KImeTn5Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lmFB8wUDoYS/mPI9ka5e3HdNu0TszRL/CcD8mr136w=;
 b=ZGtH7s6SiARRxUYXw4LYfGgz/FV59Tjv142iNHYqc1g0wNyDwjtsrij2qqMfq9sTBDhxWJZbUIR2BZvdICf5+797zcPdBnYfRe5uU0u8QKjQHfAPTy9on3IWeMN4+4sl/eSGkgaEKfKEGQU7RHGVDRD3gGj7NzHwoFluMHQILVI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BN0PR10MB4981.namprd10.prod.outlook.com (2603:10b6:408:12d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Fri, 1 Aug
 2025 17:49:26 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 17:49:26 +0000
Date: Fri, 1 Aug 2025 13:49:23 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Need -w for destructive actions, even if clause is not
 used
Message-ID: <aIz+I0xHukj6+lrL@oracle.com>
References: <20250711044024.1587-1-eugene.loh@oracle.com>
 <aIze8ZQ2iBFSf0J5@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIze8ZQ2iBFSf0J5@oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BN0PR10MB4981:EE_
X-MS-Office365-Filtering-Correlation-Id: 47cd3f7c-e449-4066-50d2-08ddd123c1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i+kl9CEEsEVu15OfBVsmSKCkNl1FhP1qHDsLIg2FzKerx8vsuB0zRItvx4q4?=
 =?us-ascii?Q?P6Toteqh137TfemzJRpiD7Fdm5THV0NCmt++Ml56sAwFbMegXbETwNaUKUND?=
 =?us-ascii?Q?q0jdc3hUjeMSxln/qnksiTC9nPhINt/bFWdEZ9R/8gzwKOkkG+7yQyTrZzdM?=
 =?us-ascii?Q?oyBA48gwksAqqND8mW8VNGSksmiSy6PmGIcTTZ+QQjSc9lLig+3+UWudqsU7?=
 =?us-ascii?Q?uUAewHODwZjzXbGw/hX1kBv5ec8KWGym2CaTdOClEpnSMEJJs+cuUbZN55Ah?=
 =?us-ascii?Q?cPjnl6ykQCjWP9RO4mAyAKsFbWvb9A6isu48AeY+eJ5C4oMdQDKVOQGGfWGZ?=
 =?us-ascii?Q?ArvdCIruXeegiGBvDPrGzC4LZxL2pITa9oAtt6eWILWra7O2TNcclDlqxMo6?=
 =?us-ascii?Q?ZLevZ78Ws8MjX2v4gHADFxTeMVnlDEW+srIeBohe2PZ9MN5D/XeuqsUPhzxs?=
 =?us-ascii?Q?ehsL9QgXMV2vqiS9lJhIAiwxcZdR4G/oaFjJh+4pSL+FdH2qOMZ580+ZpepU?=
 =?us-ascii?Q?z0efBfYYGWCoeoO38nZbT3FoPAAGWyl7HbBZqlue77N5CtLi1NVO4O8nzMLM?=
 =?us-ascii?Q?4My3VHQyfEexaE2jXeLblbrzfbzaQYdMYPfeDC1/EzCe90PnCKkdqzFaAHbj?=
 =?us-ascii?Q?hwocj40pC8pYlIuAsLK5bbkdu4tNYrlETjLYQuo5LW3QNOOuDVORJEss2yB8?=
 =?us-ascii?Q?5UhCDS2k4ieBAGop5NVRuVP4q1tAEkDiuWtQmX/OCXQDmywICMEnEbQpey3f?=
 =?us-ascii?Q?B2/dHHQv+TY13nYtGHZRywgUM/mvG3tQ60oiFD9y2JJH9cjZ69ZO0gR7yhop?=
 =?us-ascii?Q?nAz4byApHhCIMmyAWvv5NYDosqO2GdmUesL9mJCTppTvX3XdGIbTdvl9bwua?=
 =?us-ascii?Q?tiIZJK/lbLbqd55u7Wb1vOBZV/Fthf0kG/WwyQRG4MlsjCa/bkUFlHzYjKK0?=
 =?us-ascii?Q?a20uEAM+2Igy0i8oegndq970YxtbKnqruxQ4dc/BQU98ssh/xH+QcjLURwZH?=
 =?us-ascii?Q?RvCDkcTHPnbax1W1FynXaaFn2TCoTg0OfvZanpU6hE2osmV67fC5NXdQkYMY?=
 =?us-ascii?Q?924lJY56Qs6qpeRdJc6JkA6oPC+YLJNon9jX/yOQ9mRiAw7nmqVD6tnCzVSJ?=
 =?us-ascii?Q?TFLW7gfVD3YWIuyEKmOn+BHU5wu4cD9+jD1kS//jWejrsE8XcjVH+U8OLpS9?=
 =?us-ascii?Q?m3fmupw7BzT7KLW3MNhlbmmALKu99M4bE38LjZYQWNijC2kuxCq4UIaHzM1B?=
 =?us-ascii?Q?f8uQD/Xdl6IkrKfYwIeZpqE4QiOY7p3L8GV+rzTSLK/E93ON5OrEcWsqxe6L?=
 =?us-ascii?Q?fAspK68zror5eSP87B0bp3I/bQlVV8FqQS7+YiXInTWkZD8i7N/ftDMsODEf?=
 =?us-ascii?Q?DLizQ7S9C6F5BgExd/aN0UxOHa6TpCOz+6vf7Oye5O9lXupaH3YIlJwt++Hu?=
 =?us-ascii?Q?R0BxTjoTzWE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8qMLanN4e+jqw1V+JiaRZbOtzGC8YqAdq2GefEJciXOj0ZKWndi/RUroeWxK?=
 =?us-ascii?Q?rIzAmJoVh5x+kWVWBz71ppAKLf9rNdRHqIVgJWPxXcUVGtwfwmM/3rvdaaUx?=
 =?us-ascii?Q?t3iGfIfio/iAxJ7YypMTbDAacQzdpPW46wesS4KzIsaxdE6bXv28hy9YfPis?=
 =?us-ascii?Q?jhI/EBXBrx+rHNzOgYPFnD8+5Dzl+OH6QjA1hi5Fm5yVBzDVEa5XwvGbp9Ku?=
 =?us-ascii?Q?fe0L1gyFQ5d5N5xbyEVJplPl/+IpIYEodyY3n7hYUaI3NoG6YcVnFCRCQ+TK?=
 =?us-ascii?Q?lk7DFJnTaRiuStWG0SCB9+NWNgbJPLxqYuOQVr/ifL3rdZgj/rSWixi9/Uxc?=
 =?us-ascii?Q?OoiyhjnOTvXrDiTNAYSEvQAKz6xNh2uqouCUqGv6I5Im4xIo1FZDKirqzaz1?=
 =?us-ascii?Q?ptoPJFPPW3wBpXxFEMpMjtWqi4VmsTdebQOhm3glEs8z3e6kiZkygV9VSrxp?=
 =?us-ascii?Q?p/oSd9UnP2xOcsini4TJy/cNa0dCuPPcZKhDnGmqUOlcGuyZVKGho/AgQ4Lg?=
 =?us-ascii?Q?JQ8MUgnKnuw907bh/cRmJmbiciACQMsiyFq474c+OahvxWcC2L3vRWSXJA9y?=
 =?us-ascii?Q?07IzDofDlboI0oI4cJvybx7JlOITVA9D7EjUaCZS169t9rmQK/VQnf2MjqTO?=
 =?us-ascii?Q?OY3TsOAcjVg3DMTfjDA1dJqopzcbzdPgrb+XwVAN4FiU+vEarJDU9AdWUR8L?=
 =?us-ascii?Q?dL0iENTort0WT98EnnuN1mEiFfK2eSYH08J5zq8x5NNykatNlQHddyxPV/+H?=
 =?us-ascii?Q?TPnggX/y+TBO83d+72LkrN1FzQ7TuMAsGptvGYBzPAHKM+Z35D5NKmMbuH/k?=
 =?us-ascii?Q?iw9F1grXQ7EMkwgjgiPq6/9ENaGgvZqE1F8IjFbay2gZaY66KDGhzCSfuYX8?=
 =?us-ascii?Q?h/kX4J+YDKmRIQgrzk15bQsRHrRMkuIxDrWyAuxdND2e0yS9N2rIJBvvkuI+?=
 =?us-ascii?Q?FS6I1GEYQ0FvKhWw+FSDxydgzAe8z8L0TKc2Jn3kzrULAimC6z5k6rUzMemA?=
 =?us-ascii?Q?jgtCRG8+jddDAf/mth0VkTAl7P/XrCA+QwfTkhTb4OU2tKXocOU/czPhzWWY?=
 =?us-ascii?Q?PNwnYYdJnp8I0l78I14GQ1y8v3Kdqpu7AOS8pdT5fbuDS7pEHtw7NeslLdfN?=
 =?us-ascii?Q?9KKjd7B9PYhJEJJCj+S56EvLYz7oA02BHIPJ26k+MlLVB46IiuegBTWCOuE7?=
 =?us-ascii?Q?Qm4kw4uANZBntCLoRLNJVGvCdcsFqSe5maFe3u3e5kcPKyf4mrVbP3dX/akv?=
 =?us-ascii?Q?zD0We7Jt9dSmdRX3hzRYk6vBWLXxtu+T+sIH4r1qoSutdKTxm5c95ccy7KbV?=
 =?us-ascii?Q?MXh+2iEaIX4eI+rJ65kPn+C1069p+CKT7tmjv96JJw6sovxnX1QNrBPoge1N?=
 =?us-ascii?Q?QZCi+iLgDhePEH9UhhuIzIK76FmsFJGWcRDId6zGnDmVUijmPOPiRlYZ9sPN?=
 =?us-ascii?Q?qGiXsNBKH5bzpXwoFZABdfIQb+HCucRhM258AcLuaUpPmovhVNA5rVy3V4SV?=
 =?us-ascii?Q?f4f2RxbiduKi8YFYUO8Ai/Zp5qi0oCWEMJjbgiNlYytkS9DkxFqByVQQn9fa?=
 =?us-ascii?Q?feWBkzdaNtjUp6A7bM0LNxcQRdXsZQrCkiPG2b3jtIrQDMux8NNxtTv24kTs?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZKAT/BdCJPzt/gq8kmuhRFXU39W615Yq/QE7IxKgg3bmRKzkugvYn0mgXv8JI3+IGiZ7QfjJLhCfqgDEFuXioDaJF7qaaW384SyX/89ypgiF3Bp9CxT6t8P4V6X2vShPeTCrxS3IFb80HZwsgT7FzlPqQqtc/4NUe3pHckKSGIZggai67LcsnNh1Hn4hIUjZoSx3n4F0scFySVXw6O7NWEBiKIRl0OQJOhjJJQD7pKH2gBVNK1reZcG0VI8wp0KFngbYSfp6Qc5ncLIt0bM0sYfUL44pmxDOE0WRNWbNLX07DhpL5DgXsF5LuclknTvgjagJzODHQSo6Xsr5YDZ5LbTxnrJmHU3nZZahkSzENxn6mWoxSugOTFzJ2aaJQxepO6YlBiqCBwsvW4RjAi8mjYMf4jfUyhPbzBIJEt8+ftUoUSejLrSaB7JjwBzbb55V0GebX68BzbwnZ0JHTUjeddhDWnvX5Y+7rORUWtt+r2/kznd+HQfCuBM7JGOmH0rAahlSJG2FMRCevXAB7ACqRIJwWt+BBmj0I/fNo7RxEf07CerVRNDTe4LYL0/p07qqYk2mtMsXPvbcdOe7VOmCDGK0mI8arPH0OUaDiYBZRWU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cd3f7c-e449-4066-50d2-08ddd123c1ec
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 17:49:26.5242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmHPznfW/Qpz4lpzgSGCyv93xYMOhkt8kLsp+/8BUvjb3UsMh4MYCYqR+pqeXpRPwPYc4tp4Qd/eoSxSy2OGKAvEziauikh1vQVB6nrOkSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4981
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2508010139
X-Authority-Analysis: v=2.4 cv=COwqXQrD c=1 sm=1 tr=0 ts=688cfe2a b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=lb8mcbRyFir6xY-D:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=6KCgkaHF4Ioanad3Tt0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: NToopH0QZpbcXaaDV0rH_qmU-UfvhWu8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOSBTYWx0ZWRfX92lvyNBxaz5k
 uwtxbqb4N+ToQcilPIwFnZJUe2XpoMTIyOT3UzmfN6LAhjy9vAP5kr0G47AuP2vZavA1hZu8bpW
 BL8ShKkz9+WdP/62kmCKYTsHf/WL4sdfa/RG7bgJ24qZvy0Sc1lkrKQGY9/1BrMmxvbAY8KdeQp
 VTdmhqCJpV/PUp5xYXvuM1LDbbcAPyfkyeaXzxjTxnDuSSrmVbx+ujg/tVA1hlUz6da4OpT4ogf
 re/Mh6aoozySTSjYZi0VGYbOJVM3h5QavHfdcbZd2FWAFJ0U1svcB1wXjzAY7GD8eoT0ge9JrBp
 Ctx5fdEzVBAuT3/+agZ8gkhyYgd9bjS9Nx4mME6G2erxYVtLjADLhgo8BD4R9AjUy4OPzR2PX8a
 EMuhDLltt+rHr+QsV2RJ/Cldmr/lxvOUVtcTihUbE4oaCeZv1nt6GFaE9ewh6C9pjUdS41iI
X-Proofpoint-GUID: NToopH0QZpbcXaaDV0rH_qmU-UfvhWu8

Another question...

On Fri, Aug 01, 2025 at 11:36:17AM -0400, Kris Van Hees wrote:
> In addition to Nick's comments...
> 
> On Fri, Jul 11, 2025 at 12:40:24AM -0400, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > If a clause includes a destructive action but -w is not used, dtrace
> > should not start up, even if the clause is ignored (due to -Z).
> > Solaris treated this as a runtime error.  We should do the same.
> > 
> > The test err.Z_no-w.sh was misguided and is replaced by a more
> > direct test.
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >  libdtrace/dt_bpf.c                            | 14 ++++
> >  libdtrace/dt_cg.c                             |  4 +-
> >  libdtrace/dt_impl.h                           |  1 +
> >  .../options/err.no-w-or-destructive2.d        | 25 ++++++
> >  .../options/err.no-w-or-destructive2.r        |  3 +
> >  test/unittest/usdt/err.Z_no-w.r               |  4 -
> >  test/unittest/usdt/err.Z_no-w.sh              | 76 -------------------
> >  7 files changed, 46 insertions(+), 81 deletions(-)
> >  create mode 100644 test/unittest/options/err.no-w-or-destructive2.d
> >  create mode 100644 test/unittest/options/err.no-w-or-destructive2.r
> >  delete mode 100644 test/unittest/usdt/err.Z_no-w.r
> >  delete mode 100755 test/unittest/usdt/err.Z_no-w.sh

Why did you delete this test?  Isn't it still a valid test anyway, and since
it tests this in a more practical sense, it seems to have value.

> > 
> > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > index 4e7618e05..e2c3bfebc 100644
> > --- a/libdtrace/dt_bpf.c
> > +++ b/libdtrace/dt_bpf.c
> > @@ -1286,6 +1286,15 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
> >  	 */
> >  	dtrace_getopt(dtp, "destructive", &dest_ok);
> >  
> > +	/*
> > +	 * If we have any destructive actions at all and -w is not set,
> > +	 * error out.  Solaris would reject this as a runtime error.  So,
> > +	 * although we could have detected this problem at compilation,
> > +	 * we mimic Solaris and wait until now to report.
> > +	 */
> > +	if (dtp->dt_havedest && dest_ok == DTRACEOPT_UNSET)
> > +		return dt_set_errno(dtp, EDT_DESTRUCTIVE);
> 
> How about using dt_destructive as name?
> 
> > +
> >  	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
> >  	     prp = dt_list_next(prp)) {
> >  		int		fd;
> > @@ -1304,6 +1313,11 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
> >  
> >  		DT_DISASM_PROG_LINKED(dtp, cflags, dp, stderr, NULL, prp->desc);
> >  
> > +		/*
> > +		 * This check should never fail since, if any action is
> > +		 * destructive and -w is not set, we should already have
> > +		 * failed.
> > +		 */
> >  		if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
> >  		    dest_ok == DTRACEOPT_UNSET)
> >  			return dt_set_errno(dtp, EDT_DESTRUCTIVE);
> 
> If this check should never fail, then it should be removed -or- turned into
> an assert as a safeguard.  But rmoving it ought to be OK.
> 
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index e1bb59289..0e0648969 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -1833,8 +1833,10 @@ dt_cg_clsflags(dt_pcb_t *pcb, dtrace_actkind_t kind, const dt_node_t *dnp)
> >  {
> >  	int		*cfp = &pcb->pcb_stmt->dtsd_clauseflags;
> >  
> > -	if (DTRACEACT_ISDESTRUCTIVE(kind))
> > +	if (DTRACEACT_ISDESTRUCTIVE(kind)) {
> >  		*cfp |= DT_CLSFLAG_DESTRUCT;
> > +		pcb->pcb_hdl->dt_havedest |= 1;
> 
> dt_destructive
> 
> > +	}
> >  
> >  	if (kind == DTRACEACT_COMMIT) {
> >  		if (*cfp & (DT_CLSFLAG_DATAREC | DT_CLSFLAG_AGGREGATION))
> > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > index 1e105b6e9..cdb222b3f 100644
> > --- a/libdtrace/dt_impl.h
> > +++ b/libdtrace/dt_impl.h
> > @@ -431,6 +431,7 @@ struct dtrace_hdl {
> >  	dt_list_t dt_lib_dep_sorted;	/* dependency sorted library list */
> >  	dt_global_pcap_t dt_pcap; /* global tshark/pcap state */
> >  	char *dt_freopen_filename; /* filename for freopen() action */
> > +	int dt_havedest;	/* have any destructive actions */
> 
> dt_destructive, and add it after dt_droptags to keep the booleans together.
> In a later patch, we should combine those uint_t booleans into a single
> uint_t dt_flags member.
> 
> >  };
> >  
> >  /*
> > diff --git a/test/unittest/options/err.no-w-or-destructive2.d b/test/unittest/options/err.no-w-or-destructive2.d
> > new file mode 100644
> > index 000000000..eb9365fea
> > --- /dev/null
> > +++ b/test/unittest/options/err.no-w-or-destructive2.d
> > @@ -0,0 +1,25 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: Without -w or -xdestructive, destructive operations are not ok,
> > + *            even if a clause will be ignored since it does not exist and
> > + *            -Z was specified.
> 
> This could do with some rewriting.  The issue is that DTrace used to always
> load all tracing programs, and the kernel would activate them as needed.  We
> now only load programs for enabled probes (and with -Z active, we may load
> some programs later).
> 
> What we need to be testing here is that if any clauses of a tracing script
> contain destructive actions, and we are using the script for probing, then
> an error should be reported unless we are allowing destructive actions (-w
> or -xdestructive).
> 
> > + *
> > + * SECTION: Options and Tunables/Consumer Options
> > + */
> > +/* @@runtest-opts: -Z */
> > +
> > +BEGIN
> > +{
> > +	exit(0);
> > +}
> > +
> > +bogus:bogus:bogus:bogus
> > +{
> > +	system("echo ok");
> > +}
> > diff --git a/test/unittest/options/err.no-w-or-destructive2.r b/test/unittest/options/err.no-w-or-destructive2.r
> > new file mode 100644
> > index 000000000..1a6959475
> > --- /dev/null
> > +++ b/test/unittest/options/err.no-w-or-destructive2.r
> > @@ -0,0 +1,3 @@
> > +-- @@stderr --
> > +dtrace: script 'test/unittest/options/err.no-w-or-destructive2.d' matched 1 probe
> > +dtrace: could not enable tracing: Destructive actions not allowed
> > diff --git a/test/unittest/usdt/err.Z_no-w.r b/test/unittest/usdt/err.Z_no-w.r
> > deleted file mode 100644
> > index b81622481..000000000
> > --- a/test/unittest/usdt/err.Z_no-w.r
> > +++ /dev/null
> > @@ -1,4 +0,0 @@
> > -dtrace is running so start the trigger
> > -dtrace died as expected after trigger started
> > --- @@stderr --
> > -dtrace: processing aborted: Destructive actions not allowed
> > diff --git a/test/unittest/usdt/err.Z_no-w.sh b/test/unittest/usdt/err.Z_no-w.sh
> > deleted file mode 100755
> > index 4f129341d..000000000
> > --- a/test/unittest/usdt/err.Z_no-w.sh
> > +++ /dev/null
> > @@ -1,76 +0,0 @@
> > -#!/bin/bash
> > -#
> > -# Oracle Linux DTrace.
> > -# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > -# Licensed under the Universal Permissive License v 1.0 as shown at
> > -# http://oss.oracle.com/licenses/upl.
> > -#
> > -# This test verifies that dtrace will not run a destructive script
> > -# for USDT probes if -w is not specified.
> > -#
> > -# Specifically, the script is launched with -Z and no USDT processes are
> > -# initially present.  Only once a USDT process is detected does dtrace
> > -# fail due to the destructive action.
> > -
> > -dtrace=$1
> > -trigger=`pwd`/test/triggers/usdt-tst-defer
> > -
> > -# Set up test directory.
> > -
> > -DIRNAME=$tmpdir/Z_no-w.$$.$RANDOM
> > -mkdir -p $DIRNAME
> > -cd $DIRNAME
> > -
> > -# Make a private copy of the trigger executable so that we get our
> > -# own DOF stash.
> > -
> > -cp $trigger main
> > -
> > -# Run dtrace.
> > -
> > -$dtrace $dt_flags -Zq -o dtrace.out -n '
> > -testprov*:::foo
> > -{
> > -	raise(SIGUSR1);
> > -}' &
> > -dtpid=$!
> > -
> > -# Wait up to half of the timeout period for dtrace to start up.
> > -
> > -iter=$((timeout / 2))
> > -while [ $iter -gt 0 ]; do
> > -	sleep 1
> > -	if [ -e dtrace.out ]; then
> > -		break
> > -	fi
> > -	iter=$((iter - 1))
> > -done
> > -if [[ $iter -eq 0 ]]; then
> > -	echo ERROR starting DTrace job
> > -	cat dtrace.out
> > -	exit 1
> > -fi
> > -
> > -# Start a trigger process.
> > -
> > -echo dtrace is running so start the trigger
> > -./main > main.out &
> > -pid=$!
> > -
> > -# Check again if dtrace is still running.
> > -
> > -sleep 2
> > -if [[ ! -d /proc/$dtpid ]]; then
> > -	echo dtrace died as expected after trigger started
> > -else
> > -	echo dtrace is unexpectedly still running
> > -	kill -9 $dtpid
> > -	wait    $dtpid
> > -fi
> > -
> > -# Tell the trigger to proceed to completion.
> > -
> > -kill -USR1 $pid
> > -wait       $pid
> > -
> > -exit 1
> > -- 
> > 2.43.5
> > 

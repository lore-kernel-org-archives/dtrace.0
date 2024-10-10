Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A41E1A1F
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 20:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728593929; cv=fail; b=prqwOm/y+duhP6z1bvWqg2VfPR5AsR5XHWSg1PV2qFVyqiAV75n9UtlMaJl18/wY0OCEAfyBjPU7VkproWyNHQgCAelKIhGZ1QiYgMGAbR0kQFNIGHF6WnV7hpBOFr8adFBjC/w8kklWVAK7lzcOTv/6u5GJRKBR5O2OmFXq+Zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728593929; c=relaxed/simple;
	bh=IWdaM8ThivWA4dKfz7hLoHkXAAk3DcwEqMldBQDcWyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KkyuggFFkiAD/ZQQF3Ja6lHWZBBZ/rJHBbc75eFAp1PPDojItEMDfYBuhQWzjovHDiXvG4EzWq0J4W1tRdZVvExVOVD3U+zMNNGspPkj6wgpZebP58m+NAlYsFbIAvRWeuhbYTcZMBizC5Ltg8hYijpcScKEP8JUEtikcrzn8I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y2vY6Bm/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T3niK2S0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y2vY6Bm/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T3niK2S0"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AJu5ZC005840
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 20:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=XI9P/v8fdwC7/DXQCb
	5bxvkiPkNwc6ND0b8bsjHxfyU=; b=Y2vY6Bm/EZtSfaEpi+b/62CG8tWAjx3Oo5
	iNd8oxKJb5rp6f+TKqUKTGnYzi2K1k/D0NiOug4DEX2k1y4e5QY23pIKVoFRdl3y
	Ga1X6OGyb4xR2lg+AnoUdmi6W8Bh2pN3vNU1ef3RHUEW/Beikycd8Y26ptf6w1bT
	wQ3Kgi/lJQEFa3EwganplGJdaq+bGheuCP1MftKi/zdVLklnGb7EUG7ysCLS+3rA
	cGyQhhPDVM1JLYZNf/bLgIHscpWJq8JGojQqbvfSlhwfgFVArYmfZmK9Zpoz9Kbg
	y//B+SPhbJKuF2BVNjKFwM9FC+n/gVX2bChz/hQGMa5/v76r0dcQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 423034v3y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 20:58:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49AKmlnP017157
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 20:58:45 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwgx4cm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 20:58:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3wcEJLvwS2OK1OEyS/Gk792pmbyAZNMkxahfOy4+8wpOpMu9PLpRPnH0dBFYbtxQh+V29Kh4Jd3sVI0FNUwvGfJLRya5S9Dom9+VIJ2Bl7Ip58vmIKSZjcohWTb38iRYogqSGEVnrM1vshLWY1/VMnQ+cpJ6bOmGFw698sPgxBSmbR9O4WNywL0La/ddLpdp9MqfxYOzICIikehe8txHI6LkIDnVKLeDEF1+pdRyWvpVlU0e0JqdYTUFh6BKB8xsqEwEbRF5OiMmWaAXDSb9JQECLi2Qe2vnvB8t+TKiYXEwXHuKq5qNOTTRtDa8xvATFyG/eaP2ZJqJAs4U3r+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XI9P/v8fdwC7/DXQCb5bxvkiPkNwc6ND0b8bsjHxfyU=;
 b=gFDPl3ax9QC2GA7jSAqIbK6TvccrsZ3VfBe8sNLMzB3D04MkQMq37B8C/EMZHYO7ZghFdMggQpQHjRMM/PZp8669il2VTK6rQSg3b43Jg9QMZXvUG+zuwoZgq79b2vgzUOoOHAhMmRUeYV+XNSWZc5TuSffGCn2DZliQ1/Rw+EBzbNAS7iHargAE+oXFDTrHVUehK9VcQ4ziBgWgfFOzeBEX+RmbNgzCIdk2oiTwH8xt2A+sAmITDahSGf85Op4Asnh25CBGrfSeTHpb7kM5TcZ5IZDA5PNGe0SvbJOAg5agpWskvmug0cs61MFpLxj2yNjxGHbmNgXNI38YHQjnYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI9P/v8fdwC7/DXQCb5bxvkiPkNwc6ND0b8bsjHxfyU=;
 b=T3niK2S0SWxi+NL9PHo1BsUJd/rJZ6kipD1Kxj7ccMQ+Hj88kIOIhVGMRIx2Gw+9+oI6Ta3xg6QmLMiLmJWhUB7JwprJ67B5W2dTgzl4vlYahTKIaLTu3CLpj3fE4ITIkorPN/NzRJ7KJMjFWZLE/7RFuBegX9TcWECrSSVUwjc=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB7173.namprd10.prod.outlook.com (2603:10b6:8:dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 20:58:42 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 20:58:42 +0000
Date: Thu, 10 Oct 2024 16:58:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 07/19] Create the BPF usdt_names and usdt_prids maps
Message-ID: <Zwg//htUraiesZfE@oracle.com>
References: <20241009054535.28199-1-eugene.loh@oracle.com>
 <ZwdeK90de5dmBFT4@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwdeK90de5dmBFT4@oracle.com>
X-ClientProxiedBy: BN1PR14CA0027.namprd14.prod.outlook.com
 (2603:10b6:408:e3::32) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: c83e2f3a-a10a-437d-f732-08dce96e5284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GQJE0nQStO+IJvIVuxBYD8GhjsYloxyx5KboDymuLja16uJQVlL8N6uKz4bd?=
 =?us-ascii?Q?kqB4QpC3fAHqETxm8KpDV54GDIdwluCvyjkDxZ+ypJFZvK4noP0ANwYEdMPb?=
 =?us-ascii?Q?5Bnrr8h8pHuy2VFbB+za+g9lX1HvKJR3t6anoKkt5uHmxtL1/0zuqrwtpERn?=
 =?us-ascii?Q?ZYa3t6fU9RSv0joYJVpXXrQxBo5Ldh/75ftrH4O47pIZ7Jc9+ZeExCaqDdFI?=
 =?us-ascii?Q?fsV7rzkJF0Y8IqAts1cN81d5nQ+phek5sJZ/fAAeMOWACdiRnqQBjXbn5CGB?=
 =?us-ascii?Q?kF1qbnosB7qm/DiGJY4ua1QQ0PQxFFLliWms9qNs+puX/Kk1ubEHor+0ha9b?=
 =?us-ascii?Q?gReXpq5kMwXisZmv4vr/ckCOliJPz8AsMhSgVbvAckL2Kxwe7XDZWvoaPv6v?=
 =?us-ascii?Q?T/WrM6TEowXdKSliVEhfgdQBfQkjJejjW+4MHARGeCQl6lzpC2rIA+be7eQY?=
 =?us-ascii?Q?gh4AXplrDSJtp1HVDhCjVq7xkyn7KCd7rE/GmElJBI2UCsWDKJRWZ72EogPW?=
 =?us-ascii?Q?EZikoRNabD8gEXrVKe7xzc83+jgWsD9oXQtHOrSaFFBkp2Hq8R4qGwplyp2C?=
 =?us-ascii?Q?ETKg1Qez1keg9mSB5p6EAS+j0rNAms0LhcNThL9DeZZhfUPH4rz+k8xS7Kox?=
 =?us-ascii?Q?IxLx2RwktbAD0FLIJ3pkcw84rtBf9IDcEEOepSTr1qvQD7Nqa0l+ETxwk0vm?=
 =?us-ascii?Q?bu+il5+Bihc+jIVwzcthfeR68cuxn42F9xgTnWXkhSQUaXHt8w50n1XGNHPp?=
 =?us-ascii?Q?wcWID/Ole3zbEqyOTD/kvOasTeviGRZy8NOYAmiHvUjQu5+4l7+Gd8l8X2xg?=
 =?us-ascii?Q?Cf+ipKDp5EFhBmZuE4ef48mE5zBc4ZuIb2piZ5NGcvhHQQxWMKg9ITa6khDV?=
 =?us-ascii?Q?dWsS1u++cW3uervbM/q/4iYv3phR4eBDAKC1+Bj8/GrA7h7sDC1XioJ1MroZ?=
 =?us-ascii?Q?9dbUBQ/T277DvEV5X0ZJ6JSZ9S2Pc9kBVBVYQrUdQQ9Gl8++j02wPHbcPW/0?=
 =?us-ascii?Q?Rbh+WD+ZHNrhaGX0xy4eIG1AjxLuYdytL7V14BxEOUfUyubKdGiJWrcSh5kW?=
 =?us-ascii?Q?3y1I9mXvIZd62gEJN+9xO1lbxKbkQrygUySwODT5ZgBuzpbaNgldOKn56p3R?=
 =?us-ascii?Q?rrZBYcRPx/d3Tfv92l5mps9+xAT2eRaER5fVEkGckwhffqkMcZ2ApS5reC3l?=
 =?us-ascii?Q?km7z5qv+AaAXmeknQ81pMWhUrrZqe7RtOOw4GVireslT2+YdyuEsjo0HxKJU?=
 =?us-ascii?Q?I29t4+g0c6WIB+4bJ6H/1aBF0Gz/KJMSu4aLnpbsyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a1H4NflkhVm+7yShdzhLRRps4TQYe8Lk9FR2qBSV5KY+lay383BxzloKfFyK?=
 =?us-ascii?Q?bnGOSYYScAi0dQotk8NYug62FJZMiRJpPUWg0FydsRLejt8kNHmnyikoVYUV?=
 =?us-ascii?Q?fterm4UelyMY0z5WVa4rNRoPtRAtkE0hueaDnoLLyOObj25Z5GiR7nPgxOkx?=
 =?us-ascii?Q?HIY5lqtazlsnwogrVg+FRuDLFhdTJrzqssGZa6NodBZj9SRoaGfFKHTMywNH?=
 =?us-ascii?Q?LibAUQC2MobSYXheTlY6F71SNXoZRq5gLzQuE2yPnj1/jPXYCcGC91tOwNw9?=
 =?us-ascii?Q?mTK8DU0d0BuaxYHydDzecYn8YfSu4fx52nPlarXCNkTgHHzQ04jZrVbLOz4u?=
 =?us-ascii?Q?vaGX0glV0G7P9kUGzhTAxn2xZG6lxQ5o6irQbU2Mv+68fDhXTy0yYzS/3POf?=
 =?us-ascii?Q?fApQsVV5cPjhJ6g3sTrfrHBgF4VofywZQM1IUaON1OZLBwVBmennWneEnCfj?=
 =?us-ascii?Q?Cmqm3GzsqEGQ5OBMkn34W8u20jLJ7aobSKkyphLqWSM9sy+5sUA1qlbuiIOL?=
 =?us-ascii?Q?rg5V88xiTdytnI4q+fYUMYgy1Ntn+89HV3txe2hcjVaBoUXRuQ128MjvRRpN?=
 =?us-ascii?Q?HCNd+vVeiw/XluSkVRDRwxGP9vlmbDKQtqtT65uEL+YtIMK9EXwOvOAtr5jI?=
 =?us-ascii?Q?0TjqVeoyLjpQi/0AH0keDBqUGkqnHYjfJZeTk9aXN2m2Aj9CevRJwpuAzecv?=
 =?us-ascii?Q?xO6Pgt8ddG7fMnlTJxCtAm7He5THRFdfIrbLoz4+LXNWbJmb6YqFMCI+o/D4?=
 =?us-ascii?Q?vxEpq9QgczvtE2eAngPmXSW2BVroa5xobN6PHktvMj7+XuLaVqF1aEpwA3Kv?=
 =?us-ascii?Q?2AdcflhGZ1eyofVXqPO8yzRVkCKEyvzoLCH83qbIdt+b8Pwgs16C5p0lWozx?=
 =?us-ascii?Q?nblKh4cgeGhsXfoKzFAhIGAbkYsbzSI+Z4cCjKcvxsvog3jsnVmmg/FraWqB?=
 =?us-ascii?Q?1CS8s/muqNk3b0vYmXbWHjbJiWFrc8MJtWPlUOqcvb3MKoA7TGLxvcOGaKEH?=
 =?us-ascii?Q?ZS/aPTufsltzpEvzqJIqXF+UCDeYX+ion0rG9u2FXokLf2+hhlfJUEz3iLrv?=
 =?us-ascii?Q?IZXlxnX/vCvO0CJra26BmjFxrk26wG2z1s5Va25TWUh2t9ZqP08VUvLOOvfz?=
 =?us-ascii?Q?K7zA5palG/QblUFxeDK3R75s2T4Orjko8ST3sQ6D47fwyPSyC6fJjSkRHXQZ?=
 =?us-ascii?Q?QZuHyOaPs5hTqo8XHGrzwPoFpc+hdl9aenKtxVRoTt9k++LFjuKY/OcegKhL?=
 =?us-ascii?Q?NQleya2bjVmJNlEooWZkJxSQXPs+hUwpEhqI3PSQUq63qDDVRqLfLEnYmMNS?=
 =?us-ascii?Q?l64Tm33HPBgUC2cbh7J3LbEhgz9gN75h8Ps0hRZHlxfcsF0Tqol74gDQ1y/S?=
 =?us-ascii?Q?NRo7nPkDP5Q1gC1ncS4aIw5/TYaX2FMWxlZ21oEuAiqsuT6TpzXpBDcnvFxc?=
 =?us-ascii?Q?2196YVDqipDBh7UNNCSDM48x2Af38dHWRHfdGmCbC9pfERI4808jsytpUNb8?=
 =?us-ascii?Q?DWdaMvMIbnLwXgLn25Y05qz3msjNuWIcrCx2bHKOOKvaAHUt8uHBINGTONcw?=
 =?us-ascii?Q?35Y9puEL5cryTiahQkvGVuBoWLrb9xi4mMOSQ0c1GFSIdwyYLA1vSq2QnDRF?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a0ANo3u0rIsGG15M+j2lzLYEquH8IyqPxjmJjKZDAL+SRZKYqW0hu7GBUQgvWq2Oj3IQFlMGdt/BsYFHWR/n8SjJMqTweWc2FFl/vTUdKzaWHen/YUshWd5lbIWoSJwTV1O7bRzNZCxQy+DtuKmYbxu32urxjKO2SEy6YzOgeIEDTIhU/+UCi+XvVKihq8Af77xgcit0AVnTfwqN8GeHiAYvlaezDXQ7KIRKEf+MXXdfIyluj631qfXmP24XfZP30h+CXfUxCA2a4m6rbD5MVz1RLZCj41gGpebyYKgB4r65HmcLGJvYfg9h6dGDYXF5mBqe0wHfNEQXHBAlgrjCDj/I+L/usjMFWeCKtmg+CyWbLOZxe1wlGOasnvnBPAqi1Js6gGuvnkN6PKChTb+Lp5dxjcS4kHWSPaOPlr7wvlCbJHbZRzwp5vD2zbMmMBvC7gmhzJft6zNvk8ALq1oyMs6pB50NwuUFTqjcN+nHMPgJBh/beWvDJbq++Bsh1Aw+EVSDIZIUqaxwFUjjqeu5vyMI8EM48wRJEjSaKRE7ufgXn9VGH7q549q2/ePSLxzBTiRE8C9Vlx4A8/We0oThBZbGANESh8g6qxLcRRL50H4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83e2f3a-a10a-437d-f732-08dce96e5284
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 20:58:42.1554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D31NGPsbKMsp0wKAplv9ANA8udHAvs0fKJu/FqPPn9Y/g3WGt5EbZHXzAHfIThs8Y93+QXBLccPYsKAriHgD5HL0eiJ1K76WC5Hjiv8tGrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7173
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_15,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410100138
X-Proofpoint-GUID: VXYkFl_uWmI4yghYG-ESNbbSOMEDCNbC
X-Proofpoint-ORIG-GUID: VXYkFl_uWmI4yghYG-ESNbbSOMEDCNbC

First of, this is (together with the entire series) a remarkable piece of work.
This is complex and very complete already.  Great job.  (I forgot to mention
that in my previous review email.)

About update_uprobe()...

I'm struggling a little with the model of having the function in the provider
(uprobe_update() in dt_prov_uprobe.c) being the one that does the work of
creating new USDT probes as needed (using dt_pid_create_usdt_probes()), and
then going through the newly created probes and then processing each of those
new USDT probes to add them to the running system.

The model that DTrace has used was more using the providers when necessary
once it is known that a particular probe needs work done.  That makes it more
suitable for also supporting other probes becoming available at a later time
(as could potentially be supported to handle kernel module loading etc).

The overall structure of the DTrace design is also more geared towards letting
the core probe handing code take care of matching probes against probe descs,
and then calling into the providers as needed to take action.

I would envision a slightly different flow...

From dtrace_work() (in dt_work.c), a call is made to a function to look for
new probes that match any of the probe descriptions for the statements that
are in use.  This was traditionally done at the kernel level whenever new
providers were registered and probes added.

We can no longer do it that way of course, but we can (and should) do it when
new USDT probes are registered through dtprobed.  That is where (soon) we will
hopefully be able to use inotify or another mechanism to alert dtrace when new
probes are available.  For now, making a call to the code that handles new
probes discovery from dtrace_work() is a good alternative indeed.

So, I would implement a dt_probe_discover() function that looks for new probes
by making a call to a discover() callback in each non-PID-based provider.  For
now, that would only be the dt_usdt provider implementation, of course.  It
makes sense to have dt_probe_discover() loop through the statements as you do
rather than loop through probes and try to match them to statements since we
know that the statements are used (as opposed to probes possibly not being of
interest to us).

You can still keep the logic that stores the dt_probe_id value af the start
of the processing and then uses that with the new value (if it changed) to
limit further work to just those probes.

So, once discover() has been called in all non-PID providers (and perhaps we
can even add a flag to providers to explicitly mark them as supporting new
probes - DT_PROVIDER_DISCOVER flag - that would reduce the overhead even more),
you can loop through all new probes, calling an add_probe() callback for each
probe to be enabled, etc...

What do you think?

On Thu, Oct 10, 2024 at 12:55:07AM -0400, Kris Van Hees wrote:
> On Wed, Oct 09, 2024 at 01:45:34AM -0400, eugene.loh@oracle.com wrote:

... skipped ...

> > +/*
> > + * Update the uprobe provider.
> > + */
> > +static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
> > +{
> > +	dt_probe_t	*prp;
> > +	dt_probe_t	*prp_next;
> > +	int		i, prid = dtp->dt_probe_id;
> > +	dt_pcb_t	pcb;
> > +	int		fd = dtp->dt_usdt_namesmap_fd;
> > +	char		probnam[DTRACE_PROVNAMELEN + DTRACE_MODNAMELEN + DTRACE_FUNCNAMELEN + DTRACE_NAMELEN];
> > +
> > +	/* Clear stale pids. */
> > +	purge_BPFmap(dtp);
> > +
> > +	/* Update dt_probes[] and dt_enablings. */
> > +	/*
> > +	 * pcb is only used inside of dt_pid_error() to get:
> > +	 *     pcb->pcb_region
> > +	 *     pcb->pcb_filetag
> > +	 *     pcb->pcb_fileptr
> > +	 * While pcb cannot be NULL, these other things apparently can be.
> > +	 */
> > +	memset(&pcb, 0, sizeof(dt_pcb_t));
> > +	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
> > +		dtrace_stmtdesc_t *stp;
> > +
> > +		stp = dtp->dt_stmts[i];
> > +		assert(stp != NULL);
> > +		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
> > +	}
> > +
> > +	/*
> > +	 * Add probe name elements for any new USDT probes.
> > +	 */
> > +	while (prid < dtp->dt_probe_id) {
> > +		const dtrace_probedesc_t *pdp = dtp->dt_probes[prid]->desc;
> > +
> > +		dt_probe_enable(dtp, dtp->dt_probes[prid]);
> > +
> > +		if (dtp->dt_probes[prid]->prov->impl == &dt_usdt) {
> > +			snprintf(probnam, DTRACE_PROVNAMELEN, "%s", pdp->prv);
> > +			snprintf(&probnam[DTRACE_PROVNAMELEN],
> > +					  DTRACE_MODNAMELEN, "%s", pdp->mod);
> > +			snprintf(&probnam[DTRACE_PROVNAMELEN +
> > +					  DTRACE_MODNAMELEN],
> > +					  DTRACE_FUNCNAMELEN, "%s", pdp->fun);
> > +			snprintf(&probnam[DTRACE_PROVNAMELEN +
> > +					  DTRACE_MODNAMELEN +
> > +					  DTRACE_FUNCNAMELEN],
> > +					  DTRACE_NAMELEN, "%s", pdp->prb);
> > +			if (dt_bpf_map_update(fd, &prid, probnam) == -1)
> > +				assert(0);   // FIXME do something here
> > +		}
> > +
> > +		prid++;
> > +	}
> > +
> > +	/* Review enablings. */
> > +	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
> > +		pid_t		pid;
> > +		list_probe_t	*pup;
> > +
> > +		prp_next = dt_list_next(prp);
> > +
> > +		/* Make sure it is an overlying USDT probe. */
> > +		if (prp->prov->impl != &dt_usdt)
> > +			continue;
> > +
> > +		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
> > +		/*
> > +		 * Nick writes:
> > +		 * This is a general problem with running compiler-adjacent things outside
> > +		 * compile time. I think we should adjust dt_pid_error() so that it works
> > +		 * with NULL pcb and dpr at once, probably by using the code path for
> > +		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
> > +		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
> > +		 * already handle this case.)
> > +		 */
> > +		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
> > +
> > +		if (!Pexists(pid)) {
> > +			/* Remove from enablings. */
> > +			dt_list_delete(&dtp->dt_enablings, prp);
> > +
> > +			/* Make it evident from the probe that it is not in enablings. */
> > +			((dt_list_t *)prp)->dl_prev = NULL;
> > +			((dt_list_t *)prp)->dl_next = NULL;
> > +
> > +			/* Free up its list of underlying probes. */
> > +			while ((pup = dt_list_next(prp->prv_data)) != NULL) {
> > +				dt_list_delete(prp->prv_data, pup);
> > +				dt_free(dtp, pup);
> > +			}
> > +			dt_free(dtp, prp->prv_data);
> > +			prp->prv_data = NULL;
> > +
> > +			continue;
> > +		}
> > +
> > +		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
> > +			dt_probe_t		*uprp = pup->probe;
> > +			long long		mask = 0, bit = 1;
> > +			usdt_prids_map_key_t	key;
> > +			usdt_prids_map_val_t	val, oval;
> > +			dt_uprobe_t		*upp = uprp->prv_data;
> > +
> > +			/*
> > +			 * For is-enabled probes, the bit mask does not matter.
> > +			 * It is possible that we have this underlying probe due to
> > +			 * an overlying pid-offset probe and that we will not know
> > +			 * until later, when some new pid is created, that we also
> > +			 * have an overlying USDT is-enabled probe, but missing this
> > +			 * optimization opportunity is okay.
> > +			 */
> > +			if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
> > +				int n;
> > +
> > +				for (n = 0; n < dtp->dt_stmt_nextid; n++) {
> > +					dtrace_stmtdesc_t *stp;
> > +
> > +					stp = dtp->dt_stmts[n];
> > +					assert(stp != NULL);
> > +
> > +					if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
> > +					    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
> > +					    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
> > +					    dt_gmatch(prp->desc->prb, stp->dtsd_ecbdesc->dted_probe.prb))
> > +						mask |= bit;
> > +
> > +					bit <<= 1;
> > +				}
> > +			}
> > +
> > +			key.pid = pid;
> > +			key.uprid = uprp->desc->id;
> > +
> > +			val.prid = prp->desc->id;
> > +			val.mask = mask;
> > +
> > +			/* linux/bpf.h says error is -1, but it could be -2 */
> > +			if (dt_bpf_map_lookup(dtp->dt_usdt_pridsmap_fd, &key, &oval) < 0) {
> > +				/*
> > +				 * Set the map entry.
> > +				 */
> > +				// FIXME Check return value, but how should errors be handled?
> > +				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
> > +			} else if (val.prid != oval.prid || val.mask != oval.mask) {
> > +				/*
> > +				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
> > +				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
> > +				 */
> > +			} else {
> > +				/*
> > +				 * Nothing to do, it already is in the map.
> > +				 */
> > +			}
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA0D1E048B
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 11:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733225787; cv=fail; b=DACFFva8n4YXJ3rlc7xfW0W7lUbdDkVYmtGE9WTMgFF59NgDQ6gDBTzoo6lIJmzrrOOf5QYBb2s4LCKdruti4N63wxnmyG3GMc8G2Kqtr5njMuEgAzvtzg81Zx5/nWMzZHLQqFwk5+kdJNaNTBhL24NekuU0wYjXl0gpB8JFAYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733225787; c=relaxed/simple;
	bh=6SsneY0dtBXyUx90GWSniWd+Ju5FnBgP3oNHnqGBZC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aQSoMVeGCD8lt7n92+jFJrauEb5eAWgaxLl5X8IkJonWLJuRpxJgjUiXq/e+CkWRozz5VICRW14AoSp0ensrK/XF0sqqQcdUI0JfhAM0ZADc9ANJWBi4TckHAdlg8W+L15g1diuyWn2LHYVW3ZrIfLFnHfDmNsg32ant3OZCcbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f19TYEbU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=L72Koa29; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f19TYEbU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="L72Koa29"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37XtbC009979
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=tsZdz1SdTBnugLORg1lCQJgZa0IUZNa7pVImQvhSUkE=; b=
	f19TYEbUnRXcK2dxf/wI2viZXgObx/5Z3uVZbFNj2wCQuRkd9H6FJHBJTXynlGxX
	gsPeeTPhWBMduVkP85Hnx8j5jrKymPae/S7iRUbCHqZGR3N4nJ4ol4ufb5QKEzJh
	Iuh68z0rSdk2+3JId/QdlYjFdtobrNOypWwNHWrkRdNM339USIOcal7h7i1C+vRA
	dDQwkluK1aIK9SX+uz3dDuNe/aPgjFQK+cPhzY7CjYhUL7qKxAAg9Q/xq1Jtrp+2
	u894DBRNTAbF0g0eMYdG4CpNSai0QeOxpoxL8aKkTRlBpM+q1eb2EmMAi/McAGKg
	mirlOOobQL+8SPfnqCtgXA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437trbnwts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:36:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3A0RFc000943
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:36:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s57vrsh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:36:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpldfIzIJ72VU8bv6xbJ0Br6+498xyzY9xQxaQ5WSsrwqRDbONkYEiDDyyxuCfgKzWb/TOdFhR+qwkw2/lCcu8T6EI3Z8867ngbs8UvI/nufKXpfj6Tff896Vbdrd7ZHjFNtcBFFgZI2g34s8EzVhrszqSup5HgOAJdCXueKGVnhuhlMzk6W8TM0NH9T7fphDC+TU4lsboaKtCH3Dpbc0GgAsL3skfbEVm8pbo+IgurHkI23AtfHVPFcnnC0rUWnm63Th7J2kACqdqUbsGzzn715Ma99BezF1pW5hzlHVxsXWLSufNqhZ/jkHZtzmfOe3ZP+TLqe4wCNeqjH8d8tpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsZdz1SdTBnugLORg1lCQJgZa0IUZNa7pVImQvhSUkE=;
 b=JAL9JYL/aHiYdQKtjuxpICfHtdpbXakJcq0jwJPuQLZolapUAh9o4fTX9P8+bQ85HMqiHoTW0jQkxEM5ssot+UHBFV9jM/2+GfceXEiPGgxc5vwtyBf+EeworJVlOpflu7GnxUILs/YoVZGag0S09I9zuGHbNZflfwj6ADN46MlJGFhDza/kpfhowoqD+3bGyTW78RRXYZurnq7cQa8Qu/HLht6qQEpQnD2e5Bmf0+EPs4EO0/Gp4ZrPKVTabqOpI91Bz81GjVJtc1mDJqueIx9L/PkqukMb4UVSisAMeOOKcVZCLFI+fOkhhUnm9EXzsoODcgPrLUpU+YtSd/Xjqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsZdz1SdTBnugLORg1lCQJgZa0IUZNa7pVImQvhSUkE=;
 b=L72Koa29gVifPh+t82XuANZB7jjqZtOyBbWmw8QyZ+MJ5fpBxNCrgVYM3CjEQi+GIrFHpz5AIJD0fDIyzBLQMeOH7mI6vBAg2br7s5J4sIZrQfSYW/nv3zTGPk1uvYVLLozOlVYKoRB0TvhoTXBzjdGs3LLsXQbohAn8HBfhywU=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by LV3PR10MB8177.namprd10.prod.outlook.com (2603:10b6:408:289::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 11:36:19 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 11:36:19 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH 2/5] proc: more self-grab improvements
Date: Tue,  3 Dec 2024 11:36:07 +0000
Message-ID: <20241203113610.75104-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
In-Reply-To: <20241203113610.75104-1-nick.alcock@oracle.com>
References: <20241203113610.75104-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::19) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|LV3PR10MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 4818688c-fdc0-4d24-9962-08dd138eb4b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vyq7i+3M0zeOJJU2czPhH7eGN8+NNNjbUOQ/fqP35VKQWQ4OLj4zgH3/7bMz?=
 =?us-ascii?Q?CThsugUUAedenzFXeMR0hwFeL67apiiThwjkTKziaTVIuO6/yw/VQqfclK6T?=
 =?us-ascii?Q?cXXGR70Vz0UpnZBME+HSn/jtxKz5+bAaqa2MtxF3ug0kf2Q/5yq3JzgalxPm?=
 =?us-ascii?Q?SdPODdtXqC8xT5t/Nt64yEoFSbkNHCGCzXVJlk9Q9ftUMkx4Km1vcnYVz+nG?=
 =?us-ascii?Q?kb1QvCZ89e9SgQGTKHewuMzhdZDtnCjmeGS1ABL+4GQNS+0NCDceEcUhnl8x?=
 =?us-ascii?Q?hoktmfgh0SSkZd5qjfE1MI1OZfbsHDJDJYHZkGR4Bd/kp/RPITBs4VYGGC2U?=
 =?us-ascii?Q?ovSeW/6ySD2v5OMVr8us6xDOn1mNDKtG1QuKDCUBSdGFTPweu9QOTjniwI8p?=
 =?us-ascii?Q?NPstv5i6mIja3Y2asncN0SsYDGT5L0zUyCO032rNgqWhbawbu8PsjMtBScXK?=
 =?us-ascii?Q?Y19gmhxdIleA+cFN+eGXI5JpmZLtUqlZIC3diJye63FisWUg8E1+CqR/SURp?=
 =?us-ascii?Q?VW+w+xht/54l5+OCbGPo8lIUGuCGrBSNxF1ghy6TnT0Aa3C7eXXDDG07rifB?=
 =?us-ascii?Q?Pxci//f5ehqD/7fFeaEYqOsKhP+IDH1oUdZhVsQF0Wsz29tNLv4cmPdTPL3i?=
 =?us-ascii?Q?7e1M9ecQBhSqKSBXp2LDyYWDa+/pNaGh05IqsG1TELy39Zm4ni0m4SV5vzsX?=
 =?us-ascii?Q?avArcVU4vaWt0dhO7zz61WjHvQLlfSm6PlL38yYD0J3Tiq+5q1FsoGrtRJTs?=
 =?us-ascii?Q?azuhrF5fzOGy/6Vv26yyUk2mVh5WxgQ4dnyBHUvlNpiFIkiGjgE8POys53sN?=
 =?us-ascii?Q?ohrss79c23WsRHKJjvMDizWl+idlg5WotjYyDHAoJqILN/4z/SunzItfnYu1?=
 =?us-ascii?Q?GRGyuTR47CUKXY1MwgwBsKkmhZYNs49QoPlOJ3J9JKnCTKpJzpr64NqodCUl?=
 =?us-ascii?Q?cXYD3M/LkTPbTUYh0qfS4GDMqGpGnTiER3/Xhx1QcNl69TVP/q1wAY+wVpsb?=
 =?us-ascii?Q?/TXka0LNsoIcOFyP/3wT/Er8oTWVk6Wp2H6bFI7HIdtxR5J9unu0lcGp/tsW?=
 =?us-ascii?Q?lO4wTsfjldxQzgc8KP/V9Ye9X6WRoR5p7V85s0Q9vfz+vfFZWbc+fQSnj1yg?=
 =?us-ascii?Q?CJuUeSTDS5D1YWzE5iJF/AEjf2gAtKuSyMmxyMN62NH18vXuMfn8mmGnmXdF?=
 =?us-ascii?Q?Jg+CoRD4u4DhUd2j0jsyHM7OvhbwVhsI8jKwN8FzPzkZL+uvbR3+aCxKmkbS?=
 =?us-ascii?Q?v3hWup8hMQ36jZRKcBcaXcVXb2/2iw4vjR9eOwqkvgZDPMsIo7zpKRKygmkU?=
 =?us-ascii?Q?LiSxzyoncUOOx5KU8MyEAQ8GNp/TxhipdzKcWZ76LEP91g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WpluXGdj5gCOwkvKqNdmxucK38fVCtP/tNFXlLG6UO/PaudYOQN05GrZSavu?=
 =?us-ascii?Q?vjVG9OFQJk4V3qLZjKhnL3dYRbEdO9z9GgzF6XuC+YWgdQBFn0ojVsAXNP1c?=
 =?us-ascii?Q?EK9z9733q8nm3j7dySApjz/xN1RKuTf9UngbrPljXn8X1yycmWre7NrzRPGY?=
 =?us-ascii?Q?AZTc/OM+AWP6726/vD7LztrTcMMLkQgUNZ6Fff0S4i/y5qUr6XvlmeTdcba3?=
 =?us-ascii?Q?3DN2oNksMJgtUJ+lOeVdR8Z91E7tbQndKEKv3Wr6m7LX0jnIO7jrRXy7JJG4?=
 =?us-ascii?Q?XEFoqdRrnDGQumwhlbymkFh6Do2WZtuVo/hgScQgRNhm3iv11+LXXFlpVn82?=
 =?us-ascii?Q?Ein2VNvqE2rM1qGv+XPospdiFjYqK2alXtwwQoM4pwKspBioIs1iO/9qPfm5?=
 =?us-ascii?Q?5V8TZsYrYh+UuqErL/3MwBZcNfg7iWcW5CzXbASW5yg5KcbW8tSZUZtrICWp?=
 =?us-ascii?Q?Wk1ALpDT8kLcDcriOpA6yER0kJcfBzor/fNR+Qb1MYe5C4sgU5TYX4qOlOCF?=
 =?us-ascii?Q?zIpiSQ5hrhL2KK6W80Mqf8AadXIod0zlPsvMW7T6+egCkoMQVI7lGyAUtRRF?=
 =?us-ascii?Q?BFuR1gG10b/RSax8hasG1uDTlHc5qOwcAQsfoCfL+XDwTKGsfl1cG3OmvIxG?=
 =?us-ascii?Q?FNMMxVnMMzfNPBGrsCHGMLuxx//QzV4KAqyRH1u2+y+wiuVWJqM/Ll0z0QbV?=
 =?us-ascii?Q?I16VUMv1QdOQFHdBddyKv72GO2ZuI4AdhouRpV7AbiDi/fc4cJ5Rt4YmIJxb?=
 =?us-ascii?Q?wuOEII0l2YmUfjvh31goi3hPxQ5EoDLCAKBnsJe0ufsfpxWQUrHlIRJHsKjS?=
 =?us-ascii?Q?6rs51UwMLravJUV5sZFYybz2AE77Dtx3JeVLMjoKhjv48XFJRTyM5BjXER1H?=
 =?us-ascii?Q?p8CcviLCYvlTOWW42TvdbRuNhMTavc2VGRbYAstKfn7SKt9FCrXMZUcfWQVy?=
 =?us-ascii?Q?Uj4S59Wsx8AMp2n3+PaaemXiIxFRFyxu2xp1pM4FsAlMXNL2aKKfjKHnq9Ek?=
 =?us-ascii?Q?LtkKtrvQrIuxgt0kbyTlHnuADFXAIESTgVRWIPmh634KRpPERLdYgCvb5hFT?=
 =?us-ascii?Q?cWTIbI6iiiZyWwtOqGYqSTYxof/TsBvXImqXc+MnW9nAoJdoHG+cWOIFFrK8?=
 =?us-ascii?Q?xuJciCRGTrUSkRGqbNdOE2PlMBb8Z5RHe+kuKL3YAEpOkPmdXjlcf9+7O7nP?=
 =?us-ascii?Q?H72BHe+fvuyWsShnvSbTtUeUej9s40Gost90l4TcP5D4mPpCsTdXD5eyEJ4R?=
 =?us-ascii?Q?oaQWgvQe2h9igiiKa8rDMaw1MaRNTSxd8TmQm6PAdEaq+Gxh7rIxbHy+FAOe?=
 =?us-ascii?Q?0U+BOvA5SytM2Wu9BjYQvIheew02BYiLcTl2vBKS0luSLQ6SvcHQLmCcLV+2?=
 =?us-ascii?Q?vpvimpQ4EGApAZ33Thjln24o1LbWjR1Ez5gbgf6zALxglMaglsPC/GODE7so?=
 =?us-ascii?Q?mG37srSoNzAexhPCtQJR5RnA9HHThvLQnv4YomgcdCWw8WW6LD7IM8jkNR5j?=
 =?us-ascii?Q?4Jv/wKylSd2lZIa6593Y4vp1lODoX4tWkjHJWSJAEbCvutOBGODC22ZYsen8?=
 =?us-ascii?Q?BCpaSWPRmL3urgV7T3Rk1Gc49W4MHMU9gUHRuiBs9TFN5cCJsNAMyu4epWlh?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ddGMgHdwBlecOdtxDiYCIACL5hlOKjTr9eyqFoKvi7wYaHK7L6MsD7uOiElLBNeZXYrjw98sMM6MR42CQsNu7m5HYZPImnGVaWHRKTytNhveq14TcZNdVAaMQiDKnBBBcVoW/X2dRswt7QjJ+YYo+1xIqft2H5uLtQBsjaHhXzPZvv4jJR/ymnqPB8sqZ05txEwILkC1kWkcuGfWCALHvFt0lC/VmB/vD55byE6+9NnV54rA4M6asLl7TYNRn3iC1mEohcNgmsfTBWDUTdxvkyCCcFrlbzpi0tZXwndA6Dp9vrnAtzvYse30ezMGGjtFCUxFznhj8oG04zho9Hc5RukA+Qr0jivOSE1180jk6gWQ8UEnM1izHHZscc3AHJrUBsswyVFyd6gwiqkc76JlTyWiEQJ5SrPFRb2gUuBKUC3/DlFkLRbtl8gXGlSAf9kulECoUQqV7rA5VKP7kYdqBsnNkNobFi0iJDEOcnijW10xABg+SLo7H6x3gDZtxWQL40N2+cTrS/9yViaIKV328EklUf1616laO0RJ6HXOMgYaSGrsFJ5HaBh4Qy3vxWReggpMf8TK78JcNi2GP+yJeqCcka9ppEKuPSef741x69k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4818688c-fdc0-4d24-9962-08dd138eb4b0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 11:36:19.6215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbO0Cvf2ug9tzr0rsE+IdAH8faFEk0ld6NL0lOstRans91ROXDsnyjMoJ/+zH6I3vwNDuTYMDzSZAX6NRwMqbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8177
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412030100
X-Proofpoint-GUID: xDEj-F-r_q_5UXuysnVBA6MIn98xfcva
X-Proofpoint-ORIG-GUID: xDEj-F-r_q_5UXuysnVBA6MIn98xfcva

The self-grab armouring code is clearly too hard to read: the change just
reverted broke it entirely and caused DTrace to never take out self-grabs on
anything (because it misinterpreted processes that were not being debugged
as processes that *were* being debugged: Ptracer_pid() returns zero if
no tracer is active).

Refactor it into something more readable via giving some of the conditions
names.  Doing this forces us to think things through properly.  Some things
can never work reliably and should always be blocked:

 - grabbing the thread doing the tracing
 - grabbing any other of this DTrace instance's threads, given the
   complexity of the proxy-call back-and-forth
 - grabbing a thread being debugged by someone else (a process cannot have
   two tracers at once)
 - grabbing PID 1 (init)

Some things are just a bit risky and are reasonable to do if the user
explicitly asks for it via dtrace -p, but not if it's implicitly requested
by some thread doing a ustack() or something:

 - grabbing a system daemon

Grabbing a thread we have already grabbed is probably impossible from this
location (process-control thread initialization), but if it does happen it's
fine: you can PTRACE_SEIZE the same thread from the same debugger more than
once, that's routine and normal operation for a debugger.

So split things up accordingly, and implement the "any other of DTrace's
threads" case, which was not implemented before: "we grabbed ourself"
i.e. the PID is ourself or the tgid of ourself and the tgid of the PID we're
grabbing are the same; and "someone else is debugging us", i.e.  there is a
tracer in force already and it's not the current thread.

This makes the code *ever* so much easier to read, and makes it possible to
give decent error messages when things go wrong as well.

(The lack of handling of the "any other of our threads" case explains the
tst.multitrace.sh failure: when a shortlived grab from a ustack() etc hits,
the initial grab and release request is issued by the main DTrace thread.
If a shortlived grab hits for the main thread itself, only this case will
prevent the tracer thread from stopping it and then trying to return to the
stopped thread, deadlocking forever.)

This has survived a thousand iterations of test/unittest/proc/tst.self-grab.sh
and test/unittest/usdt/tst.multitrace.sh with no failures (after the other
patches in this series are applied).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_proc.c | 45 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/libdtrace/dt_proc.c b/libdtrace/dt_proc.c
index a052abbacf204..41b148e807f84 100644
--- a/libdtrace/dt_proc.c
+++ b/libdtrace/dt_proc.c
@@ -929,6 +929,9 @@ dt_proc_control(void *arg)
 		dpr->dpr_pid = Pgetpid(dpr->dpr_proc);
 	} else {
 		int noninvasive = 0;
+		int self_grab = 0;
+		int other_tracer = 0;
+		pid_t tracer_pid;
 
 		/*
 		 * "Shortlived" means that the monitoring of this process is not
@@ -942,21 +945,49 @@ dt_proc_control(void *arg)
 		 * else (like another DTrace instance).  No death notification
 		 * is ever sent.
 		 *
-		 * Also, obviously enough, never drop breakpoints in ourself!
+		 * Also, obviously enough, never drop breakpoints in ourself:
+		 * we define that widely enough that no grabs of any thread of
+		 * this DTrace process will be invasive.
+		 *
+		 * If this is *not* a shortlived grab, simply refuse the grab
+		 * if this is being debugged by someone else or is ourself, or
+		 * is PID 1: on explicit request, we'll still grab system
+		 * daemons (if you use dtrace -p, we assume you actually want to
+		 * do what you asked for), but grabs that cannot succeed should
+		 * still be refused.
+		 *
+		 * (If the process is being *debugged* by ourself -- as in
+		 * literally this thread -- we can do invasive grabs just fine.)
 		 */
-		if (datap->dpcd_flags & DTRACE_PROC_SHORTLIVED) {
-			pid_t tracer_pid, tgid;
 
+		tracer_pid = Ptracer_pid(dpr->dpr_pid);
+		self_grab = (dpr->dpr_pid == getpid() ||
+			     Ptgid(dpr->dpr_pid) == (Ptgid(getpid())));
+		other_tracer = (tracer_pid != 0 && tracer_pid != getpid());
+
+		if (datap->dpcd_flags & DTRACE_PROC_SHORTLIVED) {
 			noninvasive = 1;
 			dpr->dpr_notifiable = 0;
-			tracer_pid = Ptracer_pid(dpr->dpr_pid);
-			tgid = Ptgid(dpr->dpr_pid);
 
 			if ((Psystem_daemon(dpr->dpr_pid, dtp->dt_useruid,
 				    dtp->dt_sysslice) > 0) ||
-			    (tracer_pid == getpid()) ||
-			    (tgid == getpid()))
+			     other_tracer || self_grab)
 				noninvasive = 2;
+		} else {
+			const char *reason;
+
+			if (dpr->dpr_pid == 1 || other_tracer || self_grab) {
+				if (dpr->dpr_pid == 1)
+					reason = "is init";
+				else if (other_tracer)
+					reason = "being traced by someone else";
+				else
+					reason = "PID is ourself";
+
+				dt_proc_error(dtp, dpr, "not safe to stop pid %li for grabbing: %s\n",
+					      (long)dpr->dpr_pid, reason);
+				pthread_exit(NULL);
+			}
 		}
 
 		if ((dpr->dpr_proc = Pgrab(dpr->dpr_pid, noninvasive, 0,
-- 
2.47.1.279.g84c5f4e78e


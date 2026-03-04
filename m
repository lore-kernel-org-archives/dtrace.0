Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F623822A4
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 20:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772655943; cv=fail; b=RcIEzB1rszVMq/Z6R+6LFi0AMNW8J6WLDS3ZuJY0ZG7TMT20jAr/SxAEwSbNaNiIAvwmDdEgumUFv08VWfjZd/RlZ0yyv9DFzQpcsq0eTDThH896kVyuxTcFjNJYCSD8RZZqkPE0ZGDtwTG/UQ32h4cCLg6Fl9/f0Z+2yoZYQDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772655943; c=relaxed/simple;
	bh=2rSZWtb2MknJQQec1QbCeTK+9PEn8UMWDKtEaSZfiuk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=CuH3N61VI5FMS0DIEczRjG5W47Hr+fqd6b5UHkqa9Ph7JVDTArR3rckFue/zk++xqnuDuMUwgugSDGaxjLvIjSBidfrR45z7qL1WnGpzD0Bxuca+rQcde4nETRomKQVgYa4FTOFPye2W0X8UhZXc63B1+ayjD4ZWuo2oYZTEjwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ef038s+m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EHqXuOsZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ef038s+m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EHqXuOsZ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624K2bxi2506090
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 20:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=guOLOXrN9aca37v3ZNzv9mlVLWoE/ZfcvdMFnz5pXnA=; b=
	Ef038s+mDQ3pzcUI2HWOqs3BVJICZZxn35UMYYoEbAQPocq2asRqpkKuHglRi3iO
	Uk9jw1IcSSp9Ur2WDGcpSrqjQNvjAhuYn7UchfOJlAGXrLG3Q/b4lczzjBDQNDk/
	c2/kZou1ruV/kqV0vea4dClk/zIqrHWyMhKi93lTtnTQTUXXVSIo5sdGiMmT1Epz
	qlnv8mGWvDr/1OJlYIekmZB4fYRMVbW9zZzJdzVPnfXQtvDqi0aLaYy1vCLL8/o1
	x/JHATHjmLsmXJmVo0MxF7Z341SPLL3InYwr0sDUaL6587duxlqA36tfeMmiz7k8
	kHwT3KX4oRYUNc9Tcv0Tyg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpue681ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 20:25:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 624KMcNo023465
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 20:25:38 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012004.outbound.protection.outlook.com [40.107.200.4])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptgk2j4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 20:25:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYODtFzhsBPQN2qAwomhiIuka9zXIRUFdP13+JDrgNelqyTgzw2Oyrx3S2C77ZH9Cg+M7R7l5o9YclV28kTBuiNRO2Wr+LMojdYLvuHRotVo9oHF5HOsV13Qijsi58qUqRYS51wvvoQ8O32LDcCzmihOJf6gWdG3IUENRX6x4NZl5asIALpdbr2HFsgrswdGP4BzeGmoeaWitq+/JLIhOdR9hcclNiGcEcCpQiR/xhupfKf/QrT1Wz0/rRfIYkdK5jk6mnz9BWuwXvQB6BbaTurqWrS2mZN8lLOUDUdmlLWN0gY7qVSK2BNz9A6Z2xzZHA5GGtZqwZiOXOEZ97XFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guOLOXrN9aca37v3ZNzv9mlVLWoE/ZfcvdMFnz5pXnA=;
 b=tygkOJ0flkQ3ZiVFbaF1NHKtCkgtfFyecnZbqYNVR6r9OZeY5Z5TCx0ae81NiP9kbgNSb39+Y7BrfcggFDtDx9sV21lcXRlU9bkmHHKxN57QDZxoKnKcUUhhTTQznckaCWakykSYSH1fU/uX3jR025ndRHk9c9hdVAtIsuR8Kpi8a8+oueOAMXJsF3v8ndcZ50jK0wEaYoCmkplpERjSCwEAvyz02IK2uhgygLnxXED1IV/Rhi2Yxzd912SyUm9Mn6CYuJLURTP1AEw+PYw/o/6iJcr++sC9m+bwiIe+QIndsrzZi3MEnaLSy0voStWSA4ExVMsuEHtSy2iKgyG50g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guOLOXrN9aca37v3ZNzv9mlVLWoE/ZfcvdMFnz5pXnA=;
 b=EHqXuOsZ28FLZdjS/3yaOXLv0Iy0wimdc0kfhB7tN1+9Lrt8w+IrnZUulzJmcZQzE8nLTnSNWrk+bpUpFTp3c75S64D2tyUWNzVkFMsUuO2oCcP4Jo6TFxbmMlOGW+Y0VQyie5RTqf3l4GYxhW+h+R5Hv4W1fisIpjUfezcF5a0=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by MN6PR10MB7518.namprd10.prod.outlook.com
 (2603:10b6:208:47c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 20:25:34 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%6]) with mapi id 15.20.9632.010; Wed, 4 Mar 2026
 20:25:34 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        Eugene Loh <eugene.loh@oracle.com>
Subject: Re: [DTrace-devel] [PATCH] sparc: remove architecture support
References: <DS0PR10MB752292F0685B382085838FB8C27CA@DS0PR10MB7522.namprd10.prod.outlook.com>
	<483a8ddf-bc12-d7e5-f7f4-24aff9fcd874@oracle.com>
Emacs: because Hell was full.
Date: Wed, 04 Mar 2026 20:25:32 +0000
In-Reply-To: <483a8ddf-bc12-d7e5-f7f4-24aff9fcd874@oracle.com> (Eugene Loh via
	DTrace-devel's message of "Wed, 4 Mar 2026 15:07:44 -0500")
Message-ID: <87a4wn735v.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::15) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|MN6PR10MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: cf243499-ddf2-44db-339d-08de7a2c308a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	bs+n1PzugR/f6V4pMSFKUMyWsKiLJ+cGz52bHOJTomxt6yue8ieODIFhBjBoSEJhoVbSLWSyXbtckUgxX3NkxEardNgnfrCnIvgq2no3kvkI1svR9LgjFdu7z5ecida6njryD7CMyOc6eGlhgMJV9jm8ovhzTDOnB31bgiR6GJHBxxM266yBvI2lBtTkHeQ7+hZImU84k+G9gtn8EN2R4TX1Z2rZgPTqkE2Lm9U1I3w6rt9bpUvLdKEqWBWmqX6YSSw8sslg7391MLkOYLYTEjK7ZtcW0/W4B4UahXcHgLFsNziXo0HNZ+QSI3m5ZJ1O1kD1s5jlVce58wtbAWtN6eZw7gGgrXk9StuNRUCuYfybe64YAJVwDbJcYi31Aagjk1ZQCakXY27KDcWeEIop67fDJlRoWAd4XmjPTROaGF9H3CNy3eYelCQ5TuawdwZFRiE1vCZKoZUw5d7ifuIARNP8ZX1n35+dQwmHBIhcOG3bphN1wIs3HqRKrYVHW/R/ARjrUYAtncMzYalErnKiHA6uXcJTsp5Dch9TJCh85FMHeUeNPj5NM3U3P/7acTWCfWRka/aBCqpxhO8ynaruMGwhFxHFO81ThcvgIUsAxzg9WevjQJjIXuIIkNC6YenyebBGZNpWg3vTpQQDGjNBCoEvcwxwadc6alVrfyuF6KSf+tP9D32BTK2QX9OFIOhve/50llH3PUHex8iiBAO3Z+gaYdphXjGw7UNIfDWwAm8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3RDTzBDNTR4ZmV1MmVXcXlXM2VxUkRsamFvZXRwaVZTTGhXcjhnUDB1NjdB?=
 =?utf-8?B?SmhvdW1mZTRyRlVuaW5pTldEbDZOd0hEYjV5dFcrTUdLaURkdm5zR21nUWxX?=
 =?utf-8?B?TnVPV2dCcjlMVmhzT2dSdUdGYUhvZVJNNWplSHg2TTNXY2JyaUNiZFlPcU0y?=
 =?utf-8?B?WnNtQmxSby82NlNYa0FuYUJPVGdPV1pnVmpzSEYrZHRPV2pjUFNtUGVTMjMy?=
 =?utf-8?B?eldBUEMyT2ViU1dIWjVKWC9DVXUvNkhLQWxIMjhqNWFkLy8xeGpwMDhqdGJX?=
 =?utf-8?B?TW55MmNzdmovRzV4a2FoUjZMLzZWNHRxVXJQRU5mTXkxRXBMWjluWVNNTjZG?=
 =?utf-8?B?V25tcVRpSktMenZESE9RUCt1NVBoQ2FoQytISHluUlNRMEpZSG83NkhkUThB?=
 =?utf-8?B?cUVqd242c1JONDB1bWVPQWF5c21MZGhwWlF6YzVmcGx0MWpJZ21kbXQ4VFNU?=
 =?utf-8?B?b1M1c0R0SDgyRU03dGc5bUtIclVoTUVtRU05Zk9qM3B5RjcrNWdnaVlqOUZU?=
 =?utf-8?B?MDdKc1dSYWpqcDEwZ2gxOWhoeFRnVHg1eWRzcnAzMVI0bDhYaHRjWnFMNVd5?=
 =?utf-8?B?c2EwZTJLMmw5dkY3WERQYVRIdVhLRVYyVWZtOFFQbmpNNCtiOHZHRjI4UmVz?=
 =?utf-8?B?VnBsSGFEbWJXb0w3azcvbHRBNGdVSVVRNTJUTlhYeEF5eVBmVFBJUmc3R3Nm?=
 =?utf-8?B?TzdmQjBPeWVkM2o2emlGNVVnV2Y4QnJ3Y3EvZ2pVb1NlRzFHOUx5N051K0Qz?=
 =?utf-8?B?OGpOOExBcVlGZkRReWJOaHpDUTFPc2RFc1dPWWMvenRsMXVEYkNRQ21KeWh5?=
 =?utf-8?B?TGw4c3BPR0hIRm43djdDekYwR2JBKzZyUmxhRy9iTTlrNkFXYk0rc0Z5eGZQ?=
 =?utf-8?B?dGlsMVpFQkpVblBSWGdOaW9sUWwzbXVnSEVrL1RxUWtaSW1qTklza05rdUMv?=
 =?utf-8?B?LzNuTWJOemh5Uk9BMGtPb0Q1T3U3OXNTazFiblpaRjg4M2tRaVBteitOaXVE?=
 =?utf-8?B?MktDN3hoR1NNNk1LY2R1ZUErcVFMRGh0d0tGc3VENUJBS1owa0x3N0hvT291?=
 =?utf-8?B?REtpNkVuN1JvbkxuK2dVTWV3VFB4R2ZJL2lvaG5jNHVLSDJ2b3R6VkU3T1hx?=
 =?utf-8?B?OC9pVUphdm0xSlBNeUNWanZVT3piRnp4ejVpNDAvTHp1TkZNVDdGbi84TkU0?=
 =?utf-8?B?R21FZG1MS0ZpTXZCNk9sYkZ5bkhKT3JYcmEvZXpaVFR2b2Y2dGJadWtvYTZw?=
 =?utf-8?B?bEhydDRGcjBKNmVHWVN4UW9uQ1NnNHE3Q1g0U2VIVmhxMzlaeW52TGRQaHBp?=
 =?utf-8?B?eWg3MnhQSlFPeEo5bmNtR1U0eEl1M2RDRTNnU1ExQkV1eFJvYU5FaURaSlg3?=
 =?utf-8?B?ajhnYnJycC8wWHRwZG9iUTVWeDB0Y1MyRWVpTmd3eGg4dnE0a1E0VUUrMERJ?=
 =?utf-8?B?TXh0dnY0RHJ1OVpLUzlBbGtPSjRuSDhwYlZxN2dIbzJ3dTg0bTIvdno3VTlU?=
 =?utf-8?B?cWs4ZXdnQVY2T05DeC91ZElwRnhXQmdmM3ppaUpNcWtHV1VNallsSWpEcndy?=
 =?utf-8?B?bXhqSlZibmFrMU1GMGJuSVlRckY2dTZ5aFZxTEtzOGJSVVVxUjBUbEVOaVdz?=
 =?utf-8?B?STBOeVJmT2xvZEUvcDdvQnZpWUNzSVpZSkZPWFRoZGx3VFVwN0tGSE14R1ZK?=
 =?utf-8?B?bmx2dmowK0ppRmhadVJlemluTVU2bFBZVytFZXJRRElJaDFDQktkMnUyMWtI?=
 =?utf-8?B?NzE3OFlXbkJhY3ZYZWZPaXpmbXVRelpteHdFZnZoQlNZdEQvSHNLbEJKRm5i?=
 =?utf-8?B?dU1MMFRwUE82V1VXcXZWK1R6NzNXSURySk5POTNPRXpGZE5jSlZiOGRvaDRo?=
 =?utf-8?B?UVlOVWR2ckwzTFdaNlJPMytKUVovSTJpYjdhZWhNenJmak5KZXpabk4zTWV2?=
 =?utf-8?B?R0Jkd282Yk95b3pYZTJMQVBxQUxlOURWRy9uSFNiQjZJU2xabHZaVVhyUkpV?=
 =?utf-8?B?WXp4OENSN2RsU1Y0VStSQmV4TTBSbTJIcGtTTlZYZWYrNjBiWmpBbDQ1MGN5?=
 =?utf-8?B?Q1MxU0RUVU55TlJudm1sQ1NNRnlRalJaRTNCN0t4ZGNrMU8xaTFXYm9MVHVL?=
 =?utf-8?B?a2JkbmVCaFB4UkxMQXpQaUhhTzRWa2tnRHhuNGlqVHNpeEZzVGNTSFZsaGVQ?=
 =?utf-8?B?dGNSbEVxMDBRMThTK2xOeXdPejRZWUt1SHhaeGdpKzVtcXlzOElTU0ZLWTlo?=
 =?utf-8?B?SXc2bVJENUprZkN5cmswTzVSSVhuUTNCVjdObllJTFhvdkwxTGl2T0VyOEM0?=
 =?utf-8?B?Y0dNUW9aMlNBOEY3b3ZOSFEydjdZaVBYWmJhd2lkb2tBSXlBMC9JQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WReHacSI02ewaKQeQwcwg8y34WCqEwHU2LRhgZ6hdb7wZTIYY4/Rvo+01xSMYpYuoxWFQqZHssuAdP8F6g2Gz1/sbUZniDN7f8lzmaOqjsXd0MxcPc+JXHenipt0dtqhyyX+pbsXwkF/bp0XrSHgzsPji25jdjdLNg4jJyTeTfJ80keBEsuuS4JqZcwcmbsqvbyTk9E2RNXu2nmjDjs5GuQ1PbwLlYqcKyNRXXjDT63wpXIbiIUDKZCIsGN626B7btT5BgFMLg1EsnSnNjKooQoM4ac6LEsWT1J9nlXclZerTlrw9kNamXcuxbBSeEIJnx2VSyR4pxpyRfHR0Db9CE5xs5YlpOZ4X4WeyclnA1qz4qPDj8CTWkGLkCPGPtz/ChaUuIAwi55BSsrxqdYHA6zSqrWwDvjGEANoXMBEd+ugvuhfTdew7a1fdqS8yQa3FSYcb1NPw8wcLXIwFFcHyeVkVIePiErjSkiihQtoe2JIW4SEbEk/3N5zDbHWQDeyWUsr9s8hmYzSdUSqn3rG+bZn/kE5yCrixRMzmyrZZLsRnca3waXH4Xot/bEZ5p2hgM9wH5zUaUhpuYSxJ2hUPjqCPeVDNXZ2hhu/XsHibSE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf243499-ddf2-44db-339d-08de7a2c308a
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:25:34.6487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQvi0WPBVqYzqYQVlupfFog7ySrU0ujq1aAy8AgemMO5EEGGPxy1Dgq24D2O5oXmr9FH+VANO++JNzFheD29DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7518
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603040167
X-Authority-Analysis: v=2.4 cv=HOnO14tv c=1 sm=1 tr=0 ts=69a89543 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=rrsPpfckmizYww0l13AA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12267
X-Proofpoint-GUID: EEX5E_oPa-ZRquc03FN27hRP3TtcvfwJ
X-Proofpoint-ORIG-GUID: EEX5E_oPa-ZRquc03FN27hRP3TtcvfwJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE2NyBTYWx0ZWRfX5N5jxoojLccc
 8Qzb/dgNOPnKDIATtZ5INkF4IAaLAZ9whQ/KY0oqie25/vR5Nqw3VL81uzPlnMFUZKCJcUALnJk
 H3UsEKrTrvBDaoAuCY2L0M5El5Hhe3HP3A+cSV/aQxsE01X72ViREJxVDOxkJdZavh8k2i2cM/J
 m6dz5i/C/GNgNnKMlTqhz2nzHeQIo5v7mioXUb6Q/+xn/nTRMulyZTGur0WLUyMHCOd6k+BfBZ/
 AEUGYUMo28Na2ngpp9kh803+JrOdtJSySI/qimRku1o3MN8uwKrohGfnnxmJqJbPsJqsCvitXnx
 HhUQvjVIWcQeIFfpqyk7WfaxfsWkam9uOXMUVvfuj/DFOaRXlWWIgalP6yv4sVVXlHlrQ5N3xie
 0Adb35SQ29SftVBoPkdhM6mowMQCddGy+/TLn8dZK9XHK9C0Nciry9tXqfhaT9ohG6F/i1br2ag
 AHe2zMNmUWHp7hCH2O6FfGIZ4Ax0FN+LrLse0c/w=

I'm leaving most of this patch to Eugene, but...

On 4 Mar 2026, Eugene Loh via DTrace-devel spake thusly:

>> index 23454d63..6a0e0122 100644
>> --- a/libdtrace/procfs.d.in
>> +++ b/libdtrace/procfs.d.in
>> @@ -286,8 +286,7 @@ define_for_kernel([[on_cpu]], [[(m4_kver(5,16,0), m4=
_dnl
>>     [[((struct thread_info *)T->stack)->cpu]]), m4_dnl
>>   (m4_kver(4,9,0), m4_dnl
>>     [[if_arch([[x86]],[[T->cpu]])]] m4_dnl
>> -  [[if_arch([[arm64]],[[T->cpu]])]] m4_dnl
>> -  [[if_arch([[sparc]],[[((struct thread_info *)T->stack)->cpu]])]])]], =
m4_dnl
>> +  [[if_arch([[arm64]],[[T->cpu]])]]l)]], m4_dnl
>>   [[((struct thread_info *)T->stack)->cpu]])m4_dnl
>>   	pr_onpro =3D on_cpu;
>>   };
>
> I can't read M4, but maybe that diff is suspicious?=C2=A0 This is what gp=
t 5.2 says:

*counts painfully*

I think this is fine, modulo the stray 'l' (correctly pointed out by GPT
5.2). The apparently unbalanced closing )]] is closing the "(m4_kver"
and opening "[[if_arch(..." from a few lines earlier: the removed sparc
line above it had the same trailers.

> ### ASSISTANT
> No =C2=97 as shown, that diff does **not** make sense, and the brackets/p=
arentheses are very likely **not balanced** anymore (and

Wrong.

> ### What looks wrong
>
> 1. **Stray `l` and unmatched delimiters**
> =C2=A0=C2=A0 ```
> =C2=A0=C2=A0 [[if_arch([[arm64]],[[T->cpu]])]]l)]], m4_dnl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^
> =C2=A0=C2=A0 ```
> =C2=A0=C2=A0 That `l)` sequence is almost certainly accidental. It also s=
trongly suggests you now have an extra `)` and/or `]` compared to
> what was intended.

Wrong.

> 2. **You removed the `sparc` branch and spliced the =C2=93default=C2=94 e=
xpression oddly**
> =C2=A0=C2=A0 Originally you had:
> =C2=A0=C2=A0 ```
> =C2=A0=C2=A0 ... [[if_arch([[arm64]],[[T->cpu]])]] m4_dnl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [[if_arch([[sparc]],[[((struct threa=
d_info *)T->stack)->cpu]])]])]], m4_dnl
> =C2=A0=C2=A0 ```
> =C2=A0=C2=A0 That last line clearly closes a number of nested `[[ ... ]]`=
 / `(...)` constructs.
>
> =C2=A0=C2=A0 In the new version, you have:
> =C2=A0=C2=A0 ```
> =C2=A0=C2=A0 [[if_arch([[arm64]],[[T->cpu]])]]l)]], m4_dnl
> =C2=A0=C2=A0 [[((struct thread_info *)T->stack)->cpu]])m4_dnl
> =C2=A0=C2=A0 ```
> =C2=A0=C2=A0 The =C2=93default=C2=94 `[[((struct thread_info *)T->stack)-=
>cpu]]` expression now appears outside of the previous nesting, and the
> closers that used to be on the `sparc` line are now partially (and incorr=
ectly) attached to the `arm64` line.

Well, yes, you do have to close the same number of closers in total, not
just the same number that were opened on *that line* :)

> 3. **`m4_dnl` placement**
> =C2=A0=C2=A0 `m4_dnl` comments out the rest of the line. Moving delimiter=
s to a new line while also changing where `m4_dnl` lands can easily
> break balanced delimiters, because closers might end up being =C2=93comme=
nted away=C2=94 or no longer part of the intended argument.

Err... the patch didn't do that.

> ### Practical conclusion
> - **Brackets are almost certainly unbalanced** after this edit.

Wrong :)

--=20
NULL && (void)

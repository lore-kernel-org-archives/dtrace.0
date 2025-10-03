Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEBB13635C
	for <dtrace@lists.linux.dev>; Fri,  3 Oct 2025 03:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759463794; cv=fail; b=BTaQ5Rv/MsnQXCwjJrI5umaISPeCTaJOE1FmzbcMC5lPts5Fxv+Xy4Aogy/CnGlUytiKlbZYv8U4A2PtPNI9HhFkSmeyjEoK2/kWFwEqa4KfrkvSnYdYeiXBhcjS0N1lNWhvY2V3Ie1h66Rh1VQbOPJN5PT0G99UXZEwZcCrs14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759463794; c=relaxed/simple;
	bh=ee0laEJ6YBigMv7XkwHUn4XOtjeyZ0GZ/pMRyTp2WY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ww3XlbB8ow+ASWzkrkuI9TYeYzyhqYKPsxcUgnRE1mClfzZ8D456IvjQPcPgE5K5WVT36VcdsrV5300CCHA5MRRLEl01SyxXYRNH+bBxlxTWTTFbvO8lyVCLu9C616Bulye+dCS4nj2BTRdvLCLiQHykag23FWRFQwH48PtnTGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i9cGc9Oy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zNSAQt0U; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i9cGc9Oy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zNSAQt0U"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592J23RM025456
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 03:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=8wn6EnmcXQ/EFS0CAd
	rD0q9f+XC0hhUZ7oSsOmd2PIo=; b=i9cGc9OyIodeICsHHdVFJBduK5WUx0ZjTR
	ez3Fa6I1EAVksYx3Eq/KXJFIWgfvglLaGhQKbbwihXuMBF7A4nB9fgKhd0Y3QR1Q
	QSL6fRm29H5NVVinxHzd9078M3++WDSlygDJi5+mPdAHKIBqJsbxvBct8zyITLHA
	5x7bVGE8BqWmjbVHUAKqu7dTIukT0JU9Q3nIkuo4yu6BlU96AWBz4W8C9yU2RgM3
	MXBRmbmQuZ//8lHfZ1F318mDhaC8M2cEVRLa1xWXNh3W87KoTP3iTzqeWW2HGF2c
	foMHp+6FkjeF+dH9Dzv4D7wav89P9ETjHEt2c+rWHu7OlOL0m8Eg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmcq4gfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 03:56:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592NkmK9008916
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 03:56:30 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49hw1xhvf1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 03:56:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCY2d48VNCdmtCMqPVNwXOF79Mcu9dm5fFSGMlBJ+VFGgDdcdM1qN2jnoO+2q+wZMWLb5EFTOvhTbgeh+xAESkvP806M7L9HMYjNicwA0sOJoWfE9pqhApZPU+VfIK/CszYz1cR/hv3RWiNaPUdIKVnXU4VA/U/HLY4vEhKIdTm68uyGgxAkXl3Fgx5H6n3Vdz1dmu0qHCLyJQWh7TrMpZdP6LwCU/TvU4dybf9j5HVxNIG0pKoCeDu44toLrYIH5YrXbu8ywkeouj1Xzss6NdriwGZ1rGKoCdb+9nrzQ7sOAwBF+3gZbZl3plf7vyNGqie+BezgeU4RYqzKhamLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wn6EnmcXQ/EFS0CAdrD0q9f+XC0hhUZ7oSsOmd2PIo=;
 b=MIlbjPIaxQ3T9XeevqVmn0t5JK0kFwt0dkpbEXpmRU44TQHgwWtNf83C3E4MGqt7stKKvj6QInF0b57cGCB2vadXwJtu8la2O8AcXX4jbyWg0hymvSco1OW8j4ZkvzODb8PHii7a0JfQXtttIlrbG4VC0+2E2fT7LUiVFwdn3wAIWgoG774NkDmQWsuTiXKVuaXJLAkLe2QbgA26AhkRZ//4PDGD+WxmI7Pa3Ti5td0kMR+pjKVFPxxCteXjs/PqNdOszyVeY1ZoXcWnitEtGlNRCVLS7XMfthHfcbgo1/OpmWYexYjI1rMBR9YbGlaZ9oFl/7lysytmhSdimpHrxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wn6EnmcXQ/EFS0CAdrD0q9f+XC0hhUZ7oSsOmd2PIo=;
 b=zNSAQt0UadvP9EROEupJoIg/jWILyJLNezfsLZDWWKz1pa9Kv3VRCooH2JbHesdGiOaSxDd/TzTGDkgEL39dpK8+9mYTcx1ExgMv+dsSWLierBfud1SA4+d2Vi0Yq5cLxmBS13QskHwgUgk8VSs3h4UrrguRUKJrOYLlKrKWRlw=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB6848.namprd10.prod.outlook.com (2603:10b6:8:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 03:56:24 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 03:56:24 +0000
Date: Thu, 2 Oct 2025 23:56:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/5] test: Fix antiquated reference to
 dtrace_ustackdepth_max
Message-ID: <aN9JZSJBJW6OR7pT@oracle.com>
References: <20251001062418.6902-1-eugene.loh@oracle.com>
 <20251001062418.6902-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001062418.6902-4-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: c20cca67-7784-47c9-a86c-08de0230d252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JGH5M3Yqb6vsetB7NOe0r2KuoaB+pfyUmMzouLaKjPXXThi6/CAeTTP8fQF0?=
 =?us-ascii?Q?qv+1zm2GxAYZ00c7Stfdwwj7KBIlxkNTcXWow1nuSsKxIo9qFjhTMua160XG?=
 =?us-ascii?Q?fSQQRYMc8yFFaLgOfz6PS53eXczqiXkb8Osb9vQbLRo1yw29CArvywxMQbr3?=
 =?us-ascii?Q?OIDkHy0tcVWqBaZTcO0mL0Ynq82EXnbZCOsMObbbf40dixsSI2LLdKmcdDea?=
 =?us-ascii?Q?u1gzkZU29+1fSIJ7SeheRZrdfbAtgzB+87I7pMmBGSeKnrbroVUnQVHZXlIp?=
 =?us-ascii?Q?u9HPG5m2Qfq0GXyaKmJpEM1TuQJ+GW8lGbuqqBT9rR9OxK5LM5rfR8QSfMUE?=
 =?us-ascii?Q?57ppcJ1HrDvlrt+bBFHHdl+U9AUDwHN4VcKyHC6o5S893rZEXZo724P4q9mm?=
 =?us-ascii?Q?s7BA50e3ccaVChlfyDO4k1M7vr6TCzhm0661UtXJBnZPdVH4z/B6PzuMsRAQ?=
 =?us-ascii?Q?OHYTorTE+VoBXSlT3pvnT2Bn+VzSVbIEDDYzCj3wO0369iNQpIsUF5zn95VU?=
 =?us-ascii?Q?RMKWgeZIhOVm/wz1BzJFIzFLqhDVJIZKOfkk/WXUIWiasHeZiQQJNjcoP2CU?=
 =?us-ascii?Q?DJjQrwqk20XLfMmVWUFinKhmO5QMH6wJx4qHe8hRiMuxkaHZccXTi0LpTjZb?=
 =?us-ascii?Q?dRdNkM5nqFCkIUSiCAu3VPoSgeeIt4dUQDzgyhLKPr1cPPZMQqgvDl4bduE/?=
 =?us-ascii?Q?cQcRI+dT4F7hEm0DAHhcnWh1sEatvgrtooIbBFEwc6B8sN8l/SESx1MV79ef?=
 =?us-ascii?Q?SQZchjW2pOr75U2wZ09F5t56L8Qcg9BelYC3HquOiNx8U0O9dLEOwjK+eqbw?=
 =?us-ascii?Q?ieo+av+oNdDK011lJQ8S9LkzplS2zyHSz+YMSi1EqdyR6oaAIwrJDEpDaNjq?=
 =?us-ascii?Q?Mi59Wlad0kOGtDF7HXEoiwIItWGUcTCeZee0MrjoyAO1TCdgyNQqv6lSMDPa?=
 =?us-ascii?Q?dxsTzw9bZWnj8kYTwXTtlQ/zHLjZmCFpiPDQ9K1q9xdCEBPOCbkqYhEUhgj/?=
 =?us-ascii?Q?xT9Y/RoYt5zOJ8bhekJcUXcofYVOXa6rRuV9RZJt4ZI3lRtcpWnCF2qB8w1+?=
 =?us-ascii?Q?2Z0OSZnuCoqTnULDL84+pb7dfcr7sn2eWqUAWvz8t0KjdOoxSZTcryPnvXko?=
 =?us-ascii?Q?Sm1e/skHMUFUW7qc8nvYTTCSXw1PP04QLQwCzpH3r+QgS4H6f/G6hSZ7eZWl?=
 =?us-ascii?Q?e50Yxv+e+HoErGEvmlROcjoWro0A298DR2qku4yq+mTzlgflxti4OUMpH8at?=
 =?us-ascii?Q?2vgP5MGVOwV1ieCr2ieTxdCE3zG41TQrP4HPocQ8fk68MYjz1b3tGRMuCKs/?=
 =?us-ascii?Q?+2OgXso4RK3JbyFcxnkdFce/lraHxXMJM5eINnfMt1CDjZFGIsBAIxU8ttU3?=
 =?us-ascii?Q?Hr8M5fUUQkZtY0NUC/pnNJiduXJkJuTKKhmhZNCnN13mT0MfZb8mGINA8Ay7?=
 =?us-ascii?Q?avMMyFeONT6uEt2FLsaTl+lCpyu+ZTx4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H4o7U12b9wuh5XAXYGEQlstpmDhJJOEPBCaVZe2j9Usvj3rosamBApAfO0S1?=
 =?us-ascii?Q?Z1cYzLU/k143U0YOPc3lMDaT9b0bu5yggfJYbH3xzU721Kq+kN8gPwnvw5Fw?=
 =?us-ascii?Q?VDFA7/orWubec56V3WIWaZYKwVY43Gfp5rsruY/eNHzaoF7X4vSlW6sG9q9O?=
 =?us-ascii?Q?ZXjKqoW5foSBDROP9HNMdd9CwZnduWA2ADjJUa9agoOtM/sWz++j/Wzc7Jll?=
 =?us-ascii?Q?KFnFCK83nU1TRTFk2bjq4J6iDcLlG5ODsrZbBnSck5GnW7Ascjlyw8UNy+UK?=
 =?us-ascii?Q?TOkLot1ufJKVyArUE0pRYqFRosJM29GDQA6b0QTwOyJG9WMHnKX0wI08hTTS?=
 =?us-ascii?Q?pmktVz/UQ5aBpx3Gq93VDTAkQuYrbPWaVydqCAcjBTXJ2lemSHhKNbeNoSb7?=
 =?us-ascii?Q?1daIlavYuM0ZXP3m0JmEWqcJydynsbu8haHAExMYuUg0JCISk68A02q9sHCI?=
 =?us-ascii?Q?qEvNT3dclEtouN/Xs7lKhtySfl5CzCQdk7VbvWotaLMLKM7GCwuOsFAYu50i?=
 =?us-ascii?Q?vvXVzcfFrSqvUZBfuP5089RzyBseOdjceUKVrVUZLU1WkWNO2U3Rsys7jnNx?=
 =?us-ascii?Q?bTZ+5+Iy/CnkPUYYHRAg/3gbnmqnl800/L7/pHclIGgoGQtkRqjpiyCdekFT?=
 =?us-ascii?Q?J9oXNbnzjyzkukaBdtZyqc9RaoNkn6kYrtlnwUGSS/CIzG+qjesgBMSBJycb?=
 =?us-ascii?Q?MIDeh+f0P5eoa9rB/Gp5weHQbj6XmN92m+es2Gd62U5ZI8NUQMfeByVUkbE5?=
 =?us-ascii?Q?637zxLNnS96hPEDtWI/08LWYayisJyJevTtXFbcFhB8EvLgqru9vt0x1zW6C?=
 =?us-ascii?Q?ysFGOVyFCxf5OndAKezEVa8vcylsqIYhizxXTah375WZdlphjnQWYgjHecxI?=
 =?us-ascii?Q?H2j5hm+noYiWmCOlPyK1zRSREwArotAk+FFFL6+DzeXp714eXAk9yDCjPa+o?=
 =?us-ascii?Q?mkXCwIsmsEcm2mPq6+ehq3NWdN+RU6KzkgoF5LdMc0kLn7HjQ/OtjJDFW3ry?=
 =?us-ascii?Q?O50fWeGzEaj+l7FRK+w5jAETlBOEL3MkAZWf+cwc7av8qdx50KT1S4kCgd/k?=
 =?us-ascii?Q?kBmy/5/L55ZPNsVWKgANVN7svq91seo52IDMGdQzkhfpIcPNHJ0rc2ltgIEm?=
 =?us-ascii?Q?gE4/DKxkK6afB/YflTaluYX/KFkf04Co0ISjhk+A96zubk4OiPr+oG3J2eBl?=
 =?us-ascii?Q?UNY9DYLiyfpca+FPHTjlfJjSnCOqgezQvB/mRiSrerFE3Mc1gFWS41ASQi88?=
 =?us-ascii?Q?dnFTrqLD9ygKx0cEyugDJO7Us7M+R1tJEYpktHFJre1YD1GS4Y9DGim1RJZv?=
 =?us-ascii?Q?aS4BwpsAE8S/vjENnJ+S8luDA7a8rh4GcH59/BhKZ4hzvN3AoMGXEJlp5Hf2?=
 =?us-ascii?Q?8I1W1fnHS5g5HpL+3jR2KpnKEZzxrMkL2lPw6u3+vGisrdFLDcs3pM+bylol?=
 =?us-ascii?Q?g7QtBOGLUkqzFhfAeTy7YDU8nAwt920UJlVTHLbQnLD7qFs4e4JoNcrmBMq4?=
 =?us-ascii?Q?bhhDrUcSSti5aryhtRQWsKuzxlzLkQw/AlOvEcTaOnc/ORLhLGvwZuuGyGCn?=
 =?us-ascii?Q?i44Hh3ZmMQ0OyL53pSTcuaL4EUrWXEl7zmXaxXsQTtnjE9p6yaJk7KtnicSQ?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5ArV1Rkk6hrR+S5Iq3MRPAPDJZo9HQbkY97pkuVNns5bRdNtLYxQNV8omjDyNlldKRK3XVkErz8MajV4OX7AJHDvGmSPT7j534yEUy8/AlravNlmaweK0S5JCJs1/OjZ+sboXOW8z0W3IztptBNCLdsPVBxvp/HPDrScJ6y3IZAMAVvvWfXxDEkWjZYIKgV0Bq425q981anZqJBWwLw5fam4F563YYRsOLWhsD2dkmofZLjzHsRVHxSEEKxUQ4FYEn4sxEmnZO1EJUN39th82H14lNdJJvMRmnHI7Y+ElWENCL9Dheel82klH6s8yx8x2bK6Iy+Tgba513jDv3fmf7DbT5ut+XBxrNUEdvSBwKTp+wCkAIPVqJ/gGfaRzRzDSgVOKEp0zbhOIIUZJfvuGOGgLQ61stEYVDKQ2zLmPq8pyCh4tzJJrWv9TjJNmsZckgDbX5mt7B3/cH604lpKd1fZetTdBxygoL87kzXri07sEztWx1d1y3vbPV+q7b+bW4z6tzzQmFFQ9AnWvN+a9b2jqV6BcM6sFzNWYJejk7qETqltolAB9hJ5Q09WR1b7KoJucPS57oKJvFZsOnz6eo3+KKMG2PSnRDJvKTbhKv0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c20cca67-7784-47c9-a86c-08de0230d252
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 03:56:24.5120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pgg4mbmjXcrpuAYYJmFbRAe7AyUDN0ZnRnPj2dNxHA4xvP/+ILXbB7Y2cQZR9V21Gtg3bLj8cPrKxjCSjiMVftzm22Dz2kLviU9SB9oE+J8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6848
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510030028
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NiBTYWx0ZWRfX4IRymVVAAcEJ
 eRbsF1U4xk2PeVdrsOOi1y+2wZNKGu/NgwOaTDHFHpjSUT7CZNkPovG8RcfEomaCE6BapoCMSpp
 /KkU/ZG6SmeqAAo9hkBxcuTRmPavHkrIsEOArJthXTCNK+9MsBebDo7tb1rPvi+aCDwFxsm+mK3
 zuoCQTNDzPK0/stvKmr6QvY/BVga1i0nUM5Sy4Np9EwtolGfbymjp7mUeveqWuAtFv8yAOqxWrp
 19tcGgww+tf4whDBAkBoP57L6D9R/Yf3drNlcwtWBTp315DdDYK6EidvBkNv4kRA6sLgP+TJBNZ
 9azbCx/Afeg2qUlY4gUnQLrK2fcl+Yr7wHtQxokhaSXscabTsRqHqlavWFPrjwaI16UtquOebeZ
 B9ZcCPUCELcYp/5DUiSA5BmfPv/cbQ==
X-Proofpoint-ORIG-GUID: GnwwQzGmStrW-5blZEdeWmlC04TJigt0
X-Authority-Analysis: v=2.4 cv=c7amgB9l c=1 sm=1 tr=0 ts=68df496f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=fMduBnAYpq0n5ya2W5AA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: GnwwQzGmStrW-5blZEdeWmlC04TJigt0

On Wed, Oct 01, 2025 at 02:24:17AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/triggers/ustack-tst-bigstack.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/test/triggers/ustack-tst-bigstack.c b/test/triggers/ustack-tst-bigstack.c
> index e694a518c..267b07e74 100644
> --- a/test/triggers/ustack-tst-bigstack.c
> +++ b/test/triggers/ustack-tst-bigstack.c
> @@ -10,6 +10,10 @@
>  #include <unistd.h>
>  #include <sys/ioctl.h>
>  
> +/*
> + * Create a ridiculously large stack - enough to push us over
> + * the default setting of 'kernel.perf_event_max_stack' (127).
> + */
>  int limit = 4096;
>  
>  int grow1(int);
> @@ -23,14 +27,6 @@ shouldGrow(int frame)
>  int
>  grow(int frame)
>  {
> -	/*
> -	 * Create a ridiculously large stack - enough to push us over
> -	 * the default setting of 'dtrace_ustackdepth_max' (2048).
> -	 *
> -	 * This loop used to repeatedly call getpid(), but on Linux the result
> -	 * of that call gets cached, so that repeated calls actually do not
> -	 * trigger a system call anymore.  We use ioctl() instead.
> -	 */
>  	if (shouldGrow(frame))
>  		frame = grow1(frame++);
>  
> -- 
> 2.47.3
> 

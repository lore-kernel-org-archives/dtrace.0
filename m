Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43912F363F
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752664125; cv=fail; b=fGuDDoqtOxb0oQqjcyyUl7LNg5vmRK0g7AhkyJ7juovZpIU6QK1i1rPrqGDeHwLS1ro9f7ljclxJS2+naLdksIFjfTBNjfUGOztpyYVq2m50LMGW9L3Vvy8CBNxQdBRuZwK4nxTnqJHri7E8HDFOdwrS93awejJoqaR4O4chFrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752664125; c=relaxed/simple;
	bh=FvhbxSxTEjgyRBCGw1KlQONWlLlObNT2rwgW18Z+/f0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=F/lOIPB01ITeH+CUMnRcaKtyJTuXK0ghYcHjh2TGePMD0faIrg38WiqHlmSLup/HtqFB1h6GW3gWSbEUPNAAlaV59U8HniXb1UXWea0uAD1GO05EwI0/Lih5fKnryN1F25pXggV52gsI0NJw2wn7YoMHC/0OLUyct3XbYSGlOlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HPlYiLVG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SdQ2AhzK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HPlYiLVG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SdQ2AhzK"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G7fmD2014762
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 11:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=zvvj90K7uTQsewElTs
	4VhRX1JpANu0AAE9ub0lh+sE4=; b=HPlYiLVGvTtl7gtRWDnIyuQ5LamIVNb72j
	X6ZXXnjkW51xOd1lJndhDMYwFRLkC07vbxq124yIMlDRcvWCai73KVib5F7lRcr2
	CpMcmdnSrllNtblOdDy56MD85IDNYuMem8m+RfOIjOUfCoaySoDqYtyOvOwnlrm/
	BmaD7JcMGuET40g6u/OLV7hYgB1X1y1341KZ1jgjpz/t0h7UEFFHYIRt6fTc305q
	gUNwLVcsXRfTLsZOfF3HqYfj3wpIByFvLomTgrtXDnG2fUUBVvckHKq8RNmRE+QY
	tKqlHnXLhh4LbMVpye/arHmFJI4qzlZmp88ZOysVbvZ4mkSJuUgQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk1b0pjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 11:08:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56G9AZT7024098
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 11:08:41 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5b6rs0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 11:08:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8PSOC63W1u9RiAppXYO8Ctm1DpwP4o+QEQVMl/y1k1Dp3Jh2q5YQcEA6hizLBPP/MmLedfreMx93SF0okxVp4/XLWUyLip7VNql8SXxwLUD1PJbE+7li7e//LVfBzWyz1SK+Jf0TotGl72yI4fvlDjEvrvq1EfSn57a65BmS0+S18TGUycjOrJpaN2FIUuZaG+67Us6mQsifmEHhBhxjXxvKg7Yw/jAyrYYr2wENaILWA7AlNsYHOog4631r/v1DuwjzMTj7g1mSMJQJeA+nM9bwzuaMlrvrYfFAp7XYlwCwi2YeAEqz67Dx2Q+9NOsXzIAK/JdQbvZog2OK4F5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvvj90K7uTQsewElTs4VhRX1JpANu0AAE9ub0lh+sE4=;
 b=QycY4yzZpAY0BP0j9959UT51izXXmLsQbekQfnddm379CTyydX4kpITwbvaLZMwNymKSYPNrdMZieXEI8zbrNBL76HWUQUIEexBYgZitK0hGfq2ZA69EWQeZ8/WhBTlkmjql+XIABv5Qp3UvEfygEoemgc1g/OYKNQuSNeQY0vBbbRZoBRXmZUYqS4iPzMstevle24HELltnB2BY4uOAlqPLfYiRuONBujkB/740uvXU9xtiGZTQwl5jKAjlGWYX8ECZl/VSNF7HKvsg9o1PDkF19+o/iZ+GJGZZXERPhBjQGdE3x9QhjTE9qH4DPS+i0ubQfq8JqzLxtA487FSbwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvvj90K7uTQsewElTs4VhRX1JpANu0AAE9ub0lh+sE4=;
 b=SdQ2AhzKDMciT1NXXvp1gBpV9sIRsylV499cucMF+wwBhE7SA8a48N9+7BDy2sYeTxaqDTcqym6lRpd5mTIQkrzSNYpHK2/G97Vhdt2XKMrG8UV4N/CC7fyDgaW+e7Qc69vShP2aEw/wLhTKrio0c8pJuvFKK9YkIR1dne1Lw0Y=
Received: from BN0PR10MB5029.namprd10.prod.outlook.com (2603:10b6:408:115::16)
 by PH8PR10MB6456.namprd10.prod.outlook.com (2603:10b6:510:22c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 11:08:29 +0000
Received: from BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f]) by BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 11:08:28 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace-devel@oss.oracle.com, <dtrace@lists.linux.dev>
Subject: Re: [DTrace-devel] [PATCH 4/4] rawfbt: selectively allow return()
 in clauses
References: <SJ0PR10MB5672917714933FF0262E814DC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	<874ivdwwwi.fsf@esperi.org.uk> <aHZ8cuwbgbqEXGmd@oracle.com>
Emacs: the definitive fritterware.
Date: Wed, 16 Jul 2025 12:08:26 +0100
In-Reply-To: <aHZ8cuwbgbqEXGmd@oracle.com> (Kris Van Hees's message of "Tue,
	15 Jul 2025 12:06:10 -0400")
Message-ID: <87tt3cpf4l.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0339.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::15) To BN0PR10MB5029.namprd10.prod.outlook.com
 (2603:10b6:408:115::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5029:EE_|PH8PR10MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: e207443b-72e6-4adc-179d-08ddc459174f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KrAICAnVTCHTcuSRm6FZud8Zy39bGfRPmRrbqWAcVLW7SYNbvM//YQbnAsVi?=
 =?us-ascii?Q?rQ7c1c+8Bc1ldnEo7ZVFeTfbFgzaYoxVGaa1n5/azqt7kB6lMNXr1g0c1v7/?=
 =?us-ascii?Q?A5kqOjZTAGWYx/UZq44er8XQ+SJRgHi7bNMk4ptFExhR5oq6KFai4ZIPzctw?=
 =?us-ascii?Q?ZRWhAJe6MyuLdL6TNAZ0xOBWlUAGC0pyvHgZa+AL3muS812Pex7ByhSQRacc?=
 =?us-ascii?Q?dqKnkeQulYPq06FGmbQkGdbxDwSdXetOknbtx6VuCefs0sLzSpIwSuVrBXZq?=
 =?us-ascii?Q?2IOogp00MoYRMdVf01WgmXFuTpzWzDLtbVQBD8l8C6yM60r9oPV1Fkum+/6h?=
 =?us-ascii?Q?LHmVdqB46HA2ulcElByqlDqHSa8+k8j+f6cRA8QnZFKfNyMPJEk+JsjjRwHP?=
 =?us-ascii?Q?R2jJCy2RRH+Vc0BTxBZKB00zp5hL46Cq6soQvCIi1Vo/Ho8onmwI1MJCpoG9?=
 =?us-ascii?Q?xf9E5GdnXpxtIwefBiz/BLISFn0nARxoOMiENM4d+yB5esNYCD5W0YEyQEZc?=
 =?us-ascii?Q?7LicGjv+xzgfoWt/XGO66f+08HgZbaZi7L24lLYRe3REVWI6a6nyKH9Pq7ij?=
 =?us-ascii?Q?c2obtmxPbpesMOh3SOLRXmr1cgNnbWR31vh720M6hhUPvuimOaBGTmHgE28a?=
 =?us-ascii?Q?M73LppwAlDzTxeE71wZm7nwgxjWGYhzEeyID8mgGGj9qIczXgzNmx2YodL/u?=
 =?us-ascii?Q?GhsfYyL84sylb9mI9h1esaTHyTabgUY05thDf7eMfRF6K3nWg6qdYRXyWMxt?=
 =?us-ascii?Q?Q096H0HYGHmGy817r39CNbpdzG1hnd9oslVLRPOXbddQeM3JMlgE4WzxcTyw?=
 =?us-ascii?Q?StJ3qP/ObM+tYuH/oBjZn5bYUU+oHz8GXtDFxaSQudIRZ2DkJD9muCpW8r3U?=
 =?us-ascii?Q?6FbrHu3A2mWEiDz0078cfDxwiXj2qxY/0c4G3MVQ3LVQGvWKoapoSW4BLmav?=
 =?us-ascii?Q?/675TLUOho3vjy49Ls4x2+s3G3rdDGrUqStfpyueaL/JwRlGTAvtXMAMe0kU?=
 =?us-ascii?Q?hTP194bc+HmQno/1ZEQS6iVU6k4BRplbZiWWPiL4S6s9Pwy9/9dNET/6b9Pm?=
 =?us-ascii?Q?I/64ZbqL5Chtl8qSbPlO6VNXYoGjt/5h9T6y+x6ZC5w/tU/HkB4njEuuCqEQ?=
 =?us-ascii?Q?cid7dAEJqxDCdQjzaakb3t4gucvCbbNJ7guuB/5R4pED/jiF90PNif3YyeBU?=
 =?us-ascii?Q?O8jgN0oGdiMUWBukaYHJzYB3YWNJoEicYVqm/XaGgohwllNLmc7hzgGEnhlY?=
 =?us-ascii?Q?TvLFU4TnkIXl3rVelbubOpEfImgkTJGGKohjJv6wLnLRSluk1apGI07N3Hs3?=
 =?us-ascii?Q?d5VbfwnUBXQuesOlwZLPmk5G3Ivq2fw4f2jX0VUVGegkiZgzj5Eq1v1NXmLM?=
 =?us-ascii?Q?E/bH2XIZpZ/07HHgabUgevgRgDifQEUbsxVWC9UQA1C3pxLzmgBPn2bhOwDM?=
 =?us-ascii?Q?PWY/jwHgkgc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5029.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YDiEnJgOG+FLSJbanu2v9TEK5r8tcEU+cTPInm5w6hww0E1+lZut/Ya1htjw?=
 =?us-ascii?Q?+tIXK9kY2YwFku/OXt8Oc2/TtEOYDFRblGecneY2EHzvZ/R7nt4MFS4WDLh6?=
 =?us-ascii?Q?CgJGJwa1ozJdQ1/QsmAy8frKV1p3m2LCHkQ+GanwxijPS1KGm6kI5KNhEf7c?=
 =?us-ascii?Q?lOdUSG0OSUBaLfCnQJa239OghcICW6gEk9F1ZdHokmMopyQdqKH31IGUYzRy?=
 =?us-ascii?Q?hedUd9qCKW1ipZcYl30oabDGYKIDahcvUfBWLBOMwZnC/twAwTETxS+LkPhS?=
 =?us-ascii?Q?XoEL5EwvKO/lhKfJkoqsllwkfaQER/KKwNXhHFmv/4cxpULyHVnSI8rDk653?=
 =?us-ascii?Q?OoX9LL9ZHPTKEJdMztSPi9w31N/nctvQ8u4SODecv2X4eSQgSI/APYlaARsv?=
 =?us-ascii?Q?bIhxwuIFOMJnFj1ZpisgguTZBBivcFE2/hC/9KDt4jCgKJqZLfoAOH5toDD9?=
 =?us-ascii?Q?bgk8WqiMWJS2XforptxW8jsjVOEwA3S8K58NedQ8GqfC1ixMtBOEEhot4c1y?=
 =?us-ascii?Q?SMOs7WHst6XpfuwTtgGULZSf6lYYAY6cGpy4nAxfM/JeRuap8VCTLFUtfS4R?=
 =?us-ascii?Q?j1veTRau1zCZuwBACLU3oFM2JC9aLHTPfWk+YC+0dCuJ6k1RE5UkVibV2+QG?=
 =?us-ascii?Q?3CQ8iATRQ6ASiPBaKxr+cdQ9apP/WQ1Xwj//9Az4PHeaJValLKxeXI0zJO8Z?=
 =?us-ascii?Q?KCpp8oQeXemQnfDLs/+Qm7IudMuHM/AKbg92i4NGzH1VJSsj1RTkcn4jpW0R?=
 =?us-ascii?Q?M19Bp3N9Z75NheuHD60YdYkWvP/jHhCM6ZgcQ4Xd+l/yVnsevJFsp2sIi0MU?=
 =?us-ascii?Q?pJUW32Ck8hldeeMpL6Dw3EYchvXl1JI1DbS5PnAEvbCvDztwp9bYz1xetEZj?=
 =?us-ascii?Q?ZyhH5zQE6+Tz0nVTFp++swjJf3ZVXB/j0qg3fYiacoKEQdp1ws5w0Ek6oX2N?=
 =?us-ascii?Q?lt56cUZH6PWx4K7OIL63v99EyIimMtPaB2X30NvgoFpggmNj5wxtyqE/4bCW?=
 =?us-ascii?Q?GT+9f8agsLhjZJAACmNQORVUZckMmfmhmahlqwbg4PxFQllqX/M8TuFxCa5x?=
 =?us-ascii?Q?V0T/WL/pMW2k/adn6h0hCZyNHQlK3KhtgXARU9hHsCcNShYaejLKPZouhjoN?=
 =?us-ascii?Q?GhbVtusM2M4kcyyAJy5tNY8LJqWULm7TPD9mn+F3BXBUcEXdsR2PPQmlYgxt?=
 =?us-ascii?Q?myySN5uS64TZRQdzTCf/dG6EVrsqv6pssAmf+6tqWNleGWLV08MFtYx8GvYs?=
 =?us-ascii?Q?V/jxJEfDXQdGjQAzLRmelYNy1q4YtIK6Um9zeMhEAFbS/FU813bYeULs0C6L?=
 =?us-ascii?Q?E/ajp86DW0YwHWBrGixeB+S5TbD9+UHwX0/xCgwcMu/o/F/Nqzyfyxbs4iLD?=
 =?us-ascii?Q?okoHDgOr5eIPjVb09uqUOKE8yjeQSSdwr4UMwGmchENiZWsBd4Pk2JEXdCKk?=
 =?us-ascii?Q?bOdNjXeSyy1K1O2cZzsIqLFS98Ddd8qk9wbylOnyheVsO5HvOb76iVFbPlyG?=
 =?us-ascii?Q?Dwgl44+z4X19DNW6G+qCRTQWEk/w349xET3wZZI5csq1TFMyDQfJbc0A4iOa?=
 =?us-ascii?Q?ddKdrzS9rEjlEjVoG0EZyMiXebvEiYGNjb0mcqWEYfjSNx5QmbDn/uApdJlq?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ohT8vdVUaH2sCKUbLG1G7SsjsAuL58jROAAsJPNOzNEv7rka1biaSW1JPRzFCySIRMa73sMZJJsw1lnE+dyTtKt4yMQs2lndhFh6o8XX5G6UQuu6nUfJu9TeCRRr4WGxuzGeIGhfz+NpMWIsgGKro50ssj/FQ0SEXR3EpAwKCfImyjUvy8Cdri0grE196DpGcjcUrXQ1BsfxxVgiFBEpew8UiULBlu9V2zIdD6FeUpgJUjPC7pElSqyLFuk5ZpBoHXkodAsf8VZeAks95a1sRgnL+NP08CPQQE5pWdQoUjOBPfPhT/gzpzhCUVe+KunYRP851BRoOIEpgr6IUah6+ynJePxABDT4LpngvOSi6L+N5ttdkehGxhPjK8BQe7/ODymtwmJ5ydRCvCByq/LfQXNvaCx0Dy1QOLslSmVXR4RcT03YZQF8ckPQkmhlA5/zEZoc1HwEE2tD/kKbRbSg979Wn9IKnwUd+e9J6BEeE/706d1+bc6hRzn/V/jEHeMZsoxPt7RcweoNFAWwit83wqx3fnYe674iOMxmLmVcCxJ+NboAaKX22/IGHk4pgjxVfmtsjSXrwAAEowUBpdHxtGbV8huset6zpzS4AqdbLck=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e207443b-72e6-4adc-179d-08ddc459174f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5029.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 11:08:28.1256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5OsckTwmEokbIFIun8xP9nYc9UCGJ7na2HtKoBhqJ0JELtzuJ8fTphWKUWqklT4r2t79EhhL/VETL7qNqwpbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6456
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160100
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEwMCBTYWx0ZWRfX13HUjTF9dSqE 2qVHCLIf6AUWrwIq5jd1IhBqoKNpAvxq6IuaE49rxMLfS7I/6zohVfmBG7WaXPHXpPMaEf6JALj IzoKsnTsS93mAvtm4G4JIdQcyaCqIHeJOZugHoyt/qtqrPCaTGDtulUSyh1cAtobc6AKVcfBLEY
 g5NelQ+yaWBITrzFnxCpH0K+1ARbUFjB9Ti+RUJ5SIIWV7bGeKkXnHKfTFkHMzteloGdIcIhRom K560aLokR7OA5iKVnvaH56DeustdsK0H/4msQCHQuf7I31jU5i78bcOM07rYSiCL62g8VJ70KfY 9JWQVT4fBmB/Wqok8QzgLY2TA66qb8WRiJUDgFmni/xPJ7qA+lDqmyjOwIBgj0bhZBn78nkpNQ0
 NbCsWOXC4s3wzWvvq/p+pX8WwMM2TwsjrG4OXsrQQLThmU5Vf6YT3V1X3zPrKgjJCCsl6qPZ
X-Proofpoint-GUID: ghpfgT8xeqtSQuIEqnfnXXNYdwaMXLWX
X-Proofpoint-ORIG-GUID: ghpfgT8xeqtSQuIEqnfnXXNYdwaMXLWX
X-Authority-Analysis: v=2.4 cv=J8mq7BnS c=1 sm=1 tr=0 ts=6877883a b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=KkoVQA9j1fc2uerU-T4A:9

On 15 Jul 2025, Kris Van Hees uttered the following:

> On Tue, Jul 15, 2025 at 11:50:21AM +0100, Nick Alcock wrote:
>> On 15 Jul 2025, Kris Van Hees via DTrace-devel verbalised:
>> > +static int
>> > +fun_cmp(const allowed_fun_t *p, const allowed_fun_t *q) {
>> > +	int	rc;
>> > +
>> > +	if (p->mod != NULL) {
>> > +		if (q->mod == NULL)
>> > +			return 1;
>> > +		else {
>> > +			rc = strcmp(p->mod, q->mod);
>> > +			if (rc != 0)
>> > +				return rc;
>> > +		}
>> > +	} else if (q->mod != NULL)
>> > +		return -1;
>> 
>> Ugh, that's quite tangled for how little it does :( can't think of a
>> nicer approach though.
>
> I am hoping that perhaps in time a lot more functions may allow this, plus if
> someone is going to make use of this feature for error injection they are
> likely to use it for multiple functions and then being able to use a hashtable
> rather than scanning the list multiple times is nicer.

It's not the hashtable I was whining about, just the comparison
function. The hashtable absolutely makes sense.

-- 
NULL && (void)

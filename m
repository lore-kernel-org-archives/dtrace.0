Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DB41D2796
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150302; cv=fail; b=lFtNSJcO8x5Rrib7A5m72JiDpIj7r+vhefpnUxMuDgaP4Ws1Gv+QWlVTN2BQ0pI5FfXeJsu2ZsNqF1z8KJg2PNluznBhWSgXPirItP3X35eIdMbnuIVsHp0r9e1w16qgIq8xMrZ5Pm6fzeQ1RR4vOJwBz0c1TA9yc8k0A/PSH/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150302; c=relaxed/simple;
	bh=CZTCGfxmJw5UUB09l4SvtDt6Nf2ytAHAWumFeVCq6pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q50VWPipbT5ErfhmVQEFqcTqpHGVUOZQZMW20dZ2C/GteYeocN+Nk5WBiZb+UnJCAsN565FlVjIAU/JgfW/UYUfizuT61LUtTg+Nq0oK/JAos0UycA5rc+e3NsX+Bo1VcSzQvyucq0be1nX2mzZuopAx2GF7kKNCXRfjecD0Fys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n6LcSXgG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U0IqveS7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n6LcSXgG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U0IqveS7"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtdwG021065;
	Mon, 28 Oct 2024 21:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=WV24OHtq+RAtkZ8Mv8Ch/xUs6hbAz92KObIyIZuPIgE=; b=
	n6LcSXgGWTNCTk7BYKfeM2L9qDpz9VKfGYi18boM4cr+hIaSKLT6OashKFXlHyHK
	kLAJ68l6Bk7SEaIuP8O1PVBr83HaCOAEWeFNMa9GvZZHjPLW2kyd0p5SvVv2oVJm
	BebcZCrhc3WD4QslaUeya+0WsanViRPHtOqhDGtp2uKMmHkYg7xWFlvrdbDGFX4u
	dLHQR9u1C7/6onwU0uj6MlRexmh02QMD0drAq2QJnR7Fp0HJUy4hI+PZTWrtazMb
	2ueaVah2Ka5oEl6pkZB/uIcymBk+Gu+R1HpHDW+DxpZ4lAVbyiJR25d2EE+NuVPn
	veEnVAiM+sUDTfdYUFF+Cw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp3yx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKxqTF011865;
	Mon, 28 Oct 2024 21:18:17 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnabe7ak-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmDyD7S8P3E/FaNTjz4bMgy76nhOTf8+PzaMqNr9xB8D+9B0rmspxxE5de6zOJJDO2BkecG6CDxw8WPrvS0/t64uLyl3ilCxmlXFzv2W1YUlqhsaplKsk4rI2hlpteDFMyz/DLF/kjYQXuSjnTrW9zlsAoKWmbRdPwE8piW+jywdQD9UWAL8CBO1k2p8F1KnFki7q5uapCW28UKWkszEdbD3CQ/9+wktKnOC08cnLlKDuqSDFjwAjFZPUaD8Ubfhqvm/9Pdua801n/cBYKQWyJawrg73F0418ILN43wRLosThDDHXwRUom1CljSuAKo2HZqmwiOIErWi2YHvvzZSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WV24OHtq+RAtkZ8Mv8Ch/xUs6hbAz92KObIyIZuPIgE=;
 b=BL/8QsTyTwuq+kQDsC+3+EjJvFS9h+KaLMjUg5M5ruQrJZUokcsZso7Sj+HNlr6EmB6XaIi0AC36t+ugV6q9RXC3+C9atEKYH+RVDygdm0CjBC2mrVBtsugpi+HrgAPJWZPEC4S1DoSxLBhqbTE4pZpA2YVfYRwrrCdImsSUl/MZN2xVIiDR37mqc1O9PaUY4lG9M5ADLSE7qZm72OripElBrDGfVotv1bmmwe0ZiAavQw1oTawekg8taBC0A4aKHP38vTt1/zY2tCOVmpCQBw9ulH7+PjQ60oue+ZuVpFfQrMc3Xulod+0RjL3E7Ybq8lYKP2e3FZDZNBYrP9f3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WV24OHtq+RAtkZ8Mv8Ch/xUs6hbAz92KObIyIZuPIgE=;
 b=U0IqveS7W7ScSwtnGtOkLWFWqJEUZIbRVPR7zrbx2mS509AsCLWB4Mz5JDbQ7RSzh5/Jwt0ffdHwIBJIExYL6iJFNCnbBqfrDtuWcg+wyLcff5DmkzwlvDNraFsHqXDTMJoA4uxnTdho8u9DOL/saGIbZShQ0eZdeFsGJgzoTEA=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:14 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:14 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org, Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 04/14] build: substitute LIBDIR in pkg-config files
Date: Mon, 28 Oct 2024 21:17:53 +0000
Message-ID: <20241028211803.458685-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::6) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: c074f661-8fdd-4064-3998-08dcf79608e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HdbhoZuJmwb7DwKnKs5DSoebHdFkdcaNEVqu+CCwBDj+prDVVfPcVqpol+do?=
 =?us-ascii?Q?FeS8lsmH3FaDfgIG9GxKxlMuoF/NQOE66YjgWTpFCXZAq7aOMZg0elTxzRci?=
 =?us-ascii?Q?B0r+F49C7AbBgHY/F1bFX4GQl3TEYxcgQU24M27FkaQcu7J8d4QSB/WZRYOk?=
 =?us-ascii?Q?TgXpRxaNhkWxsYXgZQBJQIM9f0LS8uyCbBhhBeWry8aCErPeYAvdTc03M0R4?=
 =?us-ascii?Q?whXbY0x1e2VtoEsqDNMcT8d4hkMWF7TJjwY43SvOMXxlerYh1EN/Fbmp1jZx?=
 =?us-ascii?Q?JKM0+GA/K4fxZQbVkOJh0zMfmap3WGSq2eU7k2H3YSMBHNh1JejwBR7cGyna?=
 =?us-ascii?Q?14x4jXxL6Ht+sbYMsNa8ygFAAZeejiHx0+HEkkeP0CMuzX9mMPmdzzLjGwFY?=
 =?us-ascii?Q?LWkZJYxiGLtVgEyM1VF2UNS/S2TNHVmd7EbofG6+6DkVIBFNkoNPeoVog8oA?=
 =?us-ascii?Q?qugDbg9NAEwM+pt0h6xuhMzCICUKVpVcmWoUpcO/OS/UuDcgdt/UcVWxOJZB?=
 =?us-ascii?Q?r4wigJ81/gcTW2BFVFdnNWIrfy+OoHh05N+Z2BoFEgjrl4ANvrOjMPdj/8G8?=
 =?us-ascii?Q?8CC5p1wVWsjsGmEYXpy2qi3q+dI/eejt5n3B9wPUFszVK+Dsnz53wQI0dS4n?=
 =?us-ascii?Q?PfYQ700HykH9QYqEJRTA8RRMmr0a2VsEqlEvcFJQ3gWo1qvPHpYJnHp7CdjI?=
 =?us-ascii?Q?CzhVPD+KDILUOveL/9d2ME+7lvWxzKxV4VmZcbkSAff9AlR16fTR//XN7IKK?=
 =?us-ascii?Q?VAm6mB8AwZNv8o4cOYFN5zxW+sI/iCCQAyN9NWre1+947rbJEU3s7qPIfjKT?=
 =?us-ascii?Q?V1OIQGt3jctD8dlKKNfmYtgQQHsoeuTDjNKJQAYPidUzFeRNExZQXIOJCjNj?=
 =?us-ascii?Q?hEiK7pK30f2T4m58gGSqUWfG+IRNMCYK+AjWcPOihb3XcyKPzFr/ORd6vgcZ?=
 =?us-ascii?Q?Z+mLUjdRjOfwiYjsXxbCMOajo1gDGsbesflUfVU58KlCK6e4+YLmmhNeg30h?=
 =?us-ascii?Q?CIXFMBCS48/Uzh+mEXYLGJToKsTeruh8ZXmrLeYZcfvaOVVoADBpZZO5ORLq?=
 =?us-ascii?Q?9n5LbwvJO58BDr6FUDA/EAuGNZfBMBIYNR3hVXCzRAlbWy/+4vKzvCc3mGE4?=
 =?us-ascii?Q?ORHGrgV6dQLlUlJslrAP2U6LqF9oAl1JgRihnIdMQOX2Zm2Soq7sbn6nSHdC?=
 =?us-ascii?Q?DtcT8AJiNwCPlu8P0zAgv5+LQVIOfdU1b3ZSQ+WdnOgyHfbaOeS4xObeyx6N?=
 =?us-ascii?Q?qpLN6dolG3SgSeKZPZyh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dJbGo8koekpdleQzTkfyyiWWI38kG+6frkTW+2xBY+hHZQOblOShRG8ztoO0?=
 =?us-ascii?Q?H+LuHCYTR2+UCbzXNq+d1+46vja4pt4U4A274OVH23mCprylpa5yxgEATNo9?=
 =?us-ascii?Q?Na63L08qpbLrCXOnbGa5colbMx7/KkVNxfSIZm5GTfVmPRcOGFlnDLsR5j5s?=
 =?us-ascii?Q?iv5cZ4eSyl2L1dLMXXyrG9XNujGT25rUC+jJn42qZLf0s+HIlXEg6zcweFdx?=
 =?us-ascii?Q?PGaH86zj3fqMpuojbUcrYt2XdVkdPzANjvoPgxQAr7thxcDfd7wD6fP40RPK?=
 =?us-ascii?Q?QBnXUt3+Czr6TOkcAY3eZMHvdcF31JyZ9kZVzG7Z7GwjdXKU4EdhAR3InW93?=
 =?us-ascii?Q?3QQlPqiNKu6ksX8WbYYhgrVk2a5fQjq09BqkmueF/td4pjIAEGfH6IBCIz3t?=
 =?us-ascii?Q?0hHPsZxRCXNc3JiBs6fOvdnvFKQPke5QsxMKHuHspsguh6sFhpx9aDaEQe4/?=
 =?us-ascii?Q?nKm7rZ2Ata2VzjBKjxZo0WLQT/QCY8xVIUeTv0u2MLduIYYmVN7IRpNF2zU7?=
 =?us-ascii?Q?t+1f4X2h93XP+LqGgpkGvqZZ6JGGbwTs3vIVqkb+U8BTlz7aUrLHG9XleRJN?=
 =?us-ascii?Q?kp2CDvJFNsY+8mNuGVw77TTVVzq8XbpsP0rJ6wXPR8j+wHWjWhuU0J4rAUAk?=
 =?us-ascii?Q?1Yey4WnM6Fr01YnduW83ARKMsVcxVM3SkX/5BV1UOEW3jH/9UKQhFFiBfzXg?=
 =?us-ascii?Q?2TUqjR0Gxeg+oq13RBcFswY9YHpQebmJB4AaCIWFLnW1TvUdC5GlNUu7AvzB?=
 =?us-ascii?Q?dlgSwq5IzbQw4bJChanBNj/8kVadPIUdN0reQ+rwdo2ilMzKoQxa5b8vy8F6?=
 =?us-ascii?Q?H3YbVqZBn1/Q5Fz+TxDfijWy9z5k+9VgqMF1NlM4T4MrApip1HWgRgEm1vRD?=
 =?us-ascii?Q?c9JYstjv+vbHvAllMJ/A1O5IgYvtzFjO0aimtXlFBZpZ0lfJl4VnUDojSExI?=
 =?us-ascii?Q?3jGMxNBIuRQ4vM83xVfrQa/AtLaHcaQN21cvHw90tOpLZbvOd69PkTPJcFdq?=
 =?us-ascii?Q?T+KThaoC3L59PWSOuzZ/VFyK6JBZtuoa2ZeQPc5NQFZd44E/6xoK3cOjnqYq?=
 =?us-ascii?Q?9UAaK2zg7JbiEUPiAyrz7ore1wn06KN1kvJwMferS40pVFN/RB5LAX1OOpXZ?=
 =?us-ascii?Q?My2+m1V6H/wixiRqcR1ipWKP3P7s7PSXAmNSv+vIGyI53PGbeRgKz6kwNNaR?=
 =?us-ascii?Q?r6AsubeqeeH+hscn/1Uu2t7jcCPEKCiXWASlHyiIV0L1RcRwVCuTq9OMqff0?=
 =?us-ascii?Q?20s382tgSAVhrpWlECw5PUkg2t76Eg//Lbf54aR5WIpmXYRo9Ruubm44ejml?=
 =?us-ascii?Q?0ObJUh/aduLlDlKl3UE7htWWAhVl7xtkqgsn+g3+oVsFRITInXEZYEei+1D3?=
 =?us-ascii?Q?N1Gi/bYyYQ3Oxd54cP2UE++lcR7BqrXFGcBD3wl+i0671nhgl3J0mtQOlgso?=
 =?us-ascii?Q?tT3niYx0zMzpDYETUexWe8SJACkYGq5z0pnkLCkaGQLuJY+QnXuD+Apr1ogp?=
 =?us-ascii?Q?JXT2h+qCgw7Rfb65bJUTu55dvk9l+vj0PC0mrFhEBHHUoLwRd9Yvcxc7RfWi?=
 =?us-ascii?Q?97Uv7wSjSZOFGpHairdafFddc15aWZ3JLCrVZlus2M61NZvLe1se3GpUaplZ?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f1VxrxoEtb0+ut7gKNaRqdScbMljmWmurmcURuKrJmop9fK1z3mvBsquj4CCglkHQ5EiObQbAOrbKcONpayvuueMKc31idc938Y6pOv/+J4v2N25bTav47npH4DTUUS/pOsKeC35uYEocEfA0hml0wtzTlxzYrAOLDjaVXWlbG/GiA8ZDvi2aWvvKYBdnGOQF3TyC6Y7Bftes9VgdyofRlumKpPy3C0sL1dTYP5xmgTQGlajMRR51LcxhCRRr0THvrtMPfuorKwwzx8/Wmcn/WOTsJxQEXBZ4kNpVEkp/HFOVYFeW5IkC4twbMw6Y0nQ+m6Q9H8PagkMI9V/ZfEY+d13CcCVdzDBUXItlsw4uGUR6uWcuwhV5I6Q2EWVY7t3PKYYEQ4zcYRvtEMot8XXQoluwKHnievo5kFzvhHFZmPtdd3yEOS9AZlPJjpbejPPvgJLv6aYMZ3JGeDBfmmQhccoAPKACHTnAdik7xscYZtkguy1B5iKUQKKc1JDzz8NHWSZcCO8a4ZhY0RbKKW1r0C/gG6FBXcmuQOQiR5FLUpYk0FSbYNEc89CFRRDQscN8us5w/jrs89HcgXNPX88xsVLZnqp9AgFEsvnA1uAIiU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c074f661-8fdd-4064-3998-08dcf79608e9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:14.7369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTqt0UkOpNaaqfUFW6b3OZ6ENNuwHo9Yl45lKRuoa6xDBBxNBckoR48cR+nhMpymKlM1ecHkexBwoDz/cjh2tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-ORIG-GUID: vKWkIP1j9qsuG51kQlkVzRC8b_PFaBLH
X-Proofpoint-GUID: vKWkIP1j9qsuG51kQlkVzRC8b_PFaBLH

/usr/share/pkgconfig/dtrace.pc says

libdir = @LIBDIR@
/* ... */
Libs: -L${libdir} -ldtrace

which is unlikely to work.

Fix by substituting LIBDIR properly.

(I looked at these pkg-config files after installation I don't know how many
times and never once spotted this incredibly obvious problem.)

Bug: https://github.com/oracle/dtrace-utils/issues/104
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 uts/Build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/uts/Build b/uts/Build
index 181819410624..65ddc39845c1 100644
--- a/uts/Build
+++ b/uts/Build
@@ -37,6 +37,7 @@ install::
 		(cd $(uts_DIR) && \
 		    sed -e 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g;' \
 			-e 's,@INCLUDEDIR@,$(INCLUDEDIR),g;' \
+			-e 's,@LIBDIR@,$(LIBDIR),g;' \
 			-e 's,@VERSION@,$(VERSION),g;' \
 			-e 's,@DTRACE@,$(SBINDIR)/dtrace,g' < \
 			$${name}.in > $(INSTPKGCONFIGDIR)/$$name;) \
-- 
2.46.0.278.g36e3a12567


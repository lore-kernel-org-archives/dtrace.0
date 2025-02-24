Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A462571BA
	for <dtrace@lists.linux.dev>; Mon, 24 Feb 2025 20:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428375; cv=fail; b=MFrtpRx4YDZtO8AGS9Sja8PNT4o2sbaSgyXMM7upnhQ2EiMnWTw4tV5wDcWeZfRcPVUpggyIDuCO6iwp3p3MKvQTNzYGM6I7+xYeP0ojL1esXuO3W5L2HrbdFEi0KoCPXSblCVh/TsX4bYzXeVGJU+94DDH1CwsI93NNTNsUCVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428375; c=relaxed/simple;
	bh=C+TMIjnFOCOQkBqwpk6Yd8rTCaQeE72MESHFCPx3D5s=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NvVjJXaPM3g61ZWVtf4AdwvSziRELpStLNQMKD4xa2tIWon0hn7KG9o4RdvSTMGRmi6OYa5x3vpQnS+Fu138pQ5SCZDckSgIU99n8VfYNjnHzAnSzzBJnMnY29ulL31R8gqptj/l45gldtZEbAnnSyy7NCvp62uzILlzVKlXgeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=c83PQHEC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wH6mvSa7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="c83PQHEC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wH6mvSa7"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OJXgng023356
	for <dtrace@lists.linux.dev>; Mon, 24 Feb 2025 20:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=W6IF04N1mCUNqcIMj3STF4uofhdsWiANud/HAr2lE4I=; b=
	c83PQHECRvs1uK2D/MuYNcjPrKFyEpArRXCCHuwb25Skk3WxmP8tGZ/ksZzqzLSZ
	rakRhAKXd97G0Ajt3aNFFGk5EUpusnPEDgBjNykmiJpuEPYYfMxCH6yyKZ2T8xOa
	B1eM0jQrvFFVu1bF6JWhcoM4hmezrdvXJd9Sg2N18xjxC0n472Aes0VzFHS9ZGA2
	Yr+mmENX8TjBPJu05d7rVCReJdS5rDw7JT89xjw99+4TUaHeyqjC6r0Xu4H5MBKK
	3ew3SS69pTV8d0JpjBBmRhpTDWOzPl88E8GjwEbADZDg1Y9QKeqLAhpTaZCu/goz
	N3E2bbiwOuB7RP5MXsVlig==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y5603hr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 24 Feb 2025 20:19:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51OJWEtc008183
	for <dtrace@lists.linux.dev>; Mon, 24 Feb 2025 20:19:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51e7d4m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 24 Feb 2025 20:19:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAqyq0SH+rxhPwAw6jJWJzZiM8Wf4nGXhp888c0IguLEouz4Zcm6z1Z0N5rl8XyPyWgK36XGhezoo+JtNuQiO21RL78KXKUKTs6IrR3q14h/+Fw8r5nbGZV5xuBCxYyuA1EPv9zpFu4GZO4eg6A50oCD7LSy+NNCIn+GclRlcT3+VjBxKDg1+UNo8d7l1jGdVfQVcMYub7qu35uT1JbZlQrPJqCpg4mYBRfvOVx5XEUtfbi7rcsrC6RJQlbE5jfrNAI+4GsLWsYkm/F9oUpEEWHnc++Zu+sN1yy9jVDKhj1CxUAhzb5CVgiEyD67oqGdrVjcXBEUwarpfsdKKpyPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6IF04N1mCUNqcIMj3STF4uofhdsWiANud/HAr2lE4I=;
 b=OAGVT03Vn9ZAOLGFFI5zqCQL1UOkL+rIt55/Z4uSS6mAEHhB8psQN7e74sd+14cQnxgyiGYFhPuWK7vt91oiYJMlMewN0rFncAOkc4Diq+onHm1qhvXROe6jhqHnO3Dnl9CVNS2G7FzVesDGgb31FUMn+BFRGq3sjUTQ6xAT8RwOWlLx0xpRUBaOrC44gqVaeHrjwSYbQtsOgOcMbz9hFWFZ7oSxWTaUD7rUntXkue44Veq4WEcqrUg7yWJWD945UzraRo/U8LOWoJqBnCnuBAyZ0hzp22l6NnObLQqCV0LxfX8XV6tHB8+18xUJRdunjwtGhm29yF2hmmoqjctNgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6IF04N1mCUNqcIMj3STF4uofhdsWiANud/HAr2lE4I=;
 b=wH6mvSa7UzYBPoW6uRw3bg2IZO+fmug8h/5wAZfAFgb/JGR5EEgvMpjtALsU26xlP8hrki9e90r7Gl8Iql28qfXgOF8W8N+NO0gimHlZIQsrSVTGJTzI/rYfVEOM6ifFQP268N9rplt0LUvD/e58nRiJCzGYPDhi4HEp/HJdBd4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB6691.namprd10.prod.outlook.com (2603:10b6:610:142::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 20:19:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 20:19:24 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Check tid value
Date: Mon, 24 Feb 2025 15:19:22 -0500
Message-Id: <20250224201922.12992-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0236.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: a7bbe31d-9c52-4014-08a7-08dd551087bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eV3RgLP22G3KNl1grKxTcqYGfIXvC0/07rjAHktGyFM4/9TemJS476DV89pt?=
 =?us-ascii?Q?9WFBqJDRoNF+L8c1UJvEQ8BfBamYPhZz4NGXPimdXYRWpUlE7TudUJR9bcL8?=
 =?us-ascii?Q?pL2AF2IEZswWxqywdl8GSPudRYyialjBzqhNQjmKdhu6qmY2kkg9Za/GFOM4?=
 =?us-ascii?Q?2sQTsCJ3upyPF85aEvOBNtuKCbS0mTzZszDXpQs6/91o61AQ/Ylmay18GOjM?=
 =?us-ascii?Q?esnEONMa/NyGM8w7d7eSVnwpL+YT2miy8ae73Q5T4S17TbCwr7sOBcq4Gn0T?=
 =?us-ascii?Q?ArgB2Dp0P6F3aYLwXVTNKbh/AS/8myKdoqLv7o8ZcOqLMVMVfzs6fo7wqChM?=
 =?us-ascii?Q?m9VLTNZ0FBBLuJJ+M7OS4bZ4ChiUx3fQB1bCSrkJDzrrisVMidmU5JaiE1zb?=
 =?us-ascii?Q?LyiMop9uqOJjM2A1PH2ZZaks7l3CRAGZInSe6HiWe/2CGyFC3U2CyRXOzZjN?=
 =?us-ascii?Q?ta03Bw8Pe3lQYQql5m/7o7+2WkVOq2J0CZ1YyKdv4Nm/GPriHuYXJpPRqPp7?=
 =?us-ascii?Q?sY5VO5O1LYhIIu57+SoxSQ9IzGSWGdEbQK/hUT6ZAzqbpQBK6LikjEsdF++7?=
 =?us-ascii?Q?q7p83LxKZOUNyywAV17Zsopkk4RjcEFFesqddQC7bSrj9AXqFlieFrsfRhZr?=
 =?us-ascii?Q?GxOaQj0L0pEFhDamfqzQifrsRFjILAf+81JWF7UZyJEw4KGPtWUIqPG+t9IC?=
 =?us-ascii?Q?QY7fuELubaJpj3N2Kk3J9n9yPgAuinG5HDJn5x1CI6wj9Nrx8x2VYqn86znk?=
 =?us-ascii?Q?P3mrpxkAph2Vscd7GJ+kmVDwl22PKJEJwW0AS0+mUMFMqh1iLTO6GmSjNg45?=
 =?us-ascii?Q?dDT9ndb8uT3Mm6YuYBthhoKan261E5FuzxPrvoC8Th+4T9uL0gSLip1jf4+I?=
 =?us-ascii?Q?SDklqiPCgUnQxt+H76SbP5ggLo0asiE6vQU2EEFlWxEq/zZ+0QgEJJzV1OY2?=
 =?us-ascii?Q?31WP25WToMXT1SLiqFcx/eW91ALitYYtIZwgb+UojzFyntUcufo8g7aLwNCw?=
 =?us-ascii?Q?7gQS4davH56QJlOF8RCBIsXsddKxk7y9s93fl4xTnT4byyRbCD/MNttwBIQZ?=
 =?us-ascii?Q?7ikhE8jUyFQm/xguuGs17vjMLbk/RdKquQKARHd+hYVOf7aQq7aX9dKmewrZ?=
 =?us-ascii?Q?4Hgj4Xj8fZXGzEGVPWpXhsFjUt4D1xI+POq+rIGQo6rpNXVFuwQN7ZOEdAxb?=
 =?us-ascii?Q?R+3r44euBGDQn+xuKeVL9fh/S1R5FRZiAso122NfTbCJcRxthdSTriiQBNBM?=
 =?us-ascii?Q?KG1BM6Pf9rrJ/Q6Ja+5eoxTzZGtwyrMD1kabCrRRQdMwcB/NtKwU3KN3c5YW?=
 =?us-ascii?Q?5br0sIiKpoYgZ0UwM52BkwNzdPRaWAT6c4ieJPxl/ZKQkg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EB5UU2ncjhPhGoEJjOcOgMpYQVylVcIBkMpIP7K1a1RqgCSpIBgxF8etC99J?=
 =?us-ascii?Q?IF6AEHYhEnekAiFeLq/GCZODhhtN236gPLylB7w++gplLMv+f1uhkjmnhp0G?=
 =?us-ascii?Q?dsgQe6wzoQXoi/Yv1j9/UnsrfwFmmJlsaB+/PtbuBPbYlTz8Unf36XcWdoPb?=
 =?us-ascii?Q?nJBqMlqVDDdbUSzXQ86qAG+J7XzytI3m3lQs6f16xZTZUmBi5LqCeKsNrWS3?=
 =?us-ascii?Q?FLRlBO0bOZdQK6gYq2Qz5I48sJNWnSJ91RHZSuMTDvwds9LWdxaeaauYEsHc?=
 =?us-ascii?Q?4JQqcZTsBlC/EUxW7l9kk8yuihjvHLK/i5cub3Brlnqr5eLg3G+ThpikNf1V?=
 =?us-ascii?Q?BpkJ6PRPKr2Mi03uft66QjIPrItRViH1i2VO7nnwUB3TedHvFObAGOzCIa9o?=
 =?us-ascii?Q?HP0/Z1t/Ek6o8bZOO3dv2RfjavyTzMTY1q8mR9Ti1JLS4QLYr28K7TJ5kDYf?=
 =?us-ascii?Q?QiIr7EECW5VDNKCqE2W4Xcg914P+g/C1ekGlNlsyEpeA7Gdw6DjKoAuQwvnd?=
 =?us-ascii?Q?6hKinkZ0AoY9IbiixQXCVlvsNk5zz4AD7vByeARR8Vh3RB+SlUZsp+MnftrQ?=
 =?us-ascii?Q?dQKwzLhelg7FLzy1iWGX/RT+5L6oywMigF9ZjKIf5YhGlRQUiiREH2+eFiSm?=
 =?us-ascii?Q?kWc0X7jWvAO3xYpb+vRk8Ff/ebIHbQiqmggFT7YYg8jzwxxoKxGMQ5jbXva7?=
 =?us-ascii?Q?+JClNlEp8xbHKxyWqsQrpuvyyN/T0bqMe3p4PIVmpkcixuQ4ZPgWAhQcyZl/?=
 =?us-ascii?Q?oTEAzT7xZiuzxjgN1UDfFr5KNAwV2R9Mg8vdYniodDJC9WgsknCt8/0s/EP9?=
 =?us-ascii?Q?TXwHcbPnO4BnteSSs9Japo16H9wjudW4fUvvnG9Mjw99CSqwSoaO9ye4uJB+?=
 =?us-ascii?Q?QepRm0oa5NCTzRAifGE+gwAjMyf4XlVCjF/pLTa8fXvyfVn0RxoR/5kBwc5W?=
 =?us-ascii?Q?epFeF/UXgf5zxjj+RtBLrUGeI8eYiKeZsTejhVIDgwnp4F3QEicH5eQnU/B3?=
 =?us-ascii?Q?X7JbFpwhJyeleHyTOHHDVSnEh8/K8Fbuy4NX4CnHp5KcMtDkDRnH/p33C29C?=
 =?us-ascii?Q?1tcARl/ywezTq6c/TgGIgbLBBOcdDPaM4hLMEe3vcK/vAUH0UQnb7tCDd3e5?=
 =?us-ascii?Q?ZrUOE/DxpKJFPmJ2NxGZHJKWIqQmxOA/hvI005XH7sZ7eTQc2amzGU6Y1KP2?=
 =?us-ascii?Q?XbfFWW4Hqu60zL1UuGzeDW2HckWOw5M2Wim/Ct9gEerzhn7JbeYelH3r6HY5?=
 =?us-ascii?Q?EHFWxXD9wrZOQYNmL+diZsuDsIoYUmBy6cgvyy5MmUpyW01KMLP49hQRCn8D?=
 =?us-ascii?Q?aOG8OmwynT2+Oq8pYymslz4ppnEEB9tSqZot3NRe6INmLFjOex+wFdxls3Uk?=
 =?us-ascii?Q?6utEpNTsaZ6YJbTitfKvMDBWCYrr9Gxu65bbqlWBgnXQxWq4OoxoldZ6WJdr?=
 =?us-ascii?Q?1t37mAmS21SmUjvHJ3Zw/CloUCX+cEA2UQ2oye964gGweFtHFfH68M3Oq5es?=
 =?us-ascii?Q?BICjRbbtaIsuX+x2+1dp7ISLRSW8e9inPovl6Ek46gyS5UGw66CZjoZXP9xV?=
 =?us-ascii?Q?YyAlzQkneET71M21uOer8zkCRCBg0w8NRgRUOKas?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aZSkfrhjOEhtHvFjEpcY7/ubzUZu5Pwe4/ul1mJ6dXeWqxdWVzfgkG0CNM+ZjEpWatFjLHrdQYeU+tZ85puy1K5KsCGdA88pVTT4W3zenX8lxnsjMQYnQBQoTuSlaFClEDHjtAIlmtL6Ydt+sLKy3b/SKiyrv2niTOYbvlyFPNgcBQdjMy+n+XoYCyLYIIC+Ov9QhkQjPfO6HK2xuVuY1bl2eDhlFOAXB5V5MAmihFPuaQuzlEEI8NfKWujTpME6XOLXU5qoTiXiTahHDJfrBBjuoODWO1mAOdiKoJvw9iD1zjgr/4lqkPRYYVFCJh+Yq68Xld3d2pNdFXdzjhjWPjYlgmn6HyY4D6psGU1Z5DwJ6/Lqb9k1PsJPN0PgETkPb8uOqllnMOM5vOQUA11YzS2izhgjGoezK3rY75HDuiCbDNQ7KK+OwhvN+1Kw5oZfwWWMThgHd1fyN03781RO9iR7M4FUBzgS9KsAaeLrvknItsYkoWOl0iGyUMvXZ/B911DuhMgGFUNWqSRr3I+xWy9QdS5VjeG2icHJog9JT1OgxiKh1G42PiVWmI4Sy9zKE6I027gCjwpIWdqFLvUval8c+MZF5RBXN32Io487L4o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bbe31d-9c52-4014-08a7-08dd551087bd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 20:19:24.6576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeLV5YndbGdzfe2cj/0UhQpas95glUbu6WPoDpH4GYgo1uWaIoE41f0ZSLZ8vW92lagdNhxmCVsBdtfMezU1fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6691
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_10,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502240129
X-Proofpoint-GUID: 5Nzc4AdvAmgfp1Ndyar54mv1WbHd0k42
X-Proofpoint-ORIG-GUID: 5Nzc4AdvAmgfp1Ndyar54mv1WbHd0k42

From: Eugene Loh <eugene.loh@oracle.com>

We were checking the built-in variable tid simply by testing
that we could print it and its value was not -1.

Add a test that confirms the value is actually correct;
compare to C output of gettid().

In line with other similar tests, also check for the profile
provider.

While we're at it, check the pid value and the pthread_t value
returned via pthread_create().

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/builtinvar/tst.tid_pid.r  |   1 +
 test/unittest/builtinvar/tst.tid_pid.sh | 126 ++++++++++++++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 test/unittest/builtinvar/tst.tid_pid.r
 create mode 100755 test/unittest/builtinvar/tst.tid_pid.sh

diff --git a/test/unittest/builtinvar/tst.tid_pid.r b/test/unittest/builtinvar/tst.tid_pid.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/builtinvar/tst.tid_pid.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/builtinvar/tst.tid_pid.sh b/test/unittest/builtinvar/tst.tid_pid.sh
new file mode 100755
index 000000000..7ff0227fe
--- /dev/null
+++ b/test/unittest/builtinvar/tst.tid_pid.sh
@@ -0,0 +1,126 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+CC=/usr/bin/gcc
+
+DIRNAME="$tmpdir/builtinvar-tid_pid.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Create trigger program.
+
+cat << EOF > main.c
+#include <stdio.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+#include <pthread.h>
+
+/* Provide an implementation in case glibc is too old. */
+pid_t gettid(void)
+{
+        return syscall(__NR_gettid);
+}
+
+static void * foo(void *arg) {
+	int i = 0;
+
+	/*
+	 * Each thread reports the pid and tid values it expects.
+	 * (Expect the same values for both the pid and profile probes.)
+	 */
+	printf("pid     probe expect pid %d tid %d\n", getpid(), gettid());
+	printf("profile probe expect pid %d tid %d\n", getpid(), gettid());
+	fflush(stdout);
+
+	/* Wait endlessly.  DTrace will kill me when it is done. */
+	while (i < 2)
+		i ^= 1;
+
+	return 0;
+}
+
+int main(int c, char **v) {
+	pthread_t mythr;
+
+	/* Create a thread. */
+	pthread_create(&mythr, NULL, &foo, NULL);
+
+	/* Also report the pthread_t. */
+	printf("created pthread_t %lld\n\n", mythr);
+	fflush(stdout);
+
+	/* Wait endlessly.  DTrace will kill me when it is done. */
+	pthread_join(mythr, NULL);
+
+	return 0;
+}
+EOF
+
+# Compile the trigger program.
+
+$CC $test_cppflags main.c -lpthread
+if [ $? -ne 0 ]; then
+    echo compilation failed
+    exit 1
+fi
+
+# Run DTrace.
+
+rm -f C.out D.out
+$dtrace $dt_flags -o D.out -c ./a.out -qn '
+/* Report pid and tid from a pid-provider probe. */
+pid$target:a.out:foo:entry
+{
+	self->mypid = pid;
+	printf("pid     probe expect pid %d tid %d\n", pid, tid);
+}
+
+/* Report pid and tid from a profile-provider probe.  Look for the thread we created. */
+profile:::profile-1s
+/self->mypid != 0/
+{
+	printf("profile probe expect pid %d tid %d\n", pid, tid);
+	exit(0);
+}
+
+/* While we are at it, check the pthread_t returned via pthread_create(). */
+pid$target::pthread_create:entry
+{
+	self->thrid_p = (uintptr_t) arg0;
+}
+pid$target::pthread_create:return
+{
+	printf("created pthread_t %lld\n", *((long long *)copyin(self->thrid_p, sizeof(long long *))));
+	self->thrid_p = 0
+}' |& sort > C.out
+if [ $? -ne 0 ]; then
+	echo DTrace failed
+	echo ==== C.out
+	cat C.out
+	echo ==== D.out
+	cat D.out
+	exit 1
+fi
+
+# Compare the C and D output.
+
+sort D.out > D.out.sorted
+if ! diff -q C.out D.out.sorted ; then
+	echo ERROR: mismatch
+	echo ==== C.out
+	cat C.out
+	echo ==== D.out
+	cat D.out.sorted
+	echo ==== diff
+	diff C.out D.out.sorted
+	exit 1
+fi
+
+echo success
+exit 0
-- 
2.43.5


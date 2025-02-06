Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C039235346
	for <dtrace@lists.linux.dev>; Thu,  6 Feb 2025 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860408; cv=fail; b=TE22HmeLo/88x6PtmLLSOPgvYnx0bdP0hWr/7NCTwNI1oQZlPjdRN46jJuByA7MhGix2ghBw+B4AbHPKaIqpvUH4VLL3Vu91aYgBbCMTZhjjYfZ1IxZtZ7ZJ2FpD7TW5zNiT9zIuVVHaOdgw+1jQ1ydQzjuCHSXNBuQD9qUVb2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860408; c=relaxed/simple;
	bh=9KwJlp5mFWsPpxNGGMkl1Y7ELAErTZlzq0dDRXvgkZk=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=T5WMMkgwxorApo16wgUKg3wAaBG/Zhz3T7Blj5kSH8Snp08iAofwUUxTtBnBgptAroOegFuQR/bYcj1F1ht3NlPafpgm1Sy6sD84i3SfYhU5XZSYy2+Ns6mYl+GLE1K0A+FbB4UBLyGzle/QeOg4r5ErBOziC2qJTGRPNl/0P9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KKndzDV5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Zrpjj+Ya; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KKndzDV5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Zrpjj+Ya"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516EB1SS028568
	for <dtrace@lists.linux.dev>; Thu, 6 Feb 2025 16:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=jhZWp5x9KDdVGm7PfmzFk+lKe2BdtDGopTF/4I3lOoY=; b=
	KKndzDV57mrLXbUWjS+m2StuALTXSuSxDbB13icfM2FVGnnja34cCpSQNcPy4KgU
	hTrJZe8h9IYBfXt5j7b5rlAToi1uehmKbPbnvZJtdB02c2WdtHtLpEvYZwxVYbUv
	YWjarmOyJoyITrEZHABhYd0K5hil0D1LIChGK9evgnkLE7nMMqUz4Q6rNsJolUVN
	UUyXKED8zsgPWxx8az2Qo36VElHfEvELGS48Lk19N9KA5XU6b3uPvxunsKDaVddN
	NDXLt50ZT9KRVJRo0Wmj7Of9bgIr2Usb1f/U+q7+DX33U8g1SoZPpftU6mHteM/V
	nbijZIeCH+MaLqrrsbO4+Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44kku4vygy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 06 Feb 2025 16:46:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 516G8OC9020693
	for <dtrace@lists.linux.dev>; Thu, 6 Feb 2025 16:46:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fs3bt5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 06 Feb 2025 16:46:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0ckVxrdQ46ElJhjnITW9RoX9vHxODUo9b1/WCrPeo/YnWPQg4NVKVE9B1ievqofuQPPu3A7SRzlccdedjAtgqcRu8knUtmeFHNNe8SBwQ5OmTTWOUEf0h9FBoF8U0yvgJuasWuYz7ZsQlr7Nmlk6YRoeZAYtU4hWn4cxqy5S2DTNvYnteWHwuX7vC8MdsBPqIlzb+PD1a8Rt9WPHtS1ZgLUcMZNPSPEhsH5PQ+LG6qpo1AjBXBdcTqLsgj2vohBJHIjChzyO4Y8ZuztVdhdO9MT1QdlkTYu1B2PNO+r7eyl+tTtE0+jizPBVH4LQng0daeaBWqOAnK7dEf5eIbPfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhZWp5x9KDdVGm7PfmzFk+lKe2BdtDGopTF/4I3lOoY=;
 b=fPjQIAVjwzNZXPm9SdnGeLcLcwJZkhpxun8xWzoG2/0HThxVvV03Bfeld54QA8FZRO1p2xag26lCd+lXMhe6KsKU/WjxNvlWw9YnMIBFOfvwiGTdNXvWIxTeDVVGxYdM+WdwpB/6JWqo2+29/gVKri/yFPoGQDGpLOXxcEHA/TVtcnMAbANPy1tu3kwXn0APg999tt+4NlHZe1fYW99f9RD6bedVjQyJteIobo3CcKWIpSJyhHpSJlv0RHfkn5VGbIwU5ppQQzDSdvvfW+rm7U+dqZchMhUyoOb2yawoZz3ZZX59NFGAhQTulhkNwGKTiTzAIdexDqUW4AiF1x1vNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhZWp5x9KDdVGm7PfmzFk+lKe2BdtDGopTF/4I3lOoY=;
 b=Zrpjj+Ya/jOygXkixoBf53wOBBGZ8HYljXj1MwOQ6qO33tgK/AHnNsmy90vfBGfCTJoO1qWC3xBPJvwnJaXo1vXtV9lk67eOlTU5hmKDcDQ3f1/MM4hwuNi/nIP5cXAbcctKzQGgHS1V46fxZpcvDq1LppF7BCsQbFXAqLVKuSQ=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS7PR10MB4989.namprd10.prod.outlook.com (2603:10b6:5:3a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 16:46:40 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 16:46:40 +0000
Date: Thu, 06 Feb 2025 11:46:39 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] trace: fix char-array handling
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Message-ID:
 <PH8PR10MB6337447CA1EB2716CC4CE522C2F62@PH8PR10MB6337.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS7PR10MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: e2264471-650e-4ee9-cc98-08dd46cdd494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I2X8IqYV7IMRlRHsIwyFJ3/4py6PD2Nfi+wo906tBKF6l0AUSMGhfHieW08t?=
 =?us-ascii?Q?eN5XF9VIGyaUP5v2jRoZ3WreHq2JLm8fbnNzIW1OsNZVdQZbdyCD3IZSnubK?=
 =?us-ascii?Q?f0jjO7ST9PbWMuUgcBf8NFbQGcTOX/sLIrxwYskBAtxbWN7Ql5nNTU1lrX6V?=
 =?us-ascii?Q?E7kmC4Z4FyNuO5Yh1NijL8hoUDuHB8+bT8Jj3fOyFSnRE2MJ/WDF7nuEa2gR?=
 =?us-ascii?Q?7p1/wnT/QU/wYRCafcnVilosqd9zuN5kDJvk25psSqaX3iKLeRddpiZnfnN2?=
 =?us-ascii?Q?HXHkxZ2kQf2E50DXtn/bOVN9Jx9Y3VCCNzWxC3/ATEfY54fFtNc9LYxW+lHc?=
 =?us-ascii?Q?5skj+4i0+fCm9Z1Biqmj0JukTtpO5NVQXJKjwXwERo/+Pc13YiLl/nvxd13Q?=
 =?us-ascii?Q?l67EceG6ZTNX5Dpa3hxvebH4mEAd//g0QNXMZ5SmDJIbTGnpUI87vgDyUNPW?=
 =?us-ascii?Q?Tdh7NlyhOWzloxeo+UCSdKLV+Y/hIYgg1N9N/LVuEXP7lnY1uXku2pwCxJjW?=
 =?us-ascii?Q?lEBqeTE+Ay5HRFMltPSdAim9gq9sK/Eb634BW7KoScjsp9kPQwgTfyFrjh1f?=
 =?us-ascii?Q?N7x7BjXtbLUqXojVb+3sCFlnefjfSTcy69zotZqUP8nMVj4sPOKsRUSbdba6?=
 =?us-ascii?Q?nqwrCDJWqDpxyWvwXlXfVLCIGp+Ex6LOkDnsPmK8/xVfH6+Fp3BaTs9XVP/m?=
 =?us-ascii?Q?gvoj+g1toToXhsOCdgux35znVS9x0NeRWDoFI0ENnu6m7LdNry8uVJRMoN04?=
 =?us-ascii?Q?88LRB5mtihG5PGKmG8Uw3yOGAveycgb2yyQ6q77H8AI8H2YZoBWu0SEvOuSx?=
 =?us-ascii?Q?FvMoePKiG5U6dMpQt/Nd7jY+R9BpqRbKjsuaFgPICwULxm7vbHFJ7HI0ELHf?=
 =?us-ascii?Q?8PcKiOdF3lf1BmuvI4WJsdsdIg77O6kHQ3IqBFzYcP9ovPbd0GlCvZC90T5m?=
 =?us-ascii?Q?/3franihE6SkQMi7Jjp7OmsALl9tfrm3D87IBL/TyUYpRBMYPG6VthF3avA/?=
 =?us-ascii?Q?S46fINhgztpi77gWSgS9TYMNe917Gqq2Usid/PvFG3I/QR6IvfjLJO/EJJ+V?=
 =?us-ascii?Q?JsgVJIadGj8g+QjLh6/jDaUzEIyIDqMtF+/rT05YhuXOK8ConGlkq86DD/1G?=
 =?us-ascii?Q?GOf4pe9ClWECJxWAZ8Lmshr6w+EvjsZsTSBQNBWWatkFXklJhBp3tItJ77sx?=
 =?us-ascii?Q?4BO9MSSRgsTmZW01RW3rD3m+Q5HE7giTUa3D1YOiWg/qDvCwjXG4PORI04g9?=
 =?us-ascii?Q?OzYLR97IQIRFQCcFw5eTb3hNxaNsNI0jP53nbAj0TLLq7MqWR7AGCMv/CfRW?=
 =?us-ascii?Q?bqg5b2ANNdLqXGvPfAf2rL6jzMxOtApI30PTf86eQTwGMQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wJ941Y4mIkqCjow8Z3e65kMdgLx0UBJ+ZaShJetwS9JuQSbvCmvkQggV3QOU?=
 =?us-ascii?Q?3qvNd6dgVo889/wGRjWpTmnPZ6NsVecGJMA5NyrFD/Tyfysc+THpaimpDWvn?=
 =?us-ascii?Q?d0cLPQo3/ipKgADG+UWxJICPL3ShmK9XCYtNJj/MIkWRhMGmE91cnG3Laxnv?=
 =?us-ascii?Q?TWJq6wi/Kvq+hVdVx2rMOystTOGJO6b1h82GrtA0kepOO5YU9XlNWUtIQsPA?=
 =?us-ascii?Q?9vMUVZKUe15j1Tz/nqlR6OK7xRNZQM6TqzMaFObhtdua8jMQuqHtmLe3p5Y0?=
 =?us-ascii?Q?FZhp28C1Nj14Gf133ZL3xw2+L1vvC/jb1g2g5q1uSsyZwXF2LsFUr4BlSPrU?=
 =?us-ascii?Q?eYl5ZRTAJKwWwIL/Hjla9B/8M15pz91+pVCN95IC0OwzHGhnDFlJtYQ7b46f?=
 =?us-ascii?Q?fknS1LwCfKIyD34DiIHusEwuetjTFxx380REl6+Z53Zx73LxSO7kWgEn89JL?=
 =?us-ascii?Q?7Nrnq+sEuCTQG9wJlKROlMmKRTgOPv3hoiG6ecCZz+2jsC7o3+ze8YQ6/2KW?=
 =?us-ascii?Q?9ABmIWW+sUlEOua0PH5twDRfBX6RhM0mE4gEinns+F+JJh8ju+DKfOTgJoqq?=
 =?us-ascii?Q?fiqf8Mn3Tryq/6P0q7hjukhLynmFUYZZxN0iEXR5xudJHw/Du66Rw7KF3Rwq?=
 =?us-ascii?Q?hklJepipTuckdoKvl2QspXzmkvx0OfZaiv1XB+/Xgqs2RBNexxoiu+Wjupky?=
 =?us-ascii?Q?+o6LrBb7zI4RPibEl6RXeSb+RK2SaWnI2H3D0i91zgiX5msCeQJYc1T4v+tt?=
 =?us-ascii?Q?TqaKuP8A92ZUiEY9qU+OkSH/wL97Kg1GY+ZcdtduEl2OA1lCpt/K34Cnw4Oh?=
 =?us-ascii?Q?G8mNRYfXLVcX8f6O389w636591K3PVHYyiZ8N116ivQRlP26MiGLW4ptiHzf?=
 =?us-ascii?Q?wKra0NGM20Sh5OaYhJvZCB9XCH36V5uiF0d8JzKTQ1neR+pY86jIUm1LSKNC?=
 =?us-ascii?Q?ireNez4+NpyxSbPwnBNk1s77wuqiaskf6eL1ZnfKHZO+1XsINEgcmP5OJn0z?=
 =?us-ascii?Q?zk603usBvS6X9KfGi0qhhw+DSsI2AumrsFaApR51sNU4tWR4hQHrLTDJPsQv?=
 =?us-ascii?Q?A02LTH+AX2J9IjjQMyB4aDNsxrgvsNO+C3cq/PkDgw7QMp49VCcqPcCSlwIx?=
 =?us-ascii?Q?XDKut4zy4TeqUGHA+zv2OfNYRNTsNTkoIqGTwUrR03r0wiNKbCPpw1SKxk1N?=
 =?us-ascii?Q?PJE/LsswzfzDmetuxXJTohKXKV5LcxJ5dp4ylK0pYmN1V4d8tf5JBA5uDWPn?=
 =?us-ascii?Q?tX+bnRoS3K92lzzG43z200KO/sXWu7qWHKNtFb4dSt78CtRkZfUJXlPYs+F+?=
 =?us-ascii?Q?R6VgGHngqP/ech+DM+yxarAKXsfrJZXxDs1AJ83+p3T0kocXYIb+9NmP9S3N?=
 =?us-ascii?Q?6F0UaQYG9t6kNae6ClgmTumDV/AWSZtxkBkBgC4bhMaVJlEX/3L/8vK/MPOK?=
 =?us-ascii?Q?5ef+qBagVe8VXArjN/yb9DAHLmqQsM2hsfhGEXR83mC8ynnpHqsmzbXW8Xok?=
 =?us-ascii?Q?UOCXt1rIB+edqw1fwXScihx1/l31zVy4phzlpKMeZ0wfAUINO7ksiRy9wjwQ?=
 =?us-ascii?Q?iM3N92sEhqOitiigZDpnfAu/JHNFR8GkcNBewBDOS0mNFGwo//6oEAEMHkMt?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iuTYlyB1W/DeIXdbE/vknnDHQ2NcUl9A7KAj1Av5N5XNidr7fFTu4zwJgO3XwVgco25lYq2NDXOXViOClM/8J/tyI2+k/VaznkO+yVDEc7/dMj2pCQhudAiMWjz9mFYuDC5J8cmL9rpucg8QGpO4+NKUPfxNB4kiRQb3KH32/ely/yK5G2oOSYA3sWWcz/EyXTbvY1cIEogqvPlZOMT6aOpz04fXg2n9lRawZfYRKJt2LHzRB08zNULbqbR2JOHvk+IHRCSjkrogMgjGjbK3tFUY0yEDatcJJB2HQ1BrL2iiI4ayb02hOiyFMoX6TuGX0gYGDhTXYb85aFnHFPrTv7093EdRyPbSjATGwzNzxaOaMrJk5O17xNIwK6QnP2py7f/aFWsnvkfF+T0seOL2bS32pDOuD09J42j3yRcxeDzCe+70qaLDu2K4SdAjLVbIuN/QBWrB1rn0PpfJlbGlScntgEYZlltKwDXKjoMpH6zilQzWEpLKYnG6YH4TRpTSN6ZgclMV5+lfdJmaCTAyUHmD4D4wSaMyX9OghflXDWI3qnW7OPQTOe9/Kz0EfW5oXb+uigdG5dXkbG40OkOaq5TrwQ/3inctIKLqiktYdHM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2264471-650e-4ee9-cc98-08dd46cdd494
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:46:40.6695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGOjwONu+Y66d41PM2AEQOCY3pQoPK8ldnXRqY+YUnCB08bmZ3luQ70cWVkqNZpjgI/PdU9Ufgpychu9pBuRzuIyGzZJEzVwiCp1WRJMLvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4989
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_05,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502060135
X-Proofpoint-GUID: ojuMC47esb6qI5fu6kujuwbUeobvxqGi
X-Proofpoint-ORIG-GUID: ojuMC47esb6qI5fu6kujuwbUeobvxqGi

The special handling of strings in the consumer's trace implementation
did not correctly account for char-arrays that do not necessarily are
intended to hold string data.  Thr trace action is documented to print
data as an ASCII string if it can be represented as such, i.e. if it
comprises only printable characters, optionally terminated by one or
more 0-bytes.

The implementation for trace on both producer and consumer side was
using the data alignment as a marker to determine whether data should
be printed as a string (alignment == 1) or not.  The real alignment
of the data should be used, reverting code back to the necessary
heuristics in dt_print_bytes().

The dtrace_diftype struct has its dtdt_pad member renamed as dtdt_align.

Added several new test cases to cover various possibilities.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/dtrace/dif.h                          |  2 +-
 libdtrace/dt_cg.c                             | 16 ++++++----
 libdtrace/dt_consume.c                        | 20 ++-----------
 libdtrace/dt_parser.c                         |  2 +-
 .../actions/trace/tst.array-char-multi-nul.d  | 30 +++++++++++++++++++
 .../actions/trace/tst.array-char-multi-nul.r  |  8 +++++
 .../trace/tst.array-char-str-multi-nul.d      | 30 +++++++++++++++++++
 .../trace/tst.array-char-str-multi-nul.r      |  5 ++++
 .../actions/trace/tst.array-char-str-no-nul.d | 30 +++++++++++++++++++
 .../actions/trace/tst.array-char-str-no-nul.r |  5 ++++
 .../actions/trace/tst.array-char-str.d        | 30 +++++++++++++++++++
 .../actions/trace/tst.array-char-str.r        |  5 ++++
 .../trace/tst.array-char-unprintable.d        | 30 +++++++++++++++++++
 .../trace/tst.array-char-unprintable.r        |  8 +++++
 test/unittest/actions/trace/tst.array.d       | 11 +++++--
 test/unittest/actions/trace/tst.array.r       |  2 +-
 test/unittest/actions/trace/tst.array.r.p     |  6 ----
 17 files changed, 206 insertions(+), 34 deletions(-)
 create mode 100644 test/unittest/actions/trace/tst.array-char-multi-nul.d
 create mode 100644 test/unittest/actions/trace/tst.array-char-multi-nul.r
 create mode 100644 test/unittest/actions/trace/tst.array-char-str-multi-nul.d
 create mode 100644 test/unittest/actions/trace/tst.array-char-str-multi-nul.r
 create mode 100644 test/unittest/actions/trace/tst.array-char-str-no-nul.d
 create mode 100644 test/unittest/actions/trace/tst.array-char-str-no-nul.r
 create mode 100644 test/unittest/actions/trace/tst.array-char-str.d
 create mode 100644 test/unittest/actions/trace/tst.array-char-str.r
 create mode 100644 test/unittest/actions/trace/tst.array-char-unprintable.d
 create mode 100644 test/unittest/actions/trace/tst.array-char-unprintable.r
 delete mode 100755 test/unittest/actions/trace/tst.array.r.p

diff --git a/include/dtrace/dif.h b/include/dtrace/dif.h
index 576bda2c..70257b2f 100644
--- a/include/dtrace/dif.h
+++ b/include/dtrace/dif.h
@@ -33,7 +33,7 @@ typedef struct dtrace_diftype {
 	uint8_t dtdt_kind;
 	uint8_t dtdt_ckind;
 	uint8_t dtdt_flags;
-	uint8_t dtdt_pad;
+	uint8_t dtdt_align;
 	uint32_t dtdt_size;
 } dtrace_diftype_t;
 
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 6e74b4b0..a5c9aa09 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1601,12 +1601,11 @@ static int
 dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 		dt_pfargv_t *pfp, int arg)
 {
-	dtrace_diftype_t	vtype;
 	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	dt_regset_t		*drp = pcb->pcb_regs;
 	uint_t			off;
-	size_t			size;
+	size_t			size, align;
 	int			not_null = 0;
 	int			cflags = pcb->pcb_stmt->dtsd_clauseflags;
 
@@ -1619,10 +1618,14 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 		emit(dlp, BPF_MOV_IMM(dnp->dn_reg, dnp->dn_ident->di_id));
 		size = sizeof(dnp->dn_ident->di_id);
+		align = size;
 	} else {
+		dtrace_diftype_t	vtype;
+
 		dt_cg_node(dnp, dlp, drp);
 		dt_node_diftype(dtp, dnp, &vtype);
 		size = vtype.dtdt_size;
+		align = vtype.dtdt_align;
 
 		/*
 		 * A DEREF of a REF node does not get resolved in dt_cg_node()
@@ -1664,7 +1667,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 
 	if (dt_node_is_scalar(dnp) || dt_node_is_float(dnp) ||
 	    dnp->dn_kind == DT_NODE_AGG) {
-		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, size, pfp,
+		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, align, pfp,
 				 arg);
 
 		emit(dlp, BPF_STOREX(size, BPF_REG_9, off, dnp->dn_reg));
@@ -1678,8 +1681,8 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 			dt_cg_check_ptr_arg(dlp, drp, dnp, NULL);
 
 		TRACE_REGSET("store_val(): Begin ");
-		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1,
-				 1, pfp, arg);
+		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1, 1, pfp,
+				 arg);
 
 		/*
 		 * Copy the string data (no more than STRSIZE + 1 bytes) to the
@@ -1706,7 +1709,8 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 
 	/* Handle tracing of by-ref values (arrays, struct, union). */
 	if ((dnp->dn_flags & DT_NF_REF) || (arg & DT_NF_REF)) {
-		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, 2, pfp, arg);
+		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, align, pfp,
+				 arg);
 
 		TRACE_REGSET("store_val(): Begin ");
 		if (!not_null)
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 74004c69..58a2ead9 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -1921,23 +1921,9 @@ dt_print_trace(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
 	if (dtp->dt_options[DTRACEOPT_RAWBYTES] != DTRACEOPT_UNSET)
 		return dt_print_rawbytes(dtp, fp, data, rec->dtrd_size);
 
-	/*
-	 * String data can be recognized as a non-scalar data item with
-	 * alignment == 1.
-	 * Any other non-scalar data items are printed as a byte stream.
-	 */
-	if (rec->dtrd_arg == DT_NF_REF) {
-		char	*s = (char *)data;
-
-		if (rec->dtrd_alignment > 1)
-			return dt_print_rawbytes(dtp, fp, data, rec->dtrd_size);
-
-		/* We have a string.  Print it. */
-		if (quiet)
-			return dt_printf(dtp, fp, "%s", s);
-		else
-			return dt_printf(dtp, fp, "  %-33s", s);
-	}
+	/* Handle non-scalar data. */
+	if (rec->dtrd_arg == DT_NF_REF)
+		return dt_print_bytes(dtp, fp, data, rec->dtrd_size, 33, quiet);
 
 	/*
 	 * Differentiate between signed and unsigned numeric values.
diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
index 325ba881..eefe8341 100644
--- a/libdtrace/dt_parser.c
+++ b/libdtrace/dt_parser.c
@@ -4914,7 +4914,7 @@ dt_node_diftype(dtrace_hdl_t *dtp, const dt_node_t *dnp, dtrace_diftype_t *tp)
 	}
 
 	tp->dtdt_flags = (dnp->dn_flags & DT_NF_REF) ? DIF_TF_BYREF : 0;
-	tp->dtdt_pad = 0;
+	tp->dtdt_align = ctf_type_align(dnp->dn_ctfp, dnp->dn_type);
 	tp->dtdt_size = ctf_type_size(dnp->dn_ctfp, dnp->dn_type);
 }
 
diff --git a/test/unittest/actions/trace/tst.array-char-multi-nul.d b/test/unittest/actions/trace/tst.array-char-multi-nul.d
new file mode 100644
index 00000000..187fb711
--- /dev/null
+++ b/test/unittest/actions/trace/tst.array-char-multi-nul.d
@@ -0,0 +1,30 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The trace() action prints a char-array of printable characters
+ *	      with multiple 0-bytes in its content.
+ *
+ * SECTION: Actions and Subroutines/trace()
+ */
+
+char n[9];
+
+BEGIN
+{
+	n[0] = 'a';
+	n[1] = 'A';
+	n[2] = 0;
+	n[3] = 'B';
+	n[4] = 0;
+	n[5] = 'C';
+	n[6] = 0;
+	n[7] = 'D';
+	n[8] = 'e';
+	trace(n);
+	exit(0);
+}
diff --git a/test/unittest/actions/trace/tst.array-char-multi-nul.r b/test/unittest/actions/trace/tst.array-char-multi-nul.r
new file mode 100644
index 00000000..c1361e75
--- /dev/null
+++ b/test/unittest/actions/trace/tst.array-char-multi-nul.r
@@ -0,0 +1,8 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
+         0: 61 41 00 42 00 43 00 44 65                       aA.B.C.De
+
+
+-- @@stderr --
+dtrace: script 'test/unittest/actions/trace/tst.array-char-multi-nul.d' matched 1 probe
diff --git a/test/unittest/actions/trace/tst.array-char-str-multi-nul.d b/test/unittest/actions/trace/tst.array-char-str-multi-nul.d
new file mode 100644
index 00000000..75164cd3
--- /dev/null
+++ b/test/unittest/actions/trace/tst.array-char-str-multi-nul.d
@@ -0,0 +1,30 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The trace() action prints a char-array of printable characters
+ *	      followed y by multiple 0-bytes correctly.
+ *
+ * SECTION: Actions and Subroutines/trace()
+ */
+
+char n[9];
+
+BEGIN
+{
+	n[0] = 'a';
+	n[1] = 'A';
+	n[2] = 'b';
+	n[3] = 'B';
+	n[4] = 'c';
+	n[5] = 0;
+	n[6] = 0;
+	n[7] = 0;
+	n[8] = 0;
+	trace(n);
+	exit(0);
+}
diff --git a/test/unittest/actions/trace/tst.array-char-str-multi-nul.r b/test/unittest/actions/trace/tst.array-char-str-multi-nul.r
new file mode 100644
index 00000000..1951ae69
--- /dev/null
+++ b/test/unittest/actions/trace/tst.array-char-str-multi-nul.r
@@ -0,0 +1,5 @@
+                   FUNCTION:NAME
+                          :BEGIN   aAbBc                            
+
+-- @@stderr --
+dtrace: script 'test/unittest/actions/trace/tst.array-char-str-multi-nul.d' matched 1 probe
diff --git a/test/unittest/actions/trace/tst.array-char-str-no-nul.d b/test/unittest/actions/trace/tst.array-char-str-no-nul.d
new file mode 100644
index 00000000..532c3519
--- /dev/null
+++ b/test/unittest/actions/trace/tst.array-char-str-no-nul.d
@@ -0,0 +1,30 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The trace() action prints a char-aarray of printable characters
+ *	      (not terminated) correctly.
+ *
+ * SECTION: Actions and Subroutines/trace()
+ */
+
+char n[9];
+
+BEGIN
+{
+	n[0] = 'a';
+	n[1] = 'A';
+	n[2] = 'b';
+	n[3] = 'B';
+	n[4] = 'c';
+	n[5] = 'C';
+	n[6] = 'd';
+	n[7] = 'D';
+	n[8] = 'e';
+	trace(n);
+	exit(0);
+}
diff --git a/test/unittest/actions/trace/tst.array-char-str-no-nul.r b/test/unittest/actions/trace/tst.array-char-str-no-nul.r
new file mode 100644
index 00000000..3d56e520
--- /dev/null
+++ b/test/unittest/actions/trace/tst.array-char-str-no-nul.r
@@ -0,0 +1,5 @@
+                   FUNCTION:NAME
+                          :BEGIN   aAbBcCdDe                        
+
+-- @@stderr --
+dtrace: script 'test/unittest/actions/trace/tst.array-char-str-no-nul.d' matched 1 probe
diff --git a/test/unittest/actions/trace/tst.array-char-str.d b/test/unittest/actions/trace/tst.array-char-str.d
new file mode 100644
index 00000000..70f6371f
--- /dev/null
+++ b/test/unittest/actions/trace/tst.array-char-str.d
@@ -0,0 +1,30 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The trace() action prints a char-array of printable characters
+ *	      (terminated) correctly.
+ *
+ * SECTION: Actions and Subroutines/trace()
+ */
+
+char n[9];
+
+BEGIN
+{
+	n[0] = 'a';
+	n[1] = 'A';
+	n[2] = 'b';
+	n[3] = 'B';
+	n[4] = 'c';
+	n[5] = 'C';
+	n[6] = 'd';
+	n[7] = 'D';
+	n[8] = '\0';
+	trace(n);
+	exit(0);
+}
diff --git a/test/unittest/actions/trace/tst.array-char-str.r b/test/unittest/actions/trace/tst.array-char-str.r
new file mode 100644
index 00000000..9778ddd2
--- /dev/null
+++ b/test/unittest/actions/trace/tst.array-char-str.r
@@ -0,0 +1,5 @@
+                   FUNCTION:NAME
+                          :BEGIN   aAbBcCdD                         
+
+-- @@stderr --
+dtrace: script 'test/unittest/actions/trace/tst.array-char-str.d' matched 1 probe
diff --git a/test/unittest/actions/trace/tst.array-char-unprintable.d b/test/unittest/actions/trace/tst.array-char-unprintable.d
new file mode 100644
index 00000000..d88df369
--- /dev/null
+++ b/test/unittest/actions/trace/tst.array-char-unprintable.d
@@ -0,0 +1,30 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The trace() action prints a char-array with a non-printable
+ *	      character correctly.
+ *
+ * SECTION: Actions and Subroutines/trace()
+ */
+
+char n[9];
+
+BEGIN
+{
+	n[0] = 'a';
+	n[1] = 'A';
+	n[2] = 'b';
+	n[3] = 'B';
+	n[4] = 'c';
+	n[5] = 5;
+	n[6] = 'd';
+	n[7] = 'D';
+	n[8] = '\0';
+	trace(n);
+	exit(0);
+}
diff --git a/test/unittest/actions/trace/tst.array-char-unprintable.r b/test/unittest/actions/trace/tst.array-char-unprintable.r
new file mode 100644
index 00000000..1f84fcfa
--- /dev/null
+++ b/test/unittest/actions/trace/tst.array-char-unprintable.r
@@ -0,0 +1,8 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
+         0: 61 41 62 42 63 05 64 44 00                       aAbBc.dD.
+
+
+-- @@stderr --
+dtrace: script 'test/unittest/actions/trace/tst.array-char-unprintable.d' matched 1 probe
diff --git a/test/unittest/actions/trace/tst.array.d b/test/unittest/actions/trace/tst.array.d
index 104d42e1..0779d90f 100644
--- a/test/unittest/actions/trace/tst.array.d
+++ b/test/unittest/actions/trace/tst.array.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -11,8 +11,15 @@
  * SECTION: Actions and Subroutines/trace()
  */
 
+short n[5];
+
 BEGIN
 {
-	trace(curthread->comm);
+	n[0] = 0x1234;
+	n[1] = 0x5678;
+	n[2] = 0x0000;
+	n[3] = 0x8765;
+	n[4] = 0x4321;
+	trace(n);
 	exit(0);
 }
diff --git a/test/unittest/actions/trace/tst.array.r b/test/unittest/actions/trace/tst.array.r
index fbb674b6..52ff28ec 100644
--- a/test/unittest/actions/trace/tst.array.r
+++ b/test/unittest/actions/trace/tst.array.r
@@ -1,7 +1,7 @@
                    FUNCTION:NAME
                           :BEGIN 
              0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
-         0: 64 74 72 61 63 65 00 00 00 00 00 00 00 00 00 00  dtrace..........
+         0: 34 12 78 56 00 00 65 87 21 43                    4.xV..e.!C
 
 
 -- @@stderr --
diff --git a/test/unittest/actions/trace/tst.array.r.p b/test/unittest/actions/trace/tst.array.r.p
deleted file mode 100755
index b8cc8daf..00000000
--- a/test/unittest/actions/trace/tst.array.r.p
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/usr/bin/gawk -f
-
-# Some Linux kernel versions leave garbage at the end of the string.
-{ sub(/( [0-9A-F]{2}){9}  /, " 00 00 00 00 00 00 00 00 00  "); }
-{ sub(/  dtrace\..{9}/, "  dtrace.........."); }
-{ print; }
-- 
2.45.2


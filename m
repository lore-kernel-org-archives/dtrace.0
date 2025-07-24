Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3871E7C23
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 21:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753390836; cv=fail; b=JMoqR3yM8pJ5ufxN1iqXHzz3b3t5eE6RUEFoSzA65HlLqVidjtC5//ylXf6/6GaiZTPJQbyOg4ng5jjycDYKhE0E452mLndMtyXoEnX3Atg6NgB5GXuyiyIAkuBF56re2FQVMhPByA8r55iYk6qG4y3SjFus9/ZFxlcdeyNMuW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753390836; c=relaxed/simple;
	bh=ybSkBBGkk21AoYdoLMgAgLsq7MZX2GoCXtGK8QDHg6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oNexBAwDnG5nPB0XxN93T8kZ8n3TtMyqsnEMkEwqs/yochKPkJvRjinGNP40d5vA4pEXdBFaDb6A9NyyGqurp+7OTKHCpYn2fp+xtadQbL9X0l5ex3ztOAkWfMN1l7P3S1eEfHc/3eShU3GftnTDonyHn1Y9C2+c/kwNjyfUXrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IVGj8EFK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EtpDWi62; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IVGj8EFK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EtpDWi62"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OJg3TD017411
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 21:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=7aKIc733Zl+gwW+GtA
	RxFmo2tdvHhfrloX+C+ZHLyk0=; b=IVGj8EFKwG9L0wpMv1hcNVq+C64VcHmpzO
	a+V2KVAjssS5R9/8KhCqIVR53wX3jqCk8X9iS1IDvFFK3GUb3yCbt8DOg1whIUTZ
	ey1hIJqnR5fx5wY6an+eerrLbpvhpQknv5v9YzuyIuE9+csDdpYXUWtlADl75GNI
	I1UImtPVDzloZ9QZbSLbtuAs0Oh+qifFBBh0aVHQ2Wai5A5DKDQM2cp0zA/mmjjA
	tv76sXE/iiKtD0uZk4zk+qIvmSlMHqngYgJVIE85dLrCjF3SfrlpKrM1C6HUD88F
	8B+7NXsCNBooqHXNqGHaWwDQ1ZLae9Xp5E3xskyj+XBCxQzRPGLw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48056ejbr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 21:00:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OKuPnE037743
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 21:00:32 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tccn6t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 21:00:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVXcujUUAY6HY0FddVYer9SSG96tW/uUupkMXj1XXixwzIKg3WvSqNjVy7lbwUqdPqyTNb68J1mNLcpv7vwBV7oigfyP8eAnP0vi/X2MnBkBIsh5S85Mg/vNehTVLL3IHuMDcrBBykj7zbMR3dxyU5BwZuqW6/vazUZYLA6SY9ILM10F6eS7ueEkVtplK0nDVWJI69Bu1zCKaK+bLaOMIkriM4Avg9eUjQYtEe6tF+9w2dhmLyzawuoK/f6PlKxXfyXAi0iIcNuUOu908XyRGp6aieCbLNNr6am9bQbMGsqhyKvwQfjTuAqTYsUGOjlt1EV5QmgB8DAzkCQqKENIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aKIc733Zl+gwW+GtARxFmo2tdvHhfrloX+C+ZHLyk0=;
 b=rzKz2TfxvvCnk+Egcj2fVufjnsa6uUY3g1dooTOpFnlel4QUWDVpUyTqLttWPlDCWEPmyCiMx0tf17EzLp01JJLuDoEFo9sdb1jwxNuAOaeT0K0P/iZnpXOauGtHY71N2DlDvxGlYl/oVH36DCkHNaErTA2mXDAzZhJUq2wIIPAkN7c3b8h4aTJSfFxml1uRg5MaHr5k+3lT5htAUDNaPnt7aLrSMmRJbUQMNo4hiyt7hjZ75Mbn04oLQb+Rm2Ineqt0KdqeL0bpPVGcBdXT1KAdd/Y2nHLutCizBO9tAuSMWJ6BiMTqMMVrJR0oI+5M+yvoLz7apoIWtWpVvcerMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aKIc733Zl+gwW+GtARxFmo2tdvHhfrloX+C+ZHLyk0=;
 b=EtpDWi62H0Sswbjs8hyT7dOFw5jMDPnSBpuSx6vW1f5eWpGgSY9MyzgdiubkBHKN+I9+x+nyXHMEAcZmxrg8e42r4Uo+85PyieOSOtwiQ6/f6nJqCH1CDQNL+YeyzSDUv9NEmmlvf2dBkJi7UmvyYydm6uIJ4N4kBRPOuADQML8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA2PR10MB4668.namprd10.prod.outlook.com (2603:10b6:806:117::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 21:00:30 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Thu, 24 Jul 2025
 21:00:30 +0000
Date: Thu, 24 Jul 2025 17:00:27 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        DTrace development list <dtrace-devel@oss.oracle.com>,
        DTrace dev list <dtrace@lists.linux.dev>
Subject: Re: Test that PASSes but should not
Message-ID: <aIKe6xg/Y0ElXnTO@oracle.com>
References: <aIJsb0P4H6S+tO0k@oracle.com>
 <a7197497-1d4a-f68b-f62e-5819e94515f3@oracle.com>
 <aIJ8mKI0nSZviJnc@oracle.com>
 <aIKCFoylntgaO6Gu@oracle.com>
 <d682398d-d1fe-a788-d8d4-3b9fbc4ea260@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d682398d-d1fe-a788-d8d4-3b9fbc4ea260@oracle.com>
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA2PR10MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: c30c17c9-79ea-420a-60c4-08ddcaf51f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L8zOH2CRPRpKkoIQ73gHNix+Qtg0YMzY8WDE6RX6aFourw4IuG89beQ6Jx0b?=
 =?us-ascii?Q?3Zeh9u+6z97JNWSMK5ehS7SCw+F7GmRlhCcMpF5P4a6bqtSgG7N8TNyFGiWI?=
 =?us-ascii?Q?+VX/REmPD+fEnRr3OjonlnfYjentNDZI85QPOWrMdhiqZt0E6GiH4JjT6r7w?=
 =?us-ascii?Q?r2cxryGhl40ZemY3ejC9wQpDJEdKr3HwHuYGJFq4iQMMaUMTcO5A1U5DZxd/?=
 =?us-ascii?Q?PsQlj+Bewxbt8XRhAaUY2UFntD+RHefe5W34/P0N9a/vp6dvR9ItZr+8MP5R?=
 =?us-ascii?Q?1yhQfStC4ypfuHBhajjykWHZ52CUa2/2JMHPghUWx9d4BYhXRBm/PcHV9F5c?=
 =?us-ascii?Q?fmSAl1x/IbzUrGcPmIWjaVu5STp/cUJ5SIXlbls1TGwKuMlt7Vd806rD8lan?=
 =?us-ascii?Q?oxZVosuVQ248IjoEAq7ruOIaoF9irqBwtPlhBsPb8Nh5Een+nVC3H3ZqMZHh?=
 =?us-ascii?Q?9PNDPAipWFs8XKWnbZ+pXr4gaBy052tSmfnWJIcaisvIQ2wBq3nDMJQHY1N0?=
 =?us-ascii?Q?5GtP/GosIMQnroDXzkhnrYEIV2mcI1IXeVBSiYerlNzSDXi893o/Dh8s8LKX?=
 =?us-ascii?Q?+cWv6gE4urCxi6bki/wlb5oOUGtpOq64HBlqvY99VEv4db9mVtZ5n5LKFOm3?=
 =?us-ascii?Q?ABo0XOfJD/MDAppGPSYS6Ukc/VcVg5DweAhPMqFK2MkggBi8k0mXlmkbhE+k?=
 =?us-ascii?Q?bwER+R+StDq5CTyI125VTgmmwlTGsXPKhb34cDPcLOHX62/cKioIJ5xT4A6Z?=
 =?us-ascii?Q?NT0HZtPWRl5V7mlvHKbqfGZr5lZ8rGwGRjBvyZi2ntLDSdO985i3BhHG9wx2?=
 =?us-ascii?Q?Eb1z9LMXYUjZoHWMnHVEZlzwQFDOz/cExa6CNq0aq7IiR4uzWdeRiWeXB9+z?=
 =?us-ascii?Q?LW2ZShRVCf2r8oEhzWDSlX/mZpYG+SynynRpYUhPgWJRfBCTo+6WB07Qzwfa?=
 =?us-ascii?Q?Qz7IBcqNVm3OxigGHhCxiqhykZpYFmadt38dGi7pNOy0Tnb/RMOmVcsXhRWo?=
 =?us-ascii?Q?k5vhNjYO7mKFdf6jiZ9SZBp32+4EyxT8cukzG/8A/az5iJD5Ug21oVOTY+o9?=
 =?us-ascii?Q?IQCURElfhuA3KbH1gONpbMYrgGiKTU3bN2tghvUVdhATUdeTzFNgVM/Yj0I+?=
 =?us-ascii?Q?lSodx76mLTm1cGEQwzXy2Rov9KO2E58w7B7453jAbilJm8OkBW+itUlrEDcD?=
 =?us-ascii?Q?IEIxQ4nsYM9B3fYk20jaxe23whhAUvQJeOE5scut0iADZEMMwcecD/zFlouu?=
 =?us-ascii?Q?OxFr8nnGckh7TVTsNRxJ5bpgM5nfe8Y8ATquKZMcyHAx15oQBJcahFzdLBP2?=
 =?us-ascii?Q?/s8Wat3VJGbfO19i1O8rqficKY6+B4TzLt+0fP+CuHjX6hvVpWECJKNAdy11?=
 =?us-ascii?Q?M0AsXtMqSCjYdn8XApmbHo0WY/TRwXP5HjNJLwaTQLBkjhQCnVLq7BgCM3JP?=
 =?us-ascii?Q?xLUaipv+gN0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UZrgErjNX6tnuf2vTrcuZZMa5LvvyGpbx/A08k/pFswPskXLvWAnBuIoDnhb?=
 =?us-ascii?Q?CNUd+yafdAu/HvKsa+18yWgcRBNepR45k2QJ1Z1OOZmdxlkETtYycLDtVcWQ?=
 =?us-ascii?Q?X8RvxiFDEBtgU9H2XOIRAiOnb1pB1mKs5DX5DDMT6CDD900bHQuMussrp384?=
 =?us-ascii?Q?khpKAFIQyskpmEfuaTs1+LkacsW2+K6xDemZwqisDDwinsAIA931OL/giJEO?=
 =?us-ascii?Q?3BXHS4ZMc5kvKgo9SnyEyk2L9kXRMGPFm01R8yQjaf4TUfkAmVmRJDOFNv/W?=
 =?us-ascii?Q?EJSOMKS3qfhuyfQEh/FknfVpX3QoHhmRqOjirXn2dQaHY8smr2Q6cTzH/Ext?=
 =?us-ascii?Q?jiM0MClbgbwIlOKWjEWyMvsE85jigkCAHb+hUF7JHZPeThsmG/JSTPINvI2Y?=
 =?us-ascii?Q?p4VUIiY3c5sDkKyKz5eC1Tri/14ZrCZVRi0XKWxamHEQrNeDnhiFa4xch0YL?=
 =?us-ascii?Q?NoyTdYEGt3nWhRyWIJjtF+SAhgNAIbAEUpr+qlsw2TFwUfNqZep/1zkYVZZF?=
 =?us-ascii?Q?Dha419W9JtEQcqgRZBIFVThY+JSzXRZ0T02725Ut1DZkprs53vAnQm/zwRef?=
 =?us-ascii?Q?Pj7KAhwerl/x4cAbUCcAiE4L9wJ23Hf6L3S9zZxk628x9XgfjpGJYFeXaQYU?=
 =?us-ascii?Q?FYtWPOlVO8VVQM7+zGsUWyshqvVTLvr/9OMMIw8bNKiaaO7dMRSyvXei/GDp?=
 =?us-ascii?Q?OGvTQCYzqG8w1egc1pU6HTuc8JD/cW50hkndn/OCmSiiv0lv5AN5I3AmTe8/?=
 =?us-ascii?Q?H2gfr//fTOJPPC1YInV4QmiG9JbZvL7iji9HpLvFK1j0BewYP+thXWPxlS+3?=
 =?us-ascii?Q?IQZZxni8NEszpKVBiK7LqCGpIIxbUFxSHfVfsuX929hobe0Bp5dDvOUh53v0?=
 =?us-ascii?Q?5SrVL9Tji8ODKMxhYCqcOWFzzcb1luA+/Hot13JURNBANKVg71CN2P5MymOT?=
 =?us-ascii?Q?Og5zcz8D+BhHdOdI85tYYVIKm9yPPxOyoYclMKiPnIvDsfRRdoHY61ToaxDO?=
 =?us-ascii?Q?TRhVPDOZYD1oomuW1pfEHxpIYot8AUYtnIA4OmN7VlBMMhgDqNQzdP0K1srs?=
 =?us-ascii?Q?AKVQ83Vc3Kunwp6n30hy0rRZZGs+GDLuk5CIML+Y3DgQcwwq/OdAu0WmtA8P?=
 =?us-ascii?Q?N277vS0xo04S2UCMVx9XFoIlHMCq5xSvP5mNL2KFcTSEtOu8incV1nufuoBy?=
 =?us-ascii?Q?FrPmVJWr6PB9NrPHj77aqJd/YuGyiy61kI+XL8rkRV6NpqUGd7Ezp7DMY3qN?=
 =?us-ascii?Q?fDOWigW8L7bDY3v33yKsGMzyujba/M2aJes4JitH+HM8ibHz/yoNKIyGJssT?=
 =?us-ascii?Q?YSJ6m9k1TTl8RW1DVcdtlyum0xQNiwoWzqCR5fEwSON4kUCDKBLCTCo48w1i?=
 =?us-ascii?Q?ZoN+DUihRRnnDTjia/cOIGsLmxYRmswFB8fpSmsrZB5JiZwksGq6VuHvWiQs?=
 =?us-ascii?Q?s/ZooS1O1mL9G515XdD60NqSwnJMQDi2wKF1No1wcq5JuCNX//RC2y8K+KEg?=
 =?us-ascii?Q?FEks1lR/ETeutG1Da1KhosCPgBcLRRqDcBLURk2YmShtc6L826qGJMp70+Sp?=
 =?us-ascii?Q?WJx3yZVlXNePgx27YR/RlK2OsQraL3yNCvS5OjLcZqbtXLrQXJGiM9aYFOVZ?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xQaX3AVuTGnf7yDs8AapdW6LKpU260bOz3oyf7r9MVmI30hEiS9bWi5YAWUsrLSH5E/NAhI3hFz0ivELfGfM2+qbUGuoVy5OG0kbaa4nEsXpuvIdFtKviFxXIXdSE1UI4jSX9fxShzMSWr+LBu9+/3OJLN8M3jW96zQRlyPy8HNkIyFDbReooKF3rweG7XjlhPGoWjn8uMloazrbmKBcUydIZE/IR2UHfwoO7HU/B9NNGQ2MxAD5Mp+6yBDvSUSUNQlwlpcq+vkgpYI01seUfLLWbxqtuGsus3cagVRzCfSVUvr3bxFFLemQOVXHFab0rO3vf3nV7EPUjrzOUL/Lv8MuK307U5mgBFcfJayfmk2N+QIhQKx+VxMu67+ChKLI9etdD6EofhbBYgzQ3hkRjewe4S4qT0jzhI0ZCRnjlUPq3khuJ1QbAYDLvYsKDxnQN0pN+zXhywdVs6qjJCTzw8V42HAaFhEwP/RYxag5IVGNMDe2+EBOrpDPxDakyZzm5IyuPs7iCXG6ORKFvp58FyeepQ1xNXSxNRidkI8+xRWxSQNC65nJMIu6sekeBuBm6Z4Qb2A/1bL1O/H7ah4eYGPlJURH6TqP2kB1Vq2rFJA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30c17c9-79ea-420a-60c4-08ddcaf51f9c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 21:00:30.3998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yr+gcI3YPVmj/aDUAa5FTMD5LoMZPb500HhvPzYGs+wM67iBNVrHYAslxl0J1aEpXzfZZDLktx458OhUyjqVIpcgXiPsp2LYl2L0csob5y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4668
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507240163
X-Proofpoint-ORIG-GUID: SJgnvdxrO5YFsEv8I2zferO9xV6YXHir
X-Proofpoint-GUID: SJgnvdxrO5YFsEv8I2zferO9xV6YXHir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE2MyBTYWx0ZWRfX/fOYQh0mXMvB
 3lG3cRfjQ7H2My+h1KcUjAHj2ZVwi86tv8P+H0zqVLjmElVIMfvgZyhIbYMcGvSQnVECgoj/Itn
 JzX55POhV9rgtFWokIvgGYduWx/P5dB3vidZZHaXRxoAmdHmAqtUwumq+FAmSIpgzYh5zfzPQCQ
 cOtbipg4AKsQILPaQcw0bSJkCOWJJwQWxsWj8yEsfh92lCs1H/CTt/rgSzylQW2c2fuXdEIRsr1
 WKkiR1v6sJ6YvnqavFA+hrqxISEkiatt82XvJnP8iFL23D5s2J7NMO01xwWHRsCkl2JHBJRknUS
 UyhQLuEH9nbmFFU1ubtPqC2opB5kmALq5JMLa5gwJnXw9zDug1aIafyDatioaCpFwJDGQFsiFyC
 nFg2EqJOSh6qMa26lHhJEMvZ1hZqRHdJNgNmcDzye0UOahktUQKr7wygPrjcixVH7eFXGHNx
X-Authority-Analysis: v=2.4 cv=Ef3IQOmC c=1 sm=1 tr=0 ts=68829ef2 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=RIfE607uf0eyQVVl0pcA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12062

On Thu, Jul 24, 2025 at 04:54:19PM -0400, Eugene Loh wrote:
> On 7/24/25 14:57, Kris Van Hees wrote:
> 
> > On Thu, Jul 24, 2025 at 02:34:00PM -0400, Kris Van Hees wrote:
> > > On Thu, Jul 24, 2025 at 02:21:36PM -0400, Eugene Loh wrote:
> > > > And yet it has a .r file?
> > > Yes, the problem is less with the test and more with something going wrong with
> > > BTF handling causing the probe to not have a BTF ID and yet it is trying to
> > > load a program for it.  Attachment should not even be tried in that case.
> > > 
> > > Working out what is wrong and fixing.
> > Patch posted.  Was an issue with the BTF ID lookup code handling modules
> > whose BTF data didn't get initialized yet.
> 
> But how could it dump all that stuff and pass matching against a .r file?

No idea - my priority right now was fixing the issue that caused the BPF
verifier error report.  We can look at why it was deemed to PASS even with
that BPF verifer complaint - that is secondary.

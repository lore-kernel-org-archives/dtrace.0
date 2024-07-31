Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C7F148FF3
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722455739; cv=fail; b=hnN/k2RD6nsPFtVXIpogrimfY7siadPrbcjAKofWGrr4/ozcEDMGG3TSoICLXWcEgUISS8FdsPO0WNEKyhlt1B7DmgENNKmNFyVhO/b9Gb5exEHiUUrD6Uuqhrv28h5W/knKcUqAa//11/muuiqX3MFbNGFbEoURQx4QjQN5ViY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722455739; c=relaxed/simple;
	bh=uFTwhrlK80OopYTxZlz+nzBbPD6hGLvaTiEFiLXnAq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W62e4fLDIkduWcAR5tVNXdpZap05HFThuZa47Zmpp27FkfaoqqLVOfDFKaZuRUbOF6Wirjrx+Tbm7f2YEuksQPhIKknWB4QNQnyv+pq+RlZ200lAIbzKVbZN/smLcmQUX7vWP36HKHj2KaouKaHaIKw8dj//WLKduKuLsX1S3gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TkOW7Zw2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aCaUirpv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TkOW7Zw2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aCaUirpv"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHtSqj007205
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=roPOHg5X6RJDVUs
	gnslmHG1JQt8E35h+ggAkS9+7lTE=; b=TkOW7Zw281/GB0wpywkoNN6IUkG196i
	dyYvDGjE0q60NO5Ppg3NfLZZgPI9rSMCSKs+XGaT4XnPdKrH/gTyXAWyBRHKdqhP
	23uEAuUK297HB+JZtZcPGT9qpk/xCKXCubrGbvFFrTzAt/gXnXB4LWqdwk4BJd3S
	rVT6IrqHdSm1/E1JJQxLT5TSNXEM2tBqMpVYvT8yNc3SUc/JrtV6jgzoAT80b7o6
	lJqqXd5osB7a6QgoUYuV2yZIcf2wgEC+VszoPGCFgwy4E6Gm+WAm6PvgYHtGE8lv
	++PhzEJStUdxhaorI/qizp3nrC9eYb3893KCg6R+rPKotMziPe2BsDQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrxc0cdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:55:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VJUZpO000719
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:55:35 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40pm852dqy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:55:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HriTC+lkEpD4NeYhZhHrBTaYjULaPGGod1GopL1WQdlxJPqM27apAPlERZ87Jgw7GWtq6X+3I4W0m1Qev4CfMoq335jMBVKzT/L/chjxX6YMePhk5HT/++z5eTTJOc6Ddpy1sa43WSPAQYiZjakrn2sFnVoR4koF3pXWOO1sa/F+3FtCViJmJnPRMg5GUZtp4i2/h+5qvAnBKP7z046Omfo8dioedTrriBgylXSsXrIyMZfB5eD8StAq7XkjZpTe3SUYSwvUQ80d3rk9hJaw5GNQSMbQvOXg22Z6QvgFbqY7z4wwuvYy0bVfLE9usxbMLA3SYJGKjAiyyiM8Z90+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roPOHg5X6RJDVUsgnslmHG1JQt8E35h+ggAkS9+7lTE=;
 b=fiuwokuvKWBCfMJH6Dj9z3G11YCKlAvqb2z4YAde6Y8wCp7FFEXm5a51xhC9ZTooLQX6KUOm9l4IXy4TPARqacYnpIBNzDc9py7yn579x4XofK/hYO9+pk+5SlLSXTmMoJ8f/ydLuIPHrCXm4heoCw1hwCuuBgKbchlE+H7n5327ClQVGTKNkpkOiLWRPzLTQ6JTUlXyalPiP8XjMvmVpLExyFOxim7FehLS5YXC6rCHOx1isUMl9cqC9amc8Q4NM1YxO0Vwd7Bxl0QB7d8ei7PHac7wktrkvswacd6ur662znFcpxb82PuL+lJDy+mmglq0fUcVQhhXT+93vZdLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roPOHg5X6RJDVUsgnslmHG1JQt8E35h+ggAkS9+7lTE=;
 b=aCaUirpv076QI43TeAV7fqI2tUFKrjKtuK0VnIsm55onShSX5I5oMEQED5egE9WqVlvVlnbR/4lmwxsFmrrncMjbBdBrjylCdWoKuzZQlLleVuO4IjieL6IaXAcX+Ns8y06EDb8+bQco9KmnEaolTvLcLPIaJVyApExamEh3W7Y=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS7PR10MB7277.namprd10.prod.outlook.com (2603:10b6:8:d8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.21; Wed, 31 Jul 2024 19:55:32 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 19:55:32 +0000
Date: Wed, 31 Jul 2024 15:55:28 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: skip tst.symbols.c if no /proc/kallmodsyms
Message-ID: <ZqqWsKcXMZ77kwcY@oracle.com>
References: <SN7PR10MB6287B34CE377B4B80C34B2BEC2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
 <2612a5e1-eba9-d6dc-023e-3f505e797985@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2612a5e1-eba9-d6dc-023e-3f505e797985@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::11) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS7PR10MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a4bce5-340e-4f40-0068-08dcb19abc4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jCrY1b2d8QnmHGEDeEMy35yeQyLmX3UWuneV2pZvgSPxSJm0md5kKJZlMT5P?=
 =?us-ascii?Q?jSmb/xiovhHUr8dMCvSuSc+tYEZYgl8TESHhJBXmeJrjHmCNrD8qnDx2f+wC?=
 =?us-ascii?Q?DshScv9VE5H7BsqZpJyENQZirBLA+WOM+wUG15GK0kgR0FVQurmR1G+uFXaw?=
 =?us-ascii?Q?619RQMCWz98uXSj3vwcvJ0kUB7G2KuiW5VffGTjN75FSyWr0l9Vld6UmUXsA?=
 =?us-ascii?Q?iJ9R1AGIahRgVaEySpZENFO6LQOojzIL+PurAAyQ+ZUgED/sT67TeUCm3rQd?=
 =?us-ascii?Q?YcW1nl1MKv+juhOk6c/ykVbtTnrvT1cjj49SjEryn3pwQCsSKe4MUTkVteUn?=
 =?us-ascii?Q?cRe7F06RhNOVGdiQTQz7exTbhNVQPmph2dvzYxHNUzUfqi9SaLOnO3R6sECM?=
 =?us-ascii?Q?EzUVCneZ3GO7Y4sv0+UTmnFs2jTv6hB7zqEN79KUYi3FVM0pOlt2CGnba6qw?=
 =?us-ascii?Q?xADlQ5WRUFJHSsFINlsUHqieU5AtgASS+srkHgCuiAvr2PeW4ECPF2c0ES05?=
 =?us-ascii?Q?1jVZxCgcWQveaANDQUb73RrDsHM99ZyiqFhO0cmrnHAy8oVY+GbIj/R37w54?=
 =?us-ascii?Q?Ge7P9yHoU/5Os2kiGX6IbJUQps0y1fxaX0YqaR6wKnP/PYi3Uvz1TTSOuFAu?=
 =?us-ascii?Q?3uYNaEtDWhyJ4Fuk+wNMfUqJZnd3igHp0LSrinD/lUNqVx7FE/a+XSLcu3X5?=
 =?us-ascii?Q?RPTmIb3SyOdhTFVgeI5n9Qt0ZG5V5IiVmv0Pg2KojFADbAL9nQvybE2uFZJq?=
 =?us-ascii?Q?0FplLv0RvC9gFDVek8LpNwvm5eqildbonxH+Z175EUu8Hx6sVEa+/MGCaFqc?=
 =?us-ascii?Q?hT6o0KuQihV3ny2h+mSenHwYqbl41OU0hwl6mtNZ9O2WAxAydMvFr27utmED?=
 =?us-ascii?Q?54fupkXW7qgUBN/1ylcsorknF10QvqKXBF7plHBAzExyeZqBdYyCwMDUBb4A?=
 =?us-ascii?Q?X4JYUqeVPu0rCkd6CtvWt08Hg0prgl09WZ5YxlZu0En/7HGDLmgDTvNcz8/6?=
 =?us-ascii?Q?trGelJpmbGhPFgEDVcMKhzD2FpE/NWFb3JroNUojoN5B0mf4vreABGU2miwD?=
 =?us-ascii?Q?3z11IHuZT5m/gaDtU6QUX0EVhn1ynp4K98rIMIRdWIWXcLrj1RX4s9/FUgVE?=
 =?us-ascii?Q?kdKM+1h2jLBwjUbFgLMt7SvAAL3ko+G/jyMrLqhXXLv8cNEqcnCrwh4HoGT5?=
 =?us-ascii?Q?t9Ntcl3xmPCpWNJHjDEORBY8gTrzeKT/yPSoK6cQzsqvyDhWn5Z8eumdpsjN?=
 =?us-ascii?Q?DJi4LgUmr0Q96MQOadv2Tag+HjuifspqGsy5kUAnGMSHN77mCGqVWK36i3Pi?=
 =?us-ascii?Q?pG+nZCDcus+LgyZFtRr8xAjqzstCnxxhs3Wb9WVXUkS4n/1K7f6t5A7FN4+d?=
 =?us-ascii?Q?/7q9xp8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dUTH3EVDQswdzPF4TrRa8ZMnrCXUlHIndJmDBZJu0aOxC1LSnMyzmTb4rXtX?=
 =?us-ascii?Q?H00n2EGjHdiEVlodHD+EimaDuacJqiuYIKlunPyxzaVYDLQ/ZTAEZKAaxrLB?=
 =?us-ascii?Q?cYdJU0W5LfOorEhlaeR663TIOLZqO7Ejz9yUsnFMPNQ+4l63L9I7QqoCEPUr?=
 =?us-ascii?Q?RN9HwLhVDIPwH4Jz7hFkO6CFuSOFe61V7Ix3NXCjOW8AxQ+FJtDqpVDsqWWK?=
 =?us-ascii?Q?9wGHrTmBNjkg8N3oTICW4IUsP1pm6r8aMci9uRV2nbXF8BvQD6c6CKbPyyIw?=
 =?us-ascii?Q?4yIPZROgnvyALubX+zUlxAM+yy/cIM0PoUBC/jfgUJEghZ1ArzZHcup3Lk+o?=
 =?us-ascii?Q?K9G8pd092mGJC7/ckBX07fTAbTWEKjCXXLE9whuwuyisIKwLMT+26/dav97y?=
 =?us-ascii?Q?TqsEX4JP+lSHIIDvjIjEta0zMpzcAUjh2mAsMLr32UecmezOl9nFR8WpqO1L?=
 =?us-ascii?Q?4l5x4se0+gnZz6Zg0+BHLfwwjxABv2PSmk0w4QPiI7Osv+CZLk4NQxJ31VtR?=
 =?us-ascii?Q?uqxQVd43DWkF7ycF6TwfSvh5WaL3NGdR22gKm09LCA3PZQeI9dL9BDuwPk6q?=
 =?us-ascii?Q?vPOH1tZZCvgkND3Rf+cZmYoQ7hgF4eC5Mk6+tkgO3As7wr3navIsbQr96PXd?=
 =?us-ascii?Q?r10zy+k/lZY3P3Opw6MWpuIu445eieas7mvVtKbOBupQ3iP3yGzxItpGM9zq?=
 =?us-ascii?Q?Y7lry5f/0KnEi8AUEJMhz+qf3b1G0dw/suJuuyVQfvWYU0H/HVTSW9i+sSrh?=
 =?us-ascii?Q?+3Bzr1Q2y9hXZa2jzhnAPUoNnt0JAwhRl2WjvCQtE27IowBEjuGZ8T1V6Boi?=
 =?us-ascii?Q?taCx0d2ejU9hBnE9LVvOirdfZqQjsPkMk8Td6g33Ud2WeN5R9jdHPBLC+oQD?=
 =?us-ascii?Q?RQETiYRDMsUlH1bujg1fDSrMYvtt9e1qhNYlgyQ+rdDM2Yl4SmHWo+cOi0CT?=
 =?us-ascii?Q?tMr2Bvi4psvbJ7m4xV0f/LVDaJAVP/5VPdejFwGoJQwhsO+8JrXE+co50jD/?=
 =?us-ascii?Q?2YYkaRDP3MQlcY/7PBms/cp4A6tUOLCeXOMHiBMD25dfy2ZnD4VGNr5rpYnU?=
 =?us-ascii?Q?9CLw+pxvTjufn8YYE4jPGv16UdQp2++Vo4q8h+srM+9u6RkDm+FsSHqRvIAG?=
 =?us-ascii?Q?ybK1yjHcgwmWi/ZAEGMkQugL+NdeWBXLc0bhkFiBPcQJM8AV1MvNC1xI6ngn?=
 =?us-ascii?Q?SZQCrR8t8/ySzfmO0aL0Bfa7gmJPmQZiH4N87nJZ7O9kAcKdslv3ltVzuZhE?=
 =?us-ascii?Q?NkPN3eiEzh3QZPWNk3/3xhBzOgknTAAAWANx/tE/GS8OBmKfHOOBDowl149d?=
 =?us-ascii?Q?qCbs7rmDVyPXNM/rzxrH+NwBIgENtNBzBFACZhVkVyAZVL3nT0PoZFKi4kny?=
 =?us-ascii?Q?T1K50BMF3kUN3Uf9vW7z1IFQifTjsjakyREJCKz9Y1ZB77C1A5Hey2wu4MB7?=
 =?us-ascii?Q?7ZDim0gO7AmlMzKi5oM9fN/RVh4sXRhJHr+s9m4dIAGwCQ2K7B73Fj9AYEzn?=
 =?us-ascii?Q?nyxpjHvlgooGsYapelhDRfHcJyc4x3gVir+YtTSSIiiCdmo0qRh6gHnLT2Ai?=
 =?us-ascii?Q?zdJGK96Q/4Ei0px2znA7jbq0nTXNz10VeMS9PQK5aks5DLKtRZ8yHkpuk+QH?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kNcZvXGxnzIGyVBbissboNiScFLYtxm78HFR1pIQNGZiyMeOoUyf0geN0blkGVtPuTVYmIIN8+6ZJuhReQTwcburgRUN/KQx1xLaRHZNbQUJUQGrH2RXm18mC5xa5TdHgo2kVKcrMsY72P+Io3Q7TtxDIS0PahK3jj4uw7lKpswEle+U22d6X4hPzvDyIoTuXFqYXq0zbU5VtyIipEYV7udF9HhtB+vw0qVZlVJqOJDx71kJcOxYQDjcklJbSOZRwwEFIDUTRGLM11pZ+Iqf3/m5QfRfLszs3wMGg7RtiUVwBeHxDvPa2LsrPpQ4erm3bS0bPIdzPJF+plY/db+bxBnZnPh88SAmoY7f/J2PTbalMf55Y/4hssjoSgs+HQzEYb13O6Ul2qq1NxUqqbuNJz7dd5GS9ykpcNt50rzRLYTc2AjVmQFY3IyTcX/YxpDZ6MkuZGpS9KOfbRBQ5alhtWvFG0hywokobpg/UBuJGs/r+0PO72G+Z41I1fPGq0WScY2nyzdZifDxC78l5TNiN5DkjEeYXkvO6ethc9jOPQB6p8XnNWbI/jc2zH5ouurLOGBspiSmHzjwn+8xNmBeQ4t1srJS0vuBWnXeJM1C8Fo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a4bce5-340e-4f40-0068-08dcb19abc4b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 19:55:32.2643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHHQE262A4gac88L4lr5ooBjaJooLDU7I98jV0XmMZc7TjLasSncGed+I4ch6lEc5fFqXeeU39Pwm3Kzuybq4q4shEhoxwWHTJqENnJUr94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7277
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407310140
X-Proofpoint-GUID: hMBEKqZ9zzPcVyJqdGbbyiKeZml56VRf
X-Proofpoint-ORIG-GUID: hMBEKqZ9zzPcVyJqdGbbyiKeZml56VRf

On Wed, Jul 31, 2024 at 03:36:49PM -0400, Eugene Loh wrote:
> Should we be adding a version of the test that's appropriate for
> /proc/kallsyms?

I don't think that would make sense because this test seems to validate the
kallmodsyms information against the information dtrace is able to determine.
But with kallsyms and modules.builtin.ranges, we don't really have a good
way to validate the module association because there is only one source for
it.

I guess we could implement a version of this test that merely checks that
the symbol-address association is accurate but that is possibly not even
really worth doing?  We obtain it using a straight read from the file and
adding the name and address to a list.  Validation would merely mean that
we validate that we read it correctly and stored it correctly.
> 
> On 7/31/24 15:02, Kris Van Hees wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/unittest/consumer/tst.symbols.x | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >   create mode 100755 test/unittest/consumer/tst.symbols.x
> > 
> > diff --git a/test/unittest/consumer/tst.symbols.x b/test/unittest/consumer/tst.symbols.x
> > new file mode 100755
> > index 00000000..e83d97f6
> > --- /dev/null
> > +++ b/test/unittest/consumer/tst.symbols.x
> > @@ -0,0 +1,12 @@
> > +#!/bin/bash
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +
> > +# If /proc/kallmodsyms does not exist, there is nothing to test
> > +
> > +[[ -r /proc/kallmodsyms ]] || exit 2
> > +
> > +exit 0

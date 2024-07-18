Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B4F81ADA
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721330629; cv=fail; b=PYG07dtJpbwaznj3AN/QICRwRWjP/gvs3lxe1BLMTT6/UA9i5Ns600Q0VvhxmZbXcW3iOORaEcIlzzBeaZRfxuknAf6fgqSwGxbdZL0znVHoHFMkZlclgae/OneCz8/iIgbfUIfmHcy/jhnHU2pT177LIiAgWsq5e6Okzrjgggo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721330629; c=relaxed/simple;
	bh=g7WguzYpU/CUN5IuBtUdZan5/yk0hOixD0bdR5LVKDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m78uT2gjijyRmvxmenW7KonqygjERuCjceTkxzzW8dR6YZJd+x5nMbZnLk+fYlM0fqmSSfx0fYB4cqHGiiGmxMSeoWNQei2LvFOGaA9jOyywGg/l8mI7lRP5p4xfhcdVu2byB9i7JoI9VS3cNK7xDW5L1xzDEiB/EpQgUMPXZbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Obszd/2P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Dt4x2UjT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Obszd/2P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Dt4x2UjT"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IJMYc2016624
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=wqbrTunzuNmAmLs
	bdP7OA5E5k+0X9vZHIjd+dD65ysI=; b=Obszd/2PHEcYKDAfTr9eXlcN8X1oGXf
	R/Dp+eI52yjNaUoj5CHzLmC6yVocZeaQ/8Qox1sgff8fk8x14R0IFwVkQILQsAa8
	KJrlnrehxM6wnrFXp9oaQV6FRngF6oPO7Cd33B4zzNgpf3GtuoWe0seN+gfi4Snm
	pfB/+P6KI+pY6rCuuc0B+FCVb2blz0HYkTOITNJ2qxhE0S3zF22fwYGdXi/XrKmh
	RmnnwHWRvzbaI9omxdqZ/X+3icAm/MkpaGKxXIYYGjPqcGM+lZXGxsO9Ut5tnG8B
	0hbrPmiGEB60cm/i9TZ1xwDgQZiSJ64yhbvWfchZ/fG7tHUuXVxGCSw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f8w781gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:23:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IIgUBC006848
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:23:45 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0bh8m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:23:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqwQjBO836W/47YlqhGr3+PigFh7EbhcVCGCKk5icDWMDbTqfjpaX+rkb8xuRT8SekncEhVOd+87NSVsVCoqdsTe7wn2uLHOcLlhRyE/Ke5UzlA1C3Pkwpgrn2xYSZqXTfs9axvlWPG6iSj3LTJFHaqdbQH3EJA5uxeMBrbL5w47QSa7JRtMmLggo4YwWPi0/HpgKUuw9khZ2WNg9m12yHQN2OPj+JM6tWESYzdevIbNiQPwZQ6dO3y/ZDcigYG+9Oy+txcW3M46aOzJYsw7vNNi1Qo+aRYAL85uybcsjZ4PT+b7uFsvIFO4dfT73fUUBdC1f7hripO8Xt/X6IY2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqbrTunzuNmAmLsbdP7OA5E5k+0X9vZHIjd+dD65ysI=;
 b=YyE5XlZMbuQnG9erjH88qEaz4YwkuFuILduvbhM08bKM8JYwg9RWHc+Yzo77MnNUZuIzCNjqF/ddZJvFOfmH55wtuvLVhceRBaxG/zTqTyGDU+JkJX1MMXzquLRC3newyDr5JgQuj7GV/dbkJh+6jIlI/9afpQk8UNea7cTc95QvfrvczuTJD8CYHxOLD0xGRUJq7SjIt0FoeccBfwQ1gs36VY4h/kGcjfqdo2+wDPBax11BHiXQDPukOYtCOStMvF96wQ2aq8fN2Rse80lnZwPKdANyF8B31Cos5/bdI+D0rH9Q9ieEXxgS9hjYMieUPcBK7w/0k87MDcEJlxOj/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqbrTunzuNmAmLsbdP7OA5E5k+0X9vZHIjd+dD65ysI=;
 b=Dt4x2UjT+i3DDpYNsahtWeQjBXSRiDjIhQy5YJqtvBkGnwpRjVw1w1RkiMCB07iY3HBhKDHWFF4TCooPwyIkCQH2b95HUQv3384cZXddMLIkp8S0COv7nvn6GRuJQNhmo4kUPmwj9S+svci75m4paDo+31fIH8hYd4im0RPE4ds=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB7803.namprd10.prod.outlook.com (2603:10b6:510:30d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 19:23:42 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 19:23:42 +0000
Date: Thu, 18 Jul 2024 15:23:40 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 11/38] USDT module names may contain dots; but forbid "."
 and ".." names
Message-ID: <ZplrvGStIyiZeWYH@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-12-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-12-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:408:fc::6) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f5fe20-c704-467b-2eed-08dca75f22c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W0g7n6ixkT9Q4O6LgVnNMt9/C24dIHQw5M5n6DVgk4WUGLULb3Rcnv1Zfeho?=
 =?us-ascii?Q?gUOEJOnA/eWxkAHa0pHDje9z8TUC/QoytFNKwTPaZm3EU4dxmE/EGfGQLvho?=
 =?us-ascii?Q?axHPhyv7q4q6bJ+oxZ0nkQAQPXquUVYSEiK4i+q7UMnq0rtMEvXgwnmNQSqT?=
 =?us-ascii?Q?3G+cr5fuuJk0lZ5aSGGUNi74z5RoAGL/cdNg+sL6VnCu194SpjGsdzBB9j7P?=
 =?us-ascii?Q?D1R1k8CL0Eaz2xWx4Puvw6eOhncWMZ/foADWaZtP63yagrvkYbGfXJWbkEUx?=
 =?us-ascii?Q?1GRZLBMdiabybi33Ut1f6+13VXiS3xuz8ZmlIq4EdDiBG2wUmI9dSQGXVv8u?=
 =?us-ascii?Q?3OLDSiRxu96ck5UDMXUnOyw+L4KL3WfxKELvZvRPHqmvzMiEmsP8UcycDXeN?=
 =?us-ascii?Q?XMwuYdQHf6spw1AK2YdwTq7OZpa1DpS6lA/Psv1nRk1380AvaUcdrjN2vKa2?=
 =?us-ascii?Q?KcPzuPyP6aZvxgY6QPM2r+TCJOf1oSRGFpU0yeD0j/UWPGlJTlWBUmj4J6zb?=
 =?us-ascii?Q?SZchGSdJzV8MxEBYGJtHr0K4AMkLJd666kGabSRHrcoQk/tVUbUe8ONbWXlI?=
 =?us-ascii?Q?m7TwvLLntKvZecUoo+xt3nVxHLTHeXwoep8oVrkCTmHVtbYXmEh2iWBayiz2?=
 =?us-ascii?Q?POSvXFU025/FYDrXlihHCmZKx9Ct5D886rB0pZFBdhqjfFmaEEhlW7t/7YLl?=
 =?us-ascii?Q?1u5pONIVpuuf6YIP0WJ4qNK7pV9m9gIJtiMmAQhZTloNK32QJMvDxrx8Hj2c?=
 =?us-ascii?Q?B/WZ+s/SD/pCGGk0i9Ey9Cfbcke6ntJfx0GG0Bshv7+uyweGTpyCn/BrEX7P?=
 =?us-ascii?Q?apu9urM6K7M7tzS8R533+1ioMcbDdgRny+dqA5iVvZ+69Dxv0xBCPjozzvu3?=
 =?us-ascii?Q?/E0oYjFh/FGYch2B0tZAOvx9wHtqOXrmrhSVS5YwZzQS7xhcuSOAOmJidhJI?=
 =?us-ascii?Q?HnuPEoZXI+fpsoIuAd/+aBpUJtApsCOhFmjOKeBuOjnr0uAKaqvu1Xx0tMPp?=
 =?us-ascii?Q?uviy68LRyucugm7VmcnRk6Eci6UsaoxPkzYo2X10M6CCOlkJ+rYZP8XQ/vkr?=
 =?us-ascii?Q?3HXP5Sn//5GsTKCyij2zY3YJcH/5gyK9dqPF/XcSxDCAPfC+0+LkP+SAbTfy?=
 =?us-ascii?Q?nzCiz1ySiiuVBV1qffuEr0XxY7K4Pum7f54XjVAYN+iREwduq2084eh73o81?=
 =?us-ascii?Q?a3A0UKyp+cQkMTYRy0A60/RCsbCOxUOs36P/HFkKcKbZerZ+NNvE0S6SktFC?=
 =?us-ascii?Q?fok0lnCM9hFOeBxhN/U9FdkPZHZ1Ri1eMJIatYYjLraMtq9XqHcVkYosjGYB?=
 =?us-ascii?Q?JSgJbxUbWFMB2/ubcUmgDsq4fmEd98MI+BEmDmPFiszOIQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4f1ixl70AhRuZijMnyaZaGLic3qMwDeuPtCGYiKbE/EqzcMV1Su4OqLqwbzo?=
 =?us-ascii?Q?dNE5l7y3VME9BjdbdWArG3mf/xRZhfU1s7+NW3ZFCePX4IYgIL4zL4joV7/l?=
 =?us-ascii?Q?Ey/wyunKZmpjuryvF8pzDQuH8gBT+wTL0OeeVv5j8DRNO3BI1iydquqF2PMd?=
 =?us-ascii?Q?Uty0EkTVxiOYUU8gV3074hXr7FPxVx63h6SVFbSWsC3Xr2nZ4BBmJ9PSnNe6?=
 =?us-ascii?Q?1oCjAI9pTtVFnelBuJspJcNDlWced7YEpxmH5VETr7ZCL1o/AUk4hwcEkSeh?=
 =?us-ascii?Q?O/D3pmrrlx3g9klGK8Vx3DKdQWzE5vtBvAU29cr8P5rJbOA3W3pJ59cAkhzp?=
 =?us-ascii?Q?Ha6e7u6A3+yAoZXW5xpZizx/2H98EoB8sUE5h5AV1YkvGI0O+ZKo18XTmXh/?=
 =?us-ascii?Q?WKKsZkj0IHQwRoV+gObolvswyld+V2I0S+EV6zEPN1UGivDPaKIuAGpqDt9G?=
 =?us-ascii?Q?ebI/stAhIdoD2dbqQBX28SwovPltTHDU1P/x4MvzMVbvrORHMgRlBjkY2BTB?=
 =?us-ascii?Q?p4EsshjAuEq8OJ/VH1SwaRXfpofxw4YOa3c1FkKj0r0NkLuPGyxZB05h+nMy?=
 =?us-ascii?Q?tVCyTtKR+viCBjWEpNBXAVUDcox7egtXTplDa7ghoMWrcKcb1Z0TmOvhUIE7?=
 =?us-ascii?Q?2ZQ4lV/BfCt+/YVYQaBWOXZIqEY6f5ubpbqSF3PeMUGdXqPM+iKDmOH+vHZe?=
 =?us-ascii?Q?KlxqprBuMyni0FJsr9ADnwYeLMAFaWXFBpszpVTCaW7kZAHmmAgb3ntOVDux?=
 =?us-ascii?Q?2dq/Sszrlb6DltNra1QUkeVL6QcrHikq9AVFgx7BS4GDrhDSMEDOfeBHDG+u?=
 =?us-ascii?Q?QqSwNcPYNHbwn0rCq2p5pZBlSmNKXv9MS4aZxULUI+y8EMA7reQ4MDT8r8sK?=
 =?us-ascii?Q?y7ih7sy8IGTwnMSDa5g3fyGUR+BfjZkzZz7AIsjtQJ0C1EW+oCKZDQThU6lh?=
 =?us-ascii?Q?/hjcTeK0dbiHe2otLZYLXE2YsUekE/9rw1FusAnovKvegolGIHHldaKpx5ps?=
 =?us-ascii?Q?lMgcVKgymORpsYoYGS4njgnpLizvzGhU+JEFMvbkHqA32astibPbgh8YCghu?=
 =?us-ascii?Q?rPvWhmL6+Kj4ZzXJ7FdQcbVFiSzuy2dQNFhZPLy1Tdt+IuBTsmQvEvIGm9z6?=
 =?us-ascii?Q?zKRjmKN2RJQh1yYPnKOXUrGUQJrDmtV8hC5xilzuVz+HsPkFGBk72CVs2nxF?=
 =?us-ascii?Q?Yl2mUow4wpv/r6sL3KOpOXM+YRoZDnAbMgndpAUVhTIHUgq+YbKxrpyJffVm?=
 =?us-ascii?Q?ctsLZdvPG1NORvGFoQaMTbUn+UtZNjPCm0UsgzZFWiTi9HlDXCZtxbspzZXv?=
 =?us-ascii?Q?SGpVbBNexuhqz0bpAUZVZwNLeAUvyVHD42TuEs+eusiWWo0XDGHEw62sJoi5?=
 =?us-ascii?Q?ww/mWiFAcDzhtuQCa+1DQq2FgnJ8SqQ2RaPt7ernVm7rTgMuXdaRytVcv0k+?=
 =?us-ascii?Q?2/kuu/gcjbgBkDIQxm2rDscfwlSXzs5jPKalb3VPwd02KcpHq2ylJW+JM7yC?=
 =?us-ascii?Q?szKVQQboVKCFxJ6ap9fWwQLlAO5KyJGFlJHL35LpIznV7WLOoLdHSUauaqgq?=
 =?us-ascii?Q?7ZnHaTuIgfNGvTN14ET3tW11weTPrTy1/DFDz7/QZJWtbwcGr9WZFQgNtz/N?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	6JdKvq4vfPkya/0eGDhD32Bh+uTKDo+NrS1Q6CcYvlCoyzC/aZm+Z8HGM2z/sRgY6lbA2ojngQaeQLYrt9P1VTew8/AKvNhn4YhQZ25EZA0eh6FTmeLB83yyJ3fUBgoIT10yV0wPQbr9IZ9m9ge770/cWOCDARtWZqRFQpvMSEILV6cup5yq2D0877mgjrs1sLQ/TjapC61h4FBioG1m5ZtiYekMtoYYWgmfbxcfe3iZTEd+D5cJ9lN+0DuKQMlAuSOvCo5xWKCCgTsN7GbPje5GpBKCzr2FITx9gS3TZzRtQJu2Zajb+ay+m7aqk4zFUCDf5i8+ZJaVU9y2/ZOQFaySdRSAJ6a+zZLGgjfeE2lDMnSsEx9XPPoh+jmVLV1zb/De9VSaHdQKKyp/s4qIGDlsl3kgP60feyigz5H+Wy112/9/8cLBQmTXEsN0NlHxntiDNOaC7TOxkQUsrrqxbKZr0C5NrF98XrkKs7DjaehqeAFJ7/+xM3rFcunLySToExeVwcEALVlBhQSay0MajXW2H16cy6Vuad2UmmHUnqfhLbwYb7IekXVxBwsksHa5mQikiABH2uRyQ5DvmaUqFwuXsdvTTTYMd0HDn3kjxTU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f5fe20-c704-467b-2eed-08dca75f22c4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 19:23:42.7961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kNFCLkc9WY1AnyVkIc4T/TeeG8YPcrYmojdU3ZuPakUoGU75cigmCBoaqWSlgJzADuAuknYEep9iXN6w4OxbEzEtb2+TSsj1BytC02MGug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7803
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_12,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180127
X-Proofpoint-ORIG-GUID: 6h29Au_tEN9lJwCoMDIfuSOyf2ypYDZE
X-Proofpoint-GUID: 6h29Au_tEN9lJwCoMDIfuSOyf2ypYDZE

On Thu, Jun 27, 2024 at 01:34:28AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtprobed/dof_stash.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> index 62418b66..625572d5 100644
> --- a/dtprobed/dof_stash.c
> +++ b/dtprobed/dof_stash.c
> @@ -231,6 +231,20 @@ make_probespec_name(const char *prov, const char *mod, const char *fn,
>  {
>  	char *ret;
>  
> +	/*
> +	 * Ban "." and ".." as name components.  Obviously names
> +	 * containing dots are commonplace (shared libraries,
> +	 * for instance), but allowing straight . and .. would
> +	 * have obviously horrible consequences.  They can't be
> +	 * filenames anyway, and you can't create them with
> +	 * dtrace -h because they aren't valid C identifier names.
> +	 */
> +	if (strcmp(prov, ".") == 0 || strcmp(prov, "..") == 0 ||
> +	    strcmp(mod, ".") == 0 || strcmp(mod, "..") == 0 ||
> +	    strcmp(fn, ".") == 0 || strcmp(fn, "..") == 0 ||
> +	    strcmp(prb, ".") == 0 || strcmp(prb, "..") == 0)
> +		return NULL;
> +
>  	if (asprintf(&ret, "%s:%s:%s:%s", prov, mod, fn, prb) < 0) {
>  		fuse_log(FUSE_LOG_ERR, "dtprobed: out of memory making probespec\n");
>  		return NULL;
> @@ -589,22 +603,6 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
>  							    mod, fun, prb)) == NULL)
>  				goto err_provider;
>  
> -			/*
> -			 * Ban "." and ".." as name components.  Obviously names
> -			 * containing dots are commonplace (shared libraries,
> -			 * for instance), but allowing straight . and .. would
> -			 * have obviously horrible consequences.  They can't be
> -			 * filenames anyway, and you can't create them with
> -			 * dtrace -h because they aren't valid C identifier
> -			 * names.
> -			 */
> -			op = "probe name validation";
> -			probe_err = parsedfn;
> -
> -			if (strcmp(parsedfn, ".") == 0 ||
> -			    strcmp(parsedfn, "..") == 0)
> -				goto err_provider;
> -
>  			op = "probe module";
>  
>  			if ((mod_dir = make_state_dirat(prov_dir, mod, op, 0)) < 0)
> -- 
> 2.18.4
> 

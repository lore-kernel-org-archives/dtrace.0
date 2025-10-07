Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3918B2E62CF
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850940; cv=fail; b=iHXI1svz1NNCTPFpBJV/dLtf76IGcpBDl1ADYvf337YQQUYCDhZxsi0j3POdAIoR1a2QEkG9DmIsi0od5AuZyx3wuGlczL5iZd4afxpugZIrvlfrZSWAQ12JqmRpDg0pajCzSgh0dUro0Hu6CuCu96PX1PS9xL+Z33YBoHvZp88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850940; c=relaxed/simple;
	bh=IfmAwQSnk8eeWl4kcn6Wg4jyY1TZuxmu9zeaha1AIYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HSlV3SAuvRfHWnzmIVq/qOb8o4Kf1WP6MIwfjskorBw/RVaALO4K+ee19Nt5fWMyKQWk8LtcECKvaH7QAHQ8CcG8iA+eA7ps/mzZmksb/T5qwXijzxV3PFUhpwEgvzj8OKk0tP9lvZCEhdDn/MJeoA9P8Q3ySNr7pk9I4C7IOEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HMfb8icf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Koaple06; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HMfb8icf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Koaple06"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597Eto4s017019
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=HXCzcRjL+0tuIoA57l
	QYXEbbHoSmqXFTDVSXMIeCZ0E=; b=HMfb8icf3P8xdAFUrCkgOQjg0CJluGV9jR
	tB9g5wD+C5UkGTLpJeq020KgX0R+7e6/mjoQfmsYuSh3WOZ2PZCStKsQbu2wFYRf
	6Z9OxIBgFEiTeIK7WYqebKYzr8QCtSA4RgW4BEwYWjxoTq7pBEcYjihIDBRwMd3k
	LdKpP0WcYY5Itg1vQtGy6UVirYFdFaixgM6RobvhtfTt9a39NmbLIvc2tJi9z/nD
	1z7f2XDQkGgbCYTpV1cDx3CntsHdH29R4efKpM3uHyINMo8xV48Dq53LRaOQXgtU
	kpgDrEdSD6Qg+MYFRzq/lMm869D+UPuo05XPNPfSCaxSo6AbN9jg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49n4nvr54w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:28:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 597EeIen029855
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:23:55 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49jt18c4b0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:23:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxOtVYJzp1i5YT/zGN15xk2L1ZiNyCPKlTw+FkBPzboQoA3xDHCYCWxOd9xDZo0/wgGrJR8PBXTHllWYYx1wHdUYKvZQPI/pk3FfDeqOlqvg2r29243fywNKwl6qSIkMgTAGxIxFK6QjqNstENIN90bka2GjAikm9mMHzW6B/YcYUcokUi8QVmW9/ilu0tvOX3WCJuZH5gmeUnzOiW7N2hQKnzeQpSVRElr+upzYrL5vrh5u93O0Sh2OeetFy5j8rr85/EVKINi59lITZKvwGcwpE+6fwmGFH5WHDtwcJLYjtaCuACzXd30cxymnDEo+9MuqxueaUn5MMHaVCMz+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXCzcRjL+0tuIoA57lQYXEbbHoSmqXFTDVSXMIeCZ0E=;
 b=m5AEA4FDGMvLGguNWti6BmJhO9NkOwk1p+dqFDoHaE083Biyl/x0fMXb/gpQJAF5PVDZfzk0pw+U6p91GnYBtkVw6vsgE4DDZg6MqGNRlGbAFwyFbIZAgY4PCQWENksrtK6vi8WbwaS5UroErUbOBKWO53fUfArCg0R5/ap0o5Ey1dbPvCRC+m6pSF2tQp9+hpJLKUMYjLwMGjIk0SEscP9+zoV0DLgab6Amg5b4I2mdmQLMderqj7nczmMf4tPX07tbVeqTR7kq4HCieZzfsY2vlzZRr8C4vHcDtOZyXU89cA+6ey394QlAFh61OG+lwgfQng48nvWqEijb/DAbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXCzcRjL+0tuIoA57lQYXEbbHoSmqXFTDVSXMIeCZ0E=;
 b=Koaple06y2NffcVFv8Nrjf+EI/Ub+rH58k1sunEwWbt6Fhjzm/DNwSzGfFP2SGrK+Je0permvsg5P73WlrAq4BEtXwVYTFFZYtStQwD3r155RLbf+FLcol4QrCg8po5DMvQRxZldPQ27hk/bfbhjeTtqSfEowWMoXpGc5UhX+AI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM4PR10MB6159.namprd10.prod.outlook.com (2603:10b6:8:ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Tue, 7 Oct
 2025 15:23:38 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 15:23:38 +0000
Date: Tue, 7 Oct 2025 11:23:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 01/20] Fix comment since pkt_addr is not NULL
Message-ID: <aOUwd/crK6g6StWl@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM4PR10MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: be32ca76-21b1-4391-1051-08de05b57d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LDofD16qPnAQqSw3Jj/uL7BhkKJLspuxvo7ZSybnI4ln/E4OhOss9McMNWh2?=
 =?us-ascii?Q?6GNv4obH4iXiRnp17mw5TBIEDEQp5lnsLfsLF917UhAwkG6zMlRrlWrwOw26?=
 =?us-ascii?Q?76YQpbcDvQqTIsW2qjcn/ixfvKf1DwwDz6CV2NsN1//rdNVKwzDR3A81Z8LS?=
 =?us-ascii?Q?Tp8TL2jdNjMWekH69Aio0EV5Z9kNZknmCrfi6c4sVmhTNS/+vcYwD4w0RsXm?=
 =?us-ascii?Q?9WyGzpmR0pEsCJx+PkUNXsIUVII5baqyI63RdDbOc0MG+J27JKKU9eau/5s5?=
 =?us-ascii?Q?qz9ZIqNA8yjGY7desJL1EuMBHTCbYdmJ509fbEhVpnZHeROMZDB7otRXbGdz?=
 =?us-ascii?Q?WPdTJGraS9Up8ZmjtICvdZ6jzC5SRgrldOONdXamYDidjYRyoRHhSU5Br2Y3?=
 =?us-ascii?Q?8+7lSiBKxU4XoFSHSJ+QTqQxPHKMrV0ur5Rc3GP4MBZGgBv350ohyqo/48cO?=
 =?us-ascii?Q?z5D3ZnwDyEAC4F8ztdUDrQLFxk7rjlpI80XflrVklolNQJnIfNcML3MVIYJT?=
 =?us-ascii?Q?KAGxqc7yWf3JHlcg15SQTHVPDhWjpig4nDudhFe8RtFUM7CJeA2fcY6YnCkE?=
 =?us-ascii?Q?lt4Sf2z3MUzTGuN3EvajdHcKCe4fFrtg0zFk7sytQklGDgHQnDj6UtFQK76J?=
 =?us-ascii?Q?wP1JDvjkYVZg6JDr0ChGAXFZ8IeD9uQNo/kt/2UskQcOcKk4sBRNgtxZKrKy?=
 =?us-ascii?Q?sHnghPMLKHet9TahWz4PT4ScVNJ5zuqwobVWOwnxRCxvpJOvOzX1XlefsXLQ?=
 =?us-ascii?Q?aGGyPJVysjA4r33Kacqx5KyFMPJVAxuCAjaKU9HrWiYmAIFPkaEEyh9/fjBk?=
 =?us-ascii?Q?rney2w+LcAiuoSC8XBV6mxVOWYgpj3juW1j9GEssraYdIx3VXL8efHwFDhWg?=
 =?us-ascii?Q?J3bWX1th0pUvAzT8GVdjs0LHhpdtUXfz6bCo7PtGbtRvPL2QQv2mO/xJCw+H?=
 =?us-ascii?Q?2WWLpO9Dyy9FGcMgxNqq8tCshfJ5rmx9KdGcnCKfodl6vYLRte4TOG16RTxO?=
 =?us-ascii?Q?J4L/3f/DEHaQwRFn6V21lYPmfMrREj/Mk3x+kvQ/F/Oms8khzATuftMkLFVB?=
 =?us-ascii?Q?7OaibQQEPTfC5couFB8Ed+zO3XLFdYmrnIEFVKsirOkFBm9PnRkRImQxP/GV?=
 =?us-ascii?Q?UwKC1t0ZVLKqHImKRvrtnha9BEdan6XE7IXrn+DPg9dQ5rb8M1hdRNy8NpjZ?=
 =?us-ascii?Q?IwlIu97SAiXDPqvQ2wz5KWhFQ7mYJrxlZp0hkPngg5vgo7UsKFaKIOyf20Cg?=
 =?us-ascii?Q?yCRrk9Ahb23F6Qs5LuWn+FtFxLSrhBH1tbaK8oVYB/k6diK8ZaIQw4xyEQfI?=
 =?us-ascii?Q?Uyy1C0Y6A23VCS86mSB8oQ6SD92ftDZ8mM56lzPDYXRwXlFzEjZmyGG70cjb?=
 =?us-ascii?Q?Eyb1LHFKtOPZrUcmorYuRkmDPGvPYHZ71EMa3YHE+dwTukBdNtlwS2zHkikt?=
 =?us-ascii?Q?NbDU+Lv7pqI1fBB79v3s8Th+4RdqFDEw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XhP4EUS9COPZU5PKuzWrGq1MN7QkzrhanFOUn0Dl6ACS/URt6V9g3DFYUdX1?=
 =?us-ascii?Q?l81P0kTEXG5ahdBlp1z33sbrGH1DdfOwFlx69c86k87jNqooLvHrxmhnVBPt?=
 =?us-ascii?Q?L/JTQu0Si+JBi14LOAbAf3fg8Vt6mK5GaJqhf14sANSVEoAUlM4m5zD7fifi?=
 =?us-ascii?Q?4ruTlAE6NXV7DfnbagmlH9y3nHs5ritnxvycOCc2UTinBl14XVeGfJe2rjiK?=
 =?us-ascii?Q?I9e28FlTMaO61HUWZir6ta2EsbfR/psO4JXmxF7eXqJCw0r211yE7f8rYlGG?=
 =?us-ascii?Q?7Hbb1ZSpgWPW8HKvac3luHpoQgXJ8IBGBWb5DZRJ0zdYLJ7wq1lzNeRW22Ts?=
 =?us-ascii?Q?4u/At7GUfssFHOZ8kpnxfg2mw9NlkuPBsDV5LijKphUzB4KO5RAIswfnfgru?=
 =?us-ascii?Q?itkWUzVf0D1G7IMrB+YcJPAnqUJql+7+vf81Argc/02g7/pvzlNbeRWw8Yow?=
 =?us-ascii?Q?9iLrf/BwqD2+Zan2cfkd/z4mcS8Z8PNhC9EIoAGDRO0E39/pWESyPH2IGpLq?=
 =?us-ascii?Q?x6YCfMpwYZw9rZQFQGLq7MoPbHAA6TiKODMFd4VSp807bzCqJ2zUW2K/75eY?=
 =?us-ascii?Q?YIhpbjfTiin+veHdHW1g/0DP0i06lU2gKrvWXZs6sLDZCMb8QRcyGiR9EyZP?=
 =?us-ascii?Q?Nr+DjWO210q1fcD1tOfQd2Rnwz78BXwuR8i/c3YdBE62rxXrTrMmlAcwCAPr?=
 =?us-ascii?Q?dHVrvbZmC30Os9hFM0X7qWRGm8X2FMca9TKHKzz1DuKPH5zF2BU0975SWjWS?=
 =?us-ascii?Q?gfBY9iBjejZYj9pMkj2gZ5zs9p5fJmgUV2iWBuI1LgwayUqOHcFd5z7wspLG?=
 =?us-ascii?Q?N/iAPKVxVJTADsf3tI4B1oTQwGfGxGW31cIf0a996C14hsH/rHYnnxF0t6C1?=
 =?us-ascii?Q?MyZh1Mi6QuzZNYluPtkFDJ0v3PbRfCihO6rH+SdzgmQKEaDkyO5UV9xuu40E?=
 =?us-ascii?Q?XA5sfnaghSuOv2sItdCG/UtythmK1V678nZ5s4PZvTsZjaAJ+c7YAE2epr/Z?=
 =?us-ascii?Q?oU7BoWFMst3xMWjnZuL+AkiKPM6omaGbGApHhlL6/RkLnjYm2RHsFfYY5iDQ?=
 =?us-ascii?Q?kKeOLLKu8n33lIZRzSHHzh0OxdUHEmaTrkD5/S+o6yc8oBFx8jdoQbJ1HYI+?=
 =?us-ascii?Q?cQAU4zTzW3K84RCa4JJh7BiwEDlkiH4YzthZXEixKe1FqnbWpV2ruimo0iuP?=
 =?us-ascii?Q?2yn7vewWXYkxFEqiAuD6ulyTNIdl95j7zUp2oZEyBNY/g8poa4/keHMWvOCP?=
 =?us-ascii?Q?tTDoHZFk7mIb2q7F3Jb792rwVS/g1NGJnx40UUGToB2SDfOX4yNMvQyHhR9t?=
 =?us-ascii?Q?d2L72VUH2fR3R0Hg3AT4R2lKH5lFw+EZ2eCGtp8oXW4LVX+74sehJy4YsMrc?=
 =?us-ascii?Q?NV+pBWFJADOdU16dEBqmP3d3GAnbE22ztCnenk2KLYAxTdZYMcBwQYuK2WoL?=
 =?us-ascii?Q?x5X2Bq9Yxq1NLdJov5Cm2ITa5oo+z5q4ormckQdTbgLBLqBcVZ+/YickN3No?=
 =?us-ascii?Q?nHNB278E85VSGMhmWE+eIcI2uWgMFpvvTC9v1OzQqNYPmICTnEVTnXrKdoyY?=
 =?us-ascii?Q?fFyP0EzQdO8SobvmnZsEhp0/zmVRFseU/JJCROezM9lW8XRxFYSJZ90WiyRm?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SnM4OVccAb8ZhadUF0Ogra55bxYQR2NTaQ3Pg9UON0yBILlKJIp7mahgZB28HWp0deulRGwt+mWRviSbhouYj+TPwz4ECiI+ANd4ClE+/zYTafWG9kRPVn7HO7csLApk+w87TQnvb8LO2NOhijiovK4Kfpo4h+yJw5VhTdqyQRFZUbgG/k8mWdQhHaBJJ5uLbPaDfgBGHhhxNwDJORgqEYEHfmmukQVXjLIRRniGDkPJiiabG/zNm0pbMn8bjg8hiT65FGn1Nar0EjGQkL2kG8IN+IkgQ7w3mrAYqzbta/Vm/qfYkkQCVAg7x3Gra8TbgrKDl7xlTSZ+AD2qi2NuSeuhHnYyG6xJqL9Kab1Lk6CaW87yD7UEHUpXR1WiqkgMVzp0H3Gnv5NuJWoTmzXlcZryNFD/WGrAcmb/Gd5q3CBvXN56trZ+KHzGg0DJLLqok2MAKguEiwWb9/mRLLi4JvsCJVRMOQ1tbOGhgpP5BaD8HuQOd3sKVeYb4YQe6c5EUrC7gyxLoxRWXjsnCs4JysNFaY4x5ErjK1Cwgr2aIcwZagnxff3N/SK9g3hU4r1QXlPPLwzk2qHYpiIN6T6ou72FG/z4kvoF4I6oXcUxfmI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be32ca76-21b1-4391-1051-08de05b57d64
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:23:38.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPaWU7ygByH9wbZzMAGK8NJKPPrxxHxlBnWPU3Cd39vQqGw4cO/PW7axr8jCtKobCq2JZ95Scab+REusTA5LaGHxUxbSGpi8/VTLkzj+oKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6159
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510070122
X-Proofpoint-GUID: 7CQQH9hR9h1xq6bEwDjYZ8ITMxENuZ8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNSBTYWx0ZWRfXz/LrcRsTDRFj
 PYLoS3RbvOWRs9GWy1ZmLRCeitPQVlWODS1OObRQRYL0RsmnqDU2sgjOrBlcAPgXo4sNLghPXSy
 GPHCgb8dUpGGhdIrKysCzLpxTWOrnkkN61MMHJl6NA/l62CyJ9E8eDixToofhZGF1N0q951sP4j
 xwQpkHqzlrqX/cZb8fWzdAJP4cRX7m8hptjidCeI0MMHE5zZ+dRkODp8+GD8v/t3qZj4KCWLGBa
 JtGyd9toC8poDYMAEPr16kBIiH1e7lzTZ6YiutloAOLkyyTpiacz37qpXCWzNu6sbyCDqy03sID
 jp5YoHRaq09TGWZIGcDDwOMfSAoHNrsv+jWdCsoohiZzSM88dU+QceHF86zLcRx+rSr2yRBbfA9
 A77XGH1uePdgfcd6csbAJfjXFgiXLM3vhQDnB8mOFsq54N82PnU=
X-Proofpoint-ORIG-GUID: 7CQQH9hR9h1xq6bEwDjYZ8ITMxENuZ8R
X-Authority-Analysis: v=2.4 cv=Y6P1cxeN c=1 sm=1 tr=0 ts=68e531b8 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=CbFbqVOcoCh2KIMkxDcA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13625

On Fri, Sep 26, 2025 at 03:05:38PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dlibs/aarch64/5.11/net.d | 1 -
>  dlibs/aarch64/5.12/net.d | 1 -
>  dlibs/aarch64/5.14/net.d | 1 -
>  dlibs/aarch64/5.16/net.d | 1 -
>  dlibs/aarch64/5.2/net.d  | 1 -
>  dlibs/aarch64/5.6/net.d  | 1 -
>  dlibs/aarch64/6.1/net.d  | 1 -
>  dlibs/aarch64/6.10/net.d | 1 -
>  dlibs/x86_64/5.11/net.d  | 1 -
>  dlibs/x86_64/5.12/net.d  | 1 -
>  dlibs/x86_64/5.14/net.d  | 1 -
>  dlibs/x86_64/5.16/net.d  | 1 -
>  dlibs/x86_64/5.2/net.d   | 1 -
>  dlibs/x86_64/5.6/net.d   | 1 -
>  dlibs/x86_64/6.1/net.d   | 1 -
>  dlibs/x86_64/6.10/net.d  | 1 -
>  libdtrace/net.d          | 1 -
>  17 files changed, 17 deletions(-)
> 
> diff --git a/dlibs/aarch64/5.11/net.d b/dlibs/aarch64/5.11/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/aarch64/5.11/net.d
> +++ b/dlibs/aarch64/5.11/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/aarch64/5.12/net.d b/dlibs/aarch64/5.12/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/aarch64/5.12/net.d
> +++ b/dlibs/aarch64/5.12/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/aarch64/5.14/net.d b/dlibs/aarch64/5.14/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/aarch64/5.14/net.d
> +++ b/dlibs/aarch64/5.14/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/aarch64/5.16/net.d b/dlibs/aarch64/5.16/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/aarch64/5.16/net.d
> +++ b/dlibs/aarch64/5.16/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/aarch64/5.2/net.d b/dlibs/aarch64/5.2/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/aarch64/5.2/net.d
> +++ b/dlibs/aarch64/5.2/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/aarch64/5.6/net.d b/dlibs/aarch64/5.6/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/aarch64/5.6/net.d
> +++ b/dlibs/aarch64/5.6/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/aarch64/6.1/net.d b/dlibs/aarch64/6.1/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/aarch64/6.1/net.d
> +++ b/dlibs/aarch64/6.1/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/aarch64/6.10/net.d b/dlibs/aarch64/6.10/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/aarch64/6.10/net.d
> +++ b/dlibs/aarch64/6.10/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/x86_64/5.11/net.d b/dlibs/x86_64/5.11/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/x86_64/5.11/net.d
> +++ b/dlibs/x86_64/5.11/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/x86_64/5.12/net.d b/dlibs/x86_64/5.12/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/x86_64/5.12/net.d
> +++ b/dlibs/x86_64/5.12/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/x86_64/5.14/net.d b/dlibs/x86_64/5.14/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/x86_64/5.14/net.d
> +++ b/dlibs/x86_64/5.14/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/x86_64/5.16/net.d b/dlibs/x86_64/5.16/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/x86_64/5.16/net.d
> +++ b/dlibs/x86_64/5.16/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/x86_64/5.2/net.d b/dlibs/x86_64/5.2/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/x86_64/5.2/net.d
> +++ b/dlibs/x86_64/5.2/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/x86_64/5.6/net.d b/dlibs/x86_64/5.6/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/x86_64/5.6/net.d
> +++ b/dlibs/x86_64/5.6/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/x86_64/6.1/net.d b/dlibs/x86_64/6.1/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/x86_64/6.1/net.d
> +++ b/dlibs/x86_64/6.1/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/dlibs/x86_64/6.10/net.d b/dlibs/x86_64/6.10/net.d
> index a81fdf087..f14013b9f 100644
> --- a/dlibs/x86_64/6.10/net.d
> +++ b/dlibs/x86_64/6.10/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> diff --git a/libdtrace/net.d b/libdtrace/net.d
> index a81fdf087..f14013b9f 100644
> --- a/libdtrace/net.d
> +++ b/libdtrace/net.d
> @@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
>  /*
>   * pktinfo is where packet ID info can be made available for deeper analysis if
>   * packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
>   */
>  typedef struct pktinfo {
>  	uintptr_t	pkt_addr;
> -- 
> 2.47.3
> 

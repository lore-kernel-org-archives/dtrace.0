Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102BB28C2DD
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770924416; cv=fail; b=oG6hck4wYvAqgKTLGVEqqf/P5dqvDTMIo/d1cIV7Yg3JHCi8Z/n44wLtN88cdj2LuPKKZ8BWjKZLF5yohiX5I4htp0Ing/YAtK+39lbzBidg29D1yDzfWgmZOQKSawDjaLDhDkEMHz1RtVhyHq2NCjkaIgj2U8ZD8nTJIwQ6U/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770924416; c=relaxed/simple;
	bh=fj+IgtQaEoyRXrZGPnw/VIfqW6lepBC0EhGs8nRIgNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fXixNaTy1RFjxoVbPsXkQ/3yP2jE5LSi9L6S7mYnpC+NjDuguUt/Fl/asIS9DWVZvM7oWUUx1OyHCjHvMkqHIsGjMax4JY2mPT1vkNH/m+L7a3jFWOuDMn5pOOwoGeOr4IPTm42ZvJbLCgaBKnkjjh8Z5z9yRdzERMpdlrs6+aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JntgBFNs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KHie+lD+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JntgBFNs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KHie+lD+"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNF081019834
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 19:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qwA38k8qXwuaU295PL
	XXtTx7ruaNQlaJHZ/ZknDpdR8=; b=JntgBFNsR4GIq7IY9sbAtYqBxwmTuABMZJ
	Sg3gApOSgTL3WVAW+gDqwfs+HSalkgpB6zK/W5QaRpZZulcz88h61O0w1r57L+pN
	AdhrpYtYdSIjkHUVJJ7QH10FXAw2NCfORVybkEYJHUrqC298M9c4/xtxnLo2vqCc
	sXoak1PoSwaS0uYoy8q8Svw8g+mGU6SHx2up0iNNiL71pEwRWSFxj6zhvYdu64yi
	60HQ51ts+BhWxG+l/eDzsdiYyYxbE6GhM1JuHwijfPC0jr5pHuiXKOexyGfh5luX
	shr7D249waZN01IOLHc/ZNuw/JG/x4Ua4vsTW9QWejRkZlCQ5Erw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xh90e80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 19:26:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CIQYNR013012
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 19:26:52 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c8272bs5m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 19:26:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9edZsdJlQIvaTov+9nQYLdZBiNH4V2iaioSBfcRpkkjuhTsXHAc45vIR+Ejuff0dvAJyn76wl0HcOSndL8DGb6J9Q1cONWVTpOnCeJAU8T/XBIJpr288LMIGThpJsFTdS5Y5gkE9J0LXB3VOaIeRHIQ0HBL+HxuFpAXlhO4co903iTpKrGy/H2bIQHJjffHFInI7HkEBqtUyw09CxwuQR1u0+Kc+sZEeMYnwU/ErXzBLHdnPQmRdSkflJ8AQqqPBrE1xfmXWyZru2PnO1Y3MGpbgTfoYJn9HXodqplc8D36kge3VBut9v/4O/nCrSsZmN6NdIo84L1MQQm9L1HdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwA38k8qXwuaU295PLXXtTx7ruaNQlaJHZ/ZknDpdR8=;
 b=hjhJBPgTdeBQUnGAn45Mff14UwKKTTKgQqN11/ILXSO9gIvNVklI4T81837T+MUW4hdud7BNBBSyGysWXLWiGYdLm59wYp7ROopMetAS+UZ4g6h6f85Nw4GRmelHLsFkb9bHCCkjuHZ/Sk3QHwRGXL0Xns0Hd6w97nVId/+MVToo2t+P45aQHhVgag4NgUelbwnjFlbn/Ht8TUm/ewHkMXutYgcVV/TjcBmOjNpxGdAN/hkqJv74hsNyRrAZhiXTk4OnXRf/oM6orjj6V04/XAN0LW/4dJt4DauesT8B9QOC5U76Im+txxbr0EvGvPZ/pqSc7jjTOOAe9mN5ADDIeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwA38k8qXwuaU295PLXXtTx7ruaNQlaJHZ/ZknDpdR8=;
 b=KHie+lD+DHit/d1p/RmxaQSt1B1TJjbzkKJ221SbASDy5i0DbLzI8svLds7ahf80VDuLWbHU2LsUDNcEJlGV7QO0LgVktptzqkF0cFeDkjogn/qb60pyOvN/Le376RWNgM1H6Z8FXhq2VNugszs6QlgO42frUZ47kSjJB3MmmSc=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SN4PR10MB5799.namprd10.prod.outlook.com (2603:10b6:806:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 19:26:49 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 19:26:49 +0000
Date: Thu, 12 Feb 2026 14:26:47 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev,
        Eugene Loh <eugene.loh@oracle.com>
Subject: Re: [PATCH v3] dtprobed: use /proc/$pid/map_files, not the filename
 of the mapping
Message-ID: <aY4pd+68sdGj7lon@oracle.com>
References: <20260212191729.225384-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212191729.225384-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SN4PR10MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: a44166b8-0753-4a0a-b20d-08de6a6cab16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oaRpYUyoKUNQduYQoyaRpcHPoWTHEfsypyyd9epGoU7EpvZdaAm+0PfumiXQ?=
 =?us-ascii?Q?09CGs/SMc2rvSXkTzisxbM8gw1jNyV4oTB8tsSndnpuAxrnH2d2/34TFhEWF?=
 =?us-ascii?Q?iBW7plSt+16csAQ3hsnpU3dLsR1tohtRSiuN9J4lGAfgy1pgOI40w4I/goVM?=
 =?us-ascii?Q?zfjpgKt8uMgf4r+iZHioOnhJW0DZS3p2CjZh8wvGW3jPg78+37rzOpMgGC5v?=
 =?us-ascii?Q?rNvXJ/zBfD+nOiRKgrgc5hUZq0sm1uvJhhI2dtQx4wTn+yjQJsDKScmeNolH?=
 =?us-ascii?Q?PWWWtC0YY59p0LdjEj92v7bHUaDmuqCKFLQgzy8gDmJQpV7i2DUMgLR4p4TE?=
 =?us-ascii?Q?tt46UOrezXHmPq6XnFqGIsV2cuTBo5H6k5J7iqyLYkijlZA9V4+MS/znvB3M?=
 =?us-ascii?Q?ytGB/yJGNp9mzQcTGmZb+Sz3GivQJ1RqS8gGCDW1CzSIVGS3zJDnVdrX8Goc?=
 =?us-ascii?Q?9rVNSpBUenV2jvVBKHAdyIUxaLN5ckY4m5i+0iDoOD2huEfIVLhrp/l5t8Sy?=
 =?us-ascii?Q?Csxg5dpTXZfyt9lI6hqcN6AYaVIslj5taEY/J/h8jSMLFrTvy1tVk+8qdiAh?=
 =?us-ascii?Q?4vJM6aC7jcvGik2L1nq3Nv2XMoRQA4VHTCEtl+iBV2Bc5V9ZsjRDTncdjR0J?=
 =?us-ascii?Q?bQs7R8pkGpD17riXO3o+Y+tXUDU96kd26uivn8jx4DzpsPXvZKIRady5idOU?=
 =?us-ascii?Q?vd10L2yZ/GuoZTqhHEtpx6JL1nJcszRhF2d3IYWj9Zd018hc9UHK+b0YZBcp?=
 =?us-ascii?Q?ykQCvpDh1swxVqWN5DXbqXLuCTJdI+1HGRNFT8fP06D4/pUTmlXWm/ueyeAJ?=
 =?us-ascii?Q?+u08TWRzEnr+Ae3uTCmdqFnq7+oJed1vwocWwkY8ZdxFHr4R7tAPqoBjTUsc?=
 =?us-ascii?Q?ChbqgLFeRYrFtxhfOuomgBDThBb2XNxi8CvIl8JjcDYVSw74Skwo2GvChIgF?=
 =?us-ascii?Q?bqHue1L9xVD2xd/jG3QLZ+MoJF4zoMNmB5/I3xinyZd/IiWsyGRw/d3qVBKm?=
 =?us-ascii?Q?n5MjvLnk5NBCI/ZtkiR4C8Tsxohrddu+qObgs1Un+7QAD9/XFmtUTnSgiPq/?=
 =?us-ascii?Q?xSlrcic+4cVlS3a+a0pLq1ZbljhVT3riGG42MiLvqbLNsigw2i3+aG+B/7PG?=
 =?us-ascii?Q?as9GekC22n7lUiNnwxllAmc9Jo9++sPRWpXe3zoHRqFktlFH3GlCWIrTjD8W?=
 =?us-ascii?Q?QVbCqP4XodYn9Dggr46Aj2m59/UW6sfsZLxHr6iw4R66ZeHb/E3VFfobA03o?=
 =?us-ascii?Q?yxHx48ddqt8A7duM55/e9K3SMN1GSjJafn00WDVnj62iEFrqbK1RwMKIh94q?=
 =?us-ascii?Q?BNdmGl/nVQI6a4XFf0A0pWXG+82oqjT0C3NUv1kEkygX6yAKCl/zTlIJ3G8j?=
 =?us-ascii?Q?I8VmMIPsz6OMfsJ1Qkz3jTFkCO0bmHw3x3z12jLk8lfqDZhOMmkk7+Lz77SO?=
 =?us-ascii?Q?78t1j/I1OGmwZNpobrj/JwgUR8Mby7+RK4+oVv/uI5yvh5/kwybx+necWQxJ?=
 =?us-ascii?Q?PiVsSMi6Voayqc2lZcUcjLPP4omgrc8odwHpiQKB4LmpYN0e7/vu0lIhZMhJ?=
 =?us-ascii?Q?lczQyqiUKTlcHLxfguw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tW0GHl620FJAiXlF2o7dRbF4W/RbNGTVjY9WGmgC4PoRn7iDP+fKEH8iO1Yu?=
 =?us-ascii?Q?wbPr+1qLebrztfJVRPTO+wjALgajrMBHLS1bP83KrjqoxbvGS0EKfrMSAF/g?=
 =?us-ascii?Q?EmviJ8+79EpSmu5eLC9AV/h4qA5+o3YahU4W52xM4VO7893+tQdI/xQvDy8d?=
 =?us-ascii?Q?V3SR5vqMyptHi04nn5CkHulKZvTvUYQjrEKJFl4TBxywRZUZfGFyW/HOdfv+?=
 =?us-ascii?Q?rchUHmv7ykRcm9+MuZ277r30XJukwz8I802hOQO/CZfg53fA7HA/jiN+VBxD?=
 =?us-ascii?Q?VdE7j3/kBkENX3PAcZDe7jb22T1Idr7HAyyyMxWIgLTrblgGKg+JmXQoS6a8?=
 =?us-ascii?Q?DMFO4RcRtUU9aIkGuSLI7txqqOAmSR9SW0dlk6Ydw+v8kfurofE6SqhwCFOp?=
 =?us-ascii?Q?il9UMIOgTImimtvFXRieInGzYRz4tq1SWjmpEvNWC2UaV2J6+geLwx/hGQKT?=
 =?us-ascii?Q?IdQK81V2UI9LtcPcz9faHdou79zI5gHXTm41hJ5/6k08KrxDWxOhUM/j9K9s?=
 =?us-ascii?Q?5X5Vqs+EGMznnnJyGrNnpI8OizdyPFOlUoXDk/5cVlOHEFBgn4xe5omzxSGs?=
 =?us-ascii?Q?0MEIqYRrkrDduaQN1VLxsXrSCqUy+8eriPBjadLhec7Y2l10L8CIbeMeV9EX?=
 =?us-ascii?Q?/g2FEq7KVjnVkB32tGLLBNPgnK+TrRVQMaboCkszZjQJik6S3YkrV5SgIywq?=
 =?us-ascii?Q?j3gdvgT0XgX0UEFXuoSDgRPBD2aPaHvrWh7rbj4NnHhKAmnf7H/RjqmZE4wO?=
 =?us-ascii?Q?5Y+svCT/OrgsIc/mNNtTwxLxAN66t0O619lcFW88bTrFtOFu0Jf+VgF1xOUK?=
 =?us-ascii?Q?4EXfTXPREB7F23vTFicSf5QXInTXHQmAESjzZRUv40G/UziP/QaqQmzd77Ei?=
 =?us-ascii?Q?O0EGz4aGBneuXbhcczxWcKHgaSCF57xc7JiEnqJcJRzKCb44JMHHkEjNlSYw?=
 =?us-ascii?Q?Lis43KrSpXcsodoPZOy16Vb8pA+c+GG+syoliWRwok9y63Iy0R36LThPn4me?=
 =?us-ascii?Q?hrgd6/jmWJ4AtiTMQMpj9JnD+4Tj7HskALYazu9uctP091dfTdMDREZjtvJV?=
 =?us-ascii?Q?hWwzNiOvlc70BlAYJE1g9dOmL6ltFprxLx1c9MeFO6pqpjzIRebzQs6/g6N/?=
 =?us-ascii?Q?celBXelDnaZKnko79BedCBbx4MJYTLT9e7fvwb4EgwS5HuQb+rjOMvUEYVic?=
 =?us-ascii?Q?AEMZ1iUVgR6d5vOxSzIJAS7e840OLU36Ao0B+rnTzNoq4UqymYkR4eHs5HtG?=
 =?us-ascii?Q?L1rcvUaHWKc6pWU+Smy3mN+Y6d5p1+hp36Gn0w4JbFNyChB+VNvz61vE700H?=
 =?us-ascii?Q?Fdm9fbTX2iAWb0oKrQr0qQRBRmhRHwcEElYkheyzsWVjvxTaKbUp/uJJPH/m?=
 =?us-ascii?Q?AKR3+YO2WpIfHslFcURPEQuUJB4NfyYUOO9R//3uor6FoE1IKQt/8bHrErah?=
 =?us-ascii?Q?+eyZJp9Ha6riTPdlv4Nlc2YyjErsVznCUEyu0I0zfqyiQ311RPAPJbLo2UNB?=
 =?us-ascii?Q?mfzVCGa3qIPwHOAoFKwyiHscQSnDKgkI78FI+FtNMzhPJIAfeB4DNjECJzjM?=
 =?us-ascii?Q?DBlHO1GY1hJye/oOAx6HR5NiZrytpu7/IcFfrgrXL7njKTzgyjcKHJlk+NEZ?=
 =?us-ascii?Q?J0G/tgemVmTgaWWHetrp38r2BDz+qsyzq5sNot1mH0CIxfnXCngauginv3ze?=
 =?us-ascii?Q?b9dhpqULwE+65PsBmCYFvMBN80fqbfzgoOXUSlbGKc1I8be/Nz4asXtUgRhf?=
 =?us-ascii?Q?kKFhoC0jpA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CewkVQFMfz2nH91VwL3s1XyoErsPZdMeLwqI9Zhd0JyQNLbBMAvCx3aps1lHKPHm5P5dwAmHT+vuq9pUD6XfL+2sB6DhQSYWPds7P8T//dVLNt3IRtaO74onDlR1NNetj04W32b3QQneX/ssSD2Py2W34HoXC46wsFoffXgRzD+sPQzsSJOSrNogMMvVWTxT+PmYLCWHX+sat+umTrnjb1L1O1EKP3FjoMCwT+2XfBcHJxZFr55oL2o7GX/c+m6VdBrFBCsIzPu9h4cDIIQvHzkw0uOW1bsGcCo4t4c+bHjzr3Le295O2p3kkx3s35lDBT3QbCYBRWGtqKjpDW4ss0Gp3AKJMk0+x47lFAzf/PuloVcgSreRMUhoaF0pWeSbF4boI/dhnWI3zPpkGBz501jlIXVPK9sjZUgaiiKHqmcr+beNB5NhPSq4idZV2/c91I8YDqNyEMi3jw528oBHZoaTPiRCFeO3DfKnVEL/NcCPWfZ5sZl5kKFFPFN8o8tUvFu/qnRE4V87qllOHpy6ymaZVy003tKJSA7LQ+1MYNxFunx22siLADOoi1HLnHg+tCr3U4tPVwAJ2Ro0KYZJmiKTGdoS8j/j5FL8xTJUZdQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44166b8-0753-4a0a-b20d-08de6a6cab16
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 19:26:49.5324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6grEtkN81I4tRGiQrGVIEg7oQiQV/q0AiWFNq1kxhSfm2609K8B+H/VPdrh3mnnTGHbpZgiwsw+OYt1Mc073mYd24Ar75l91h8Ht6ZH3kmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5799
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602120150
X-Authority-Analysis: v=2.4 cv=YbOwJgRf c=1 sm=1 tr=0 ts=698e297e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=bQ2ddsepk3EGGvJ8z-gA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13697
X-Proofpoint-ORIG-GUID: 1ntNcvlIbLE2G3W3TPbiFi6kcgVYxYFc
X-Proofpoint-GUID: 1ntNcvlIbLE2G3W3TPbiFi6kcgVYxYFc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE1MCBTYWx0ZWRfXxCgICJSf2Oa6
 VYdi4qKxSyGPy0J5y14XYYMKDjA1GRr/T1/v1i2yE+gM6x3nHzEVEPsod0DwbL7KlsZL9ct8j5M
 5gfe6crbm1SH5daozrtf4zHneh+yInMvPJKYXXeafVH0E1hjZjq5uPVx5ZUkL9Sqaz6LRtZfwRN
 3ytlNJpbBwcp1A5iAHpZuxfNMV9W76R19PyRb97Ty1aL82ig5tNyzrAKeIKnwHrErxQmtJ+Qki+
 wdPJRsl5wy94TCzX/+upWUH6/fLLTnmTfeCd2lV2ZYZ/PuzpxnkPfTfxQhI3PiDvVahtkzz5CPh
 9gFIONdMOxcJZjCh3V7P3XTabY6yCqaymNe/7vM+5RsfXv85i5KJFQqsyckIe0YeR3JIX+vPGYg
 osmnIEjx/ToY9sEQBM/o/28eTHkKzWZG/V61cD0nzrzEHMKndTFD1OmaWK7FkBuCKTxLeI4GaK2
 pkOLuOng5nb/1G5Pd/Tnls8CQeVoB5Mj6HSyMQJA=

On Thu, Feb 12, 2026 at 07:17:29PM +0000, Nick Alcock wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Instead of using prf->prf_mapname (which resolves to the mapped file's
> target), use Pmap_mapfile_name() to get the actual
> /proc/$pid/map_files/* path.  These magic symlinks can be opened even
> when their corresponding files are deleted or in an inaccessible
> filesystem namespace, ensuring we can read the mapping contents
> reliably.  DTrace already does this to read mappings during USDT probe
> lookup.
> 
> (We still use prf->prf_mapname to determine the module name used in the
> dof helper, and thus ultimately in the probespec, because that should be
> an actual user-readable module name, not some random address-space-like
> filename: it doesn't matter that that name might not exist on the
> filesystem.  Thanks to Eugene Loh for spotting this and Kris van Hees
> for fixing it.)
> 
> Fixes issues with probes in paths like /home when dtprobed
> is sandboxed by systemd.
> 
> Tested on both systemd and non-systemd (non-jailed) systems, with USDT
> programs running out of /tmp, /usr/local and /home.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtprobed/dtprobed.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index a808586559d96..34349deb028be 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -487,16 +487,17 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
>  		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
>  			 pid);
>  		goto out;
> -	} else if ((fn = prf->prf_mapname) == NULL) {
> +	} else if (prf->prf_mapname == NULL ||
> +		   (fn = Pmap_mapfile_name(P, mapp)) == NULL) {
>  		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
>  			 pid);
>  		goto out;
>  	}
> -	mod = strrchr(fn, '/');
> +	mod = strrchr(prf->prf_mapname, '/');
>  	if (mod)
>  		mod++;
>  	else
> -		mod = fn;
> +		mod = prf->prf_mapname;
>  	snprintf(dh.dofhp_mod, sizeof(dh.dofhp_mod), "%s", mod);
>  
>  	dh.dofhp_addr = mapp->pr_vaddr;
> 
> base-commit: 9abccde65bd924a5b63258eebb5210952709768d
> prerequisite-patch-id: d178f9e04afa5cca97d93ef7659a72dff6d364b6
> -- 
> 2.53.0.286.g870d7528e3
> 

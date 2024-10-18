Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C51817
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729281509; cv=fail; b=YimYdRRzRFZ5EQtxxQ2vsktRjdNvtZeZPX7qlpWgt+0xkqJ3GgpI9sa8vw5jeqLwp7rxUemJMaPqV9zv0YQrSPX91Rf5Azw39yWgU0w9J3rsZe5cnJGUnipTUJ9DcmdKDBd4T7iJ0CyzP2ZKJpx6n2wkLziJ7++N0CZagayK7J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729281509; c=relaxed/simple;
	bh=CfZdFqNL+I4dINMKkkToNKub0irtgss63DsqiYjdsRA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Gb6SNQxS6K5p0h12HgmNQcjmeVUchyCXXH9p8xuRabJFV5KMgFEZnGYY1ryqEMbKx6btxWyXnXairJxlJdFiRch+P4Oun0VZfGCndPUHhhPJJI+xbECrYba3x3Q3yHAXxP1WwQrI5yy1tqj7DJh+NGs8CZtPgTfTDpfaSWgpauA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kJAOEsqZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=h4r23Y8E; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kJAOEsqZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="h4r23Y8E"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IIfkss004547
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=w9R2/bMxT6rlMJRu
	G2vScT3xdip1iK5ax/YPRAI3piU=; b=kJAOEsqZ+WiqgmJFEYGGU2dWjWi8b8SN
	zv56GYGoKM3fHFHd6cyRyAgiUCSkvbRjR2ck1GzXPSu8gnxhzEnKDXRIvou/e2WN
	sSfK8CnBK4Uy4EYGPgj02vBcSi4pt+u9ovPdEjVV9nSh/BTaoyOGc4Mpv8tyjVRH
	Y9rj6GQWdql+5uWliks+kp9xcl8K9TEGHnwGl0XXB6zRLrXwD66dZ9z7MZzd+u9j
	Y6VG91CL5Jlp+CyZ7uh+EPMmxfzGmv1UXmbFQyDUYYTPUdvWVrk7Z6AQPuDk3aT/
	lfmrjEkoyb5pMNmta2EfXBSwASFGS/oFDjRgQ4B3tq4kluT/T+Jtlw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427fhcs8rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49IJLwcd036006
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:25 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjjk8ue-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCtCyFGIWn/ytU+TCrK6awssHgm7LA8NY/ryMc6dEc0VHKQvXHHO5I4T+bnfHRc4mGGyP1IpbyEaVlCz91m99ctjQcB452zTIvzTRmrYj40itNO1mIQCMumsatwFGE+T8NdN+sQRJRMDigREvMRjLUuO4RGj4FG2RZMCvzGeikvfwQzPKqPrXshAO8enDALabY7gTM1z2S15omaiiffHz/5jEpNDttkUDumVDCrV8pydl5o2jDSv9CzJJQPjTEe2fLgAZaBo/vpyx/gk2ngDtRd8vINYMUVy4eJOMwn5MQ8nlPTjvB6tvFiBy+FtMZZUKXYqAM7LOeFsb7/A+mneNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9R2/bMxT6rlMJRuG2vScT3xdip1iK5ax/YPRAI3piU=;
 b=dZm+5FJy6lNphwq9DB67K+jvlOZgPQzrzuf/poLATeNu6mwgwFUO00trzRLpY7cMAc+qzwA2ualvFFoiOsLOTGhEMke1gEFdmB5gGn8hbwmFASse3O9nMEq4XUYgIK2uRfQRFBvxt/8udqKQk1GvcO+MowJWM2tMA4VOcND3swdDDG2bf4vvYXJGDQzECkuKhrVbkal5uOLUpp0lt4Vj/72apoN1cnlNWtDfzNBXWK7dkTZVBxJudfzcQG/28L9PbmnztHSGMaBZgFhqfqrlYyEbLBzh9v1tclFayCGoHYy36i3yy8jBpLn4nMeeE7mu7xeXYcE017YA7UR1o1nx4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9R2/bMxT6rlMJRuG2vScT3xdip1iK5ax/YPRAI3piU=;
 b=h4r23Y8ElOkIM74Kn5EVlFFJm75RKgenmuUnbGIHp8AJ3xpNV3axpVxgM2iyS4+n0WMK7HmRuiqN0KbujvbdSUduucWRP28Aund26ozAnKTYgDPpFifjI/S2z3SEn7JMUNro8axLiAFVxUGX/R9yE6ii/TSP3c56og4dxB348Lk=
Received: from BN7PR10MB2723.namprd10.prod.outlook.com (2603:10b6:406:c7::26)
 by DS0PR10MB7202.namprd10.prod.outlook.com (2603:10b6:8:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Fri, 18 Oct
 2024 19:58:22 +0000
Received: from BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac]) by BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 19:58:22 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 0/6] usdt typed args, translators and arg remapping
Date: Fri, 18 Oct 2024 20:58:02 +0100
Message-ID: <20241018195808.270688-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::8) To BN7PR10MB2723.namprd10.prod.outlook.com
 (2603:10b6:406:c7::26)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR10MB2723:EE_|DS0PR10MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: d12ea5be-33d6-45a0-726b-08dcefaf385f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d3IAlXN7+2G3SyI88SKec4Q4sRtCbFM8RJo7cCbISwxPmYpeHGa5wF/JXzMK?=
 =?us-ascii?Q?UhhJB63+9f3bkt/V0/bAtlOsN834jhb/y/Ce7aYDrnmG1+UJdfJGglseMdiH?=
 =?us-ascii?Q?/Nmfbr2s8yIo3eBF5y+kxLnfNMDVFeLKzgak5KLZQCejTEp2widxNtzUTcOT?=
 =?us-ascii?Q?089z1tQ4wXQsT5tFxxt2tTeptyLl9tkj7WEds+IGvQfe9m/KusNUB52ULnDw?=
 =?us-ascii?Q?qcE6tVILElK1in8g7QEE5KDbeJpq3Faqk75jRfs+ho+9eGRgjkpZEonqRUIv?=
 =?us-ascii?Q?IUvYXfe4GFknpaJBhl3gZEYbuXwA+PJOeX+50sMTbJVNTlDY7lzBeJe/mhkW?=
 =?us-ascii?Q?cZgFnQOPUOH7b4Tjm0YewkggZk4PFqJVifHAVfQekGJ7J6xfYCX80n7QrHEG?=
 =?us-ascii?Q?ABeYfpE6tdNgSd6WTtYB2B1fhD3ZvUUgHUVZPJLvepkDfrkjKZzetT6mDGCm?=
 =?us-ascii?Q?OZa478eKflvzcEqrfqTCp2PNcB1lXntGGQ7YfARE+lOFVkaZ0tLA3d1b0lNF?=
 =?us-ascii?Q?qH+PrRE8qA8SIkBkXFyzca22DoL4E7CJAfOhDoA3YecM+9Bt1zZVvMRED248?=
 =?us-ascii?Q?7lD4+EV+bend9BVwm4ujqefWp9w9eitvx/7pCtRrPHtWvAdTUn+uB1j2wSNN?=
 =?us-ascii?Q?w8YgkqVpnJvwprRrFgxy38NxEvA3xHL32nw4N+TuIbB+U8VyV+jQR25upFgI?=
 =?us-ascii?Q?FgYpDVce7TIn6/3RvC2ZtAE9PGElWbbk/IISI5wHSCu0qDXmPhzGunCBzPMY?=
 =?us-ascii?Q?q0LlbMHuJzpTQ/aKvJuyQDGeZfjz4Ui3LTe6XK0egVCHwkeq2BT7xW+gVL+z?=
 =?us-ascii?Q?WOcgOQFlW6JZbyHJleS0BNn1VhSw/M1fEMlTMvmhN2lXRuzO9ECS35iWTUOI?=
 =?us-ascii?Q?kiyzmt7LfSJFsyKGjet+6ToTOaqsoAMnfgdB/P6qnrLJDEsmDfIBCSBg6IVz?=
 =?us-ascii?Q?eou6xz8YaPcnZA/vvE5zJB2/5B2mXbRAXJrTONj/dHoOm6fizzaGHgUXOUqv?=
 =?us-ascii?Q?g96t/26SUqr3kA9fVEVEzoY5GKP/m6OdfIoIZA+9eWF1tm6jlOibFGge9R5N?=
 =?us-ascii?Q?ERHpqjxVfaEBSoS/FyaFbzZOskYVrNCTyJ3E7hHRDmCG8nSrhIctekTpOs9M?=
 =?us-ascii?Q?HWJ0iHuhVq0/ovmBPbbZeZnoWHN8ftjGagvAY8R9NOOte/2ZAWFLALgaPQFG?=
 =?us-ascii?Q?nzoNXJ9zp1L5Q1nJPCTltgRcvBqtXFCLRE12ZIEOr8oYe7uN92MudPriFoVS?=
 =?us-ascii?Q?3/VkV778oTeib8t3Jk6E7F8swaeFYQPBgsPwXTDfzFH6zxZ2lysmuNoxaXyc?=
 =?us-ascii?Q?82zbW7HP4xYniE28dLkS4Hh1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR10MB2723.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VuIW53iARGgKbJXToz6SOKO6ECMtBeWv4593g9USkLJ2Q1UO2nGXpXqgycJE?=
 =?us-ascii?Q?XgXBdirFXLP0UU2zkCdrIsZ/ewkQ3e5kOahY+s5zwKzI884VerZJ4tUjyUq+?=
 =?us-ascii?Q?q/8px/1aRM3QmrgAQyPuJdAxvYtd3QIV9rbQLDIeysh/hM2Pk1TDHML+hFBA?=
 =?us-ascii?Q?iA6Di01YLeOy93twVHKoF29b9trnzxxXgu7UIxhc3D7IFW3r7axCINQmLuwR?=
 =?us-ascii?Q?fOPcwDZJopHquAqywVFkzLkjwqVmetASi6b4D3U6UnvQT1bgW9mNgZU6Xa4J?=
 =?us-ascii?Q?+kK27uasUUqZcEKAyjBMCQveJg+sEPWyeeLRqByVPuk/TaYbRfOyCQMy83l8?=
 =?us-ascii?Q?gyDk9TCltgq5sXMAVSjIcPxd9XQHPmGr5rHYlEnKYHi8Ct92UJxyNCLYJZAf?=
 =?us-ascii?Q?Mo0ZGHegtVHYNy8GkMyPIjttOJ/EqXMqJB+4WhmTgzGANFDqh9TXVQXBhvTY?=
 =?us-ascii?Q?sEZmgb9mq7T9PosS6RS6I9yfD8AHoIEYmUCAYhYoYR/rjWnJP0gpOsQCjvRS?=
 =?us-ascii?Q?H76LaU1iJd8l5DFj1Mfm+WnUHn1NAJJsIdHkMmqvR9idOVIJXAxSjYDViyG3?=
 =?us-ascii?Q?/3rNJZSAazCIDHeXHlMcc2H22UGHo6V1HRRmch2SjmgLmp46YO/aU65Dcahb?=
 =?us-ascii?Q?fnsWwlErQ8K87DvfDOXskQCGodFwhqNDKLU+RT32rfxof3y3im1I6rV/l27n?=
 =?us-ascii?Q?9pTd+JbA9hxTAz6ymPrc4sLZugVsEU44kwnaIPRzl4oLiuP9MdxNuruEB1pG?=
 =?us-ascii?Q?3YG6+b1CMaauvn+OVGEuyE/2mWOU0NWL6Lq5t7D6itxr4xUutW4A6NI1sXX4?=
 =?us-ascii?Q?v77tGhcbFkPwdeSA86MpLDnFcc31u5l9NWe7XmDVgAlDmPo82kseDv7ZkwRO?=
 =?us-ascii?Q?IAgLK+/12ddITG4eVBuEAbs7gfoLdgKrZbyHZ023BIMQf6QgpugsYJoj51mA?=
 =?us-ascii?Q?YIkTERrhQRNeUNHkSVQzaavxEs8dPsSSegE4YUpEJqYLy7fAvfzGuU/KTSTc?=
 =?us-ascii?Q?tyjBB9bAtnpxx2LPp4jfnYivhGNtdHoXvmfTeXTrOlzRFxB8oZmXoSQwgLOj?=
 =?us-ascii?Q?3HWKWFqcaVedOcm8zWqXe4LBCGt751Ey4e2KtpBApTuYtJkh2rtYt0015HdL?=
 =?us-ascii?Q?HjiTKu5yzCdfH/Lm6Cc0wJzYCs1BHlEAjX5FMr/1jN8UQuaRLJ2MMxg+7Amb?=
 =?us-ascii?Q?5f95S3vD1GWH7ogFvD6F7OdjaYr5otuHfaaCCq5lE7xzE5Mbv5q4WE051mqM?=
 =?us-ascii?Q?KineVNz3Dj4GPsRPo1V4KoE4pMvlgLF+uTl1Ta8XZIfU0dT30FBE4sKbPsl6?=
 =?us-ascii?Q?Nw7p/cTpLlN3uNnkN0R60Zl7wE23nzZm6gPhS10YORGq4rasjHJIuPh71tPz?=
 =?us-ascii?Q?krqqgUN/kz0h84S8Z8iqjzclkGLvUOD3GINd/oPLCHpTPzGKqEa1FHLjztp8?=
 =?us-ascii?Q?JWdDS2wK6dRtlC35HS8kwvBYhkqfk/Ku3fpOJc/gwTZve4ThEOBEahnYxOwq?=
 =?us-ascii?Q?G3vtbnrSWfAkdZQ8CzQwdGq2UTtarVs8yd1TQDR0rRMrlwxWvMkzeKdEvY1f?=
 =?us-ascii?Q?jpNi2vlyrjgjLfOBraYDYLN1n+ETT0EWzElHJQamnfJuj2xk1awtZuoZluLu?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	P1/ZMy2fbftOmhVQfRkC5X3jNM68hRIBvs1Gk8sc9xjPMnqyzFo9HEWLaH5od7wNjSg/RbK6PK+QamFy4Xnaz/YbtXYpsAjEdTdUvffoP+CGxu6ZIs7sezJhZSJiIUMMZQ0+SUJBIpPgpvkSC++q8eMC1ephT2PNRZ/q2HIn0IDJcfxlXMsGEbAKWpZ/TrCQxxh2RJYq7rebFrXo4NJ+viW9AWcJZqBtvoo4aeulmtT6bJKEyNCYhhYex7OVFTWzDC5W4LD0cp63wKPUhA38EC187VkFvCj7alWdMAxlC/HG/EWeiIUlZN2WBDZCwlL5LXu2y3089pa13Ell4ivwSvbRzR/mTG6ACsWKoLdgBmL+wMvFyKYit992HD+n1ZFlnguL1zXTTC/REQ1TxK/S+JMbEbZlTCgTkuhAAr2Bmon8EzjbCmR17xBXhmUGLxjBXVIdHeayrf6OTdVvQs9H0+XxKGfqNDdpcQgqFC1NzO5Y1MqbHCZK0ECqrktrhKyl7Znhx5dhWE55lFgmLs6/Q8KQ1jPgrk1ZrFFY5/EYafSK2xGKMCjpwRbdbDSPtnRD7424D6qPfVNTdJ2vCt7e1JcdKsM74VuzhZ7+b9rFI1o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12ea5be-33d6-45a0-726b-08dcefaf385f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR10MB2723.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 19:58:22.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sUu60MhjpDJ4TL9p+f2mzsbKHtiyKLp1n17YfhkLKHk3PF1qpixwgefBHRPBHWtLSgNjhlwpuAEFRAWgNTaYvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7202
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_15,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=848 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410180127
X-Proofpoint-GUID: EESLUVIxE4IEKiHUBl2TWtp6TcBMCpGe
X-Proofpoint-ORIG-GUID: EESLUVIxE4IEKiHUBl2TWtp6TcBMCpGe

This series adds back support for the probe foo (...) : (...) syntax
in USDT provider definitions.  The dtprobed side is routine, pulling
in the DOF and adding it to a new set of dof_parser.h records fed
through to the DOF stash and ultimately to dt_pid.c and eventually
dt_prov_uprobe.c: the end result is that the DOF for a given probe's
remappings ends up in the dt_uprobe_t in more or less the same form
as it was in the DOF.

After that things get tricky, because we want to remap not only arg[N]
but also argN references (the single existing test for USDT arg
remapping verifies that this works), but the SDT machinery depends on
argN being unremapped!  So we do the remapping in dt_prov_uprobe.c and
tell the higher layers that no arg remapping is ever being performed,
then do the remapping in the trampoline by physically reshuffling
the arguments.  This seems to work without breaking SDT on all supported
architectures, and is surprisingly simple (at least, it surprised me:
multiple places where I thought I'd need hundreds of lines of complex
code turned out to need only three or four lines).

New tests are added to verify that USDT translators work when types
change, and that dtrace -vln produces the right output (all previous
tests for USDT -vln, translated or not, are currently disabled
because they all use wildcards: this new one doesn't).

We also fix a couple of tiny error-related bugs encountered in the
course of development, one in usdt, one related to the print action.

Nick Alcock (6):
  error: add missing EDT_PRINT entry
  usdt: get arg types and xlations into DTrace from the DOF
  dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
  cg: add argument remapping in the trampoline
  usdt: typed args and arg remapping
  usdt: fix create_underlying error path

 dtprobed/dof_stash.c                          |  20 +--
 dtprobed/dtprobed.c                           |  12 +-
 include/dtrace/pid.h                          |   9 +
 libcommon/dof_parser.c                        | 167 ++++++++++++++----
 libcommon/dof_parser.h                        |  80 ++++++++-
 libdtrace/dt_cg.c                             |  35 +++-
 libdtrace/dt_cg.h                             |   1 +
 libdtrace/dt_error.c                          |   3 +-
 libdtrace/dt_pid.c                            |  71 ++++++++
 libdtrace/dt_prov_uprobe.c                    | 165 ++++++++++++++++-
 test/triggers/usdt-tst-argmap-prov.d          |   3 +-
 test/triggers/usdt-tst-argmap.c               |   3 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 +++++++++
 test/unittest/usdt/tst.argmap-typed.d         |  40 +++++
 test/unittest/usdt/tst.argmap.d               |   3 +-
 17 files changed, 660 insertions(+), 71 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d


base-commit: 8a1264bf0e818c8624be250eb5174714b62ed93c
-- 
2.46.0.278.g36e3a12567


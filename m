Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9D0183CC5
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518545; cv=fail; b=ePlyhBVNljWoI843QCDkLajQGElWKuKVxnO12nLnN7fd4VZoC3CwWNoIfCp7Bxoq43tF+8cxrd6uLqInNJ1xwVatw5gxtagjMGQhLDOs3PZAZp1VTM144PbohFmObEpXderzoJBq3AyUoDEf2HedxolPFxZhEjpOPxzwlObFWqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518545; c=relaxed/simple;
	bh=X9l0X/rkAJicIOT8arRnf4ESRakPbCOTEZkhV22c/kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PQ9y9fFPKp/qphMcWTZXn4u07VzauL/jg/pYsGJ/rFHVKiO+cblVAvM3s0aoYUYdz7ek3DtaDeLHpy2SV4srxwgpGOZiMnGvtCTQ02h7C4LH0G4/j0PhWfDlOMR1Malqj3y8JlbM7y866Xfyf2D2ET2txBLezyGv+VbQpR0Bsgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B7hiGRsZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wWEvpVuk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B7hiGRsZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wWEvpVuk"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4717tUR7023214
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=EDzETRxZoEVC9VEpWglPki07fcsAGI2AxNcgJaO1wvs=; b=
	B7hiGRsZ8qT/vBJmavSONO0O/ceCncaI0MeNRXPxksAJRqxkzHTQ6AXvHO954eLm
	6FB4dPVWgKv4xLsCxHTzzEfhS/HA24tI+XuI/nMU/QCz+dcb81+fs3oT2GQp1Ds4
	JAbSuLtuV5ZXPi/rt7knBeW+KsNXZvL2n6YI6caXVD/2dGkZCJLkBExuH0HQhvU/
	e4zwWQSDzmoUD2BMWGfed+2lSbX/2SkqYtwT/so8VkFfBAwaQsov+dE7OZ5k++l3
	H4HtBCop24H3jbqaqPLFlqOotJGfXE5dsgAiYPL26CUKpKmmtFivzm3B4OF7DZKV
	+IZme+u9eCf6Cy4KGBQbpQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqp21u58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471D2576029016
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:21 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmpt0kk6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dq6uX7lQImWqOkd2LRZcLP/B9lLPAArIdOEsHKlB24JxXwc8Fs1s+ad8i5jHnoPz5SG3LyRYWcSrS82bioG/HhWPixvePjzl8bmcch50w95TGSSxYpejq0jJWGNcRciXZsv0epf4xe/RsDFvK/HWGbWZu7fFkBeXI4lemk4yLYOafCAsvShP9GQn37zIiSLXtfmCYgy7qf/WCHMYH5l78XFEMJ52wM8V8xu2juEa/M6YORVnXemDrK8jRJzyWZQY43jmAEul8LBntPkF/8hVwYDy5sPE/duF7A1pxMmfch5szRtAlg7MR70CO8RYzNPcT1K9NiHzeEi8IaUYAg4U8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDzETRxZoEVC9VEpWglPki07fcsAGI2AxNcgJaO1wvs=;
 b=SNqK/zMMi6p9rDVqqzRYdhE/hG1rdAc2E7TEoIppSNlb+xF62sq7n7fE18qu9SzmmxNaiKE8pxQhbnwQXD0POz1U591heLeoAyJRbHRb3CM6zU7XbQQ/EStzHDi20qUcK3RXksQ9ZpYfexE7tqOuO7+sY7veJqO8xd7+aidzvXJCTpmrKH0WvG6bKToWYYe1CDkcV0Phni9fo+hEdxc0ZMOtSsorp1f+InK24NJErF8yF5qtiSDwPnXFZJW9UVnzyEzgwikWebANJkTdfrIqa2GUfZ6HTmAqvvvQkFwL+XJUmePk+DTZuI+GNlpyGZ07hnVphw/tlAMAzrzzv7VTZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDzETRxZoEVC9VEpWglPki07fcsAGI2AxNcgJaO1wvs=;
 b=wWEvpVukvmrn9RnphfMicMm5p7moY1Q/a2yvtBDClOeLB5ox4us1o0FN6WVF7WfrsflDzjo7LoPrz80iD3RmAgVbRx4WW/ly8UUngBIZQTikPZYl48nFy0madtA1NndjiamQeSdA0bIPGm+53MSdwg7Hdw1ITPImbfiP77R5Bq0=
Received: from SN7PR10MB6595.namprd10.prod.outlook.com (2603:10b6:806:2ab::18)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 13:22:18 +0000
Received: from SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf]) by SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 13:22:18 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v2 1/9] spec: install sdt*.h in /usr/lib64/dtrace/include/sys
Date: Thu,  1 Aug 2024 14:21:48 +0100
Message-ID: <20240801132156.286780-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.277.ge12b8151ed
In-Reply-To: <20240801132156.286780-1-nick.alcock@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0545.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::13) To PH7PR10MB6601.namprd10.prod.outlook.com
 (2603:10b6:510:205::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6595:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dde747d-e696-4bb7-1138-08dcb22cf727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YR9Rym6kfP6bX73wd2gvKr7+cnpahZ2QgobRIzJtxaCGsfgD3NIGTfRFiseO?=
 =?us-ascii?Q?4XGQdC/pq6Mcp1OYFDS53fwTNuOOpbNfiCttZFPXJoHv3Nk+9onHrMDczDzL?=
 =?us-ascii?Q?8O5xxwDg0YqQuCb72I1Z9kMGwmSSYnoU1Vwx18gL9eA898YlDv9UZVjBYWon?=
 =?us-ascii?Q?/pN6rJeURtIV8pN9WFnRRDk+6ND3l16xeE1h4Ep15rkPpV7Wlei3UwxTVOMX?=
 =?us-ascii?Q?t6ITnsZP81I3zjalUnuRLGnpV+QG8eBLLNjpLyF/07+YfjTHiMgmHVymGmWM?=
 =?us-ascii?Q?jDg8gbVWOW+dY06LQtVwhuRiGg73dU4TtIj/dMpgzG4o3vJmP51xvpEC4ru1?=
 =?us-ascii?Q?JXhr5GiMQ+BY9S4Yqu0o8m77kaxhfriNbYta0bNV7C176aWphF3LL/XwwvtV?=
 =?us-ascii?Q?8mLXiksUap/zwvpsUFf+N1OiZwuVyfFTQ2SVTERIkzicIdDsxIWDoiFqGJTH?=
 =?us-ascii?Q?tQovkKSlAzl+qqo6rirju97W6B3VVTsqIKgEdrrOuENAUXyna5w1WvFqbyJB?=
 =?us-ascii?Q?rrV45V5/8ZxSFez8BoQ0jKmQgJXLr7fAyVY6EgLtEYjMeb+d3+sNn9wbB4xX?=
 =?us-ascii?Q?rZoECM4gkpEiqnkvzTdy+4JdtA3xRHEIHDw9JL820ALOnCFieldL50S9kerk?=
 =?us-ascii?Q?x4Frk+fNJmc1TCJURbEHyYmjjUQGjjaXlB3c+arwKCgcar1ZfUIuEk5Sp5yj?=
 =?us-ascii?Q?vEitcCICKrOOYHIJ4HMWLAgVE/ztGCt0AXWx8tU2TRvI7ukhRaf5yRCb0Leb?=
 =?us-ascii?Q?Zkh+6XxpXAstRx/tebYykVORywk4nvKl8ah7r/zZtLKVqtv9Ikm+zaQlyYyl?=
 =?us-ascii?Q?ZdJHlQZWPkhnF2pzwH9zIGtfaa/w55fxyZow0EHNUzmdY8A6HUA3BVmejvzL?=
 =?us-ascii?Q?UAfCtS55+4eVOYCmxvB0XF97MsMnpqZlzKey4ma+I0e9vA+ZqQfEA84sSTsC?=
 =?us-ascii?Q?XGGm6M0cu2QDxUsKv1xmi3GN0vhJUnS8INKC4pGRQN6hqmh6qHSNNcnfCJ8L?=
 =?us-ascii?Q?T4fNjcqEJacBUnIPdp2F28Fd016sA2iiit1rdu3jaUq6gtdOhJ/bvy6LzpDU?=
 =?us-ascii?Q?tFlVp81XKdJvRUcLIsyPigNMmBMTMzA+RjmSW2f/ebe01Y2YLgkUQ5NyH6pj?=
 =?us-ascii?Q?SQ//xO5rb6q48uW4/1+1b6mxb4hXHktNUmxDOrREUrZ3wBSpv2vxgmswSKM4?=
 =?us-ascii?Q?8bNFITE36x+MEnmJou53B33TSbHakAHbFqT9yYu1OyQ3ec4Wtcp0lglwU3bz?=
 =?us-ascii?Q?PZDSldK6f3JOMvhFl0UmG5q0AmNmt/BLJTtvyGn7Wbs4/gXdUlZHndDgol7b?=
 =?us-ascii?Q?+QUTjEYIRceX0XgdHOwKN0YtC6xYEGa1yrd++M1bop5JWA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6595.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gcdlvq82hbCdGaHOZ0XROv8dtZq+x0BxcOPdN6l+vtx+w668OTdMEDa7CrJR?=
 =?us-ascii?Q?j93pqcgmHhegM0M4M2oCB9q1vYIk7Whd0vT2Bp0tY6dXNQLFp1W92eXDrwaO?=
 =?us-ascii?Q?56IddpZnYXqplfuRBdZFR4AdoShmUrHJan77imv0199Umd+vu18MxCOBp+EX?=
 =?us-ascii?Q?ld/Ek5D+ANSYPK9w6u0Ou9+3AmCffRBQor9Li+AAFj2mvrUZv1oi5RS1O0M9?=
 =?us-ascii?Q?CUMksI9zzgX7v245ZajUYFBcyEGcIvm51IkJYodLtQz0B/8NExaJOPGhBRLc?=
 =?us-ascii?Q?DoCYOejRT6BS4ytVNZfcy3x67LR05TCZ2MRVNStvocs9aIsL8b5VIuhzrjQ+?=
 =?us-ascii?Q?jhzyTN5Wm/AKB3v0LxOXMD4nqnpRrl10dsFbKEm50aE2iwp9scyR9CUoFlhK?=
 =?us-ascii?Q?ERX9xaehjhDyhvbExgWeJicdEENFxMlhsiLWFkMLnC4BQJr1qm/28nwMfQwS?=
 =?us-ascii?Q?jxPJeVQbBVRp+DuKynTmsX5AuQTjQ7ypqe5pEpVXwIhi4T0nUAlQpLl+ILeQ?=
 =?us-ascii?Q?DiyTOZfzoJH7PK91DFOF6VVeIM4jdf+H797MVrlPcwr8R9NmR3xsa0SRttO0?=
 =?us-ascii?Q?3MPJ+zIKhPHVEms7hhb3mXwIFOptBz02o+g8KDxW7aWzmGOyg7cKxkocMvYP?=
 =?us-ascii?Q?GgOdq3O4taC/HozoguD4tbVDO43tVIEcxOEa8h9V6wIONQGnW5+hMhtS3WaT?=
 =?us-ascii?Q?lU3qVN3tLrfY8vLoY+MK1FH9EDWB/12Ku84cB5n8f6Ky6L+z+qlyLa+5yd7i?=
 =?us-ascii?Q?xWMRIjupP9F1t3Wo5nKj7qD9/helXZaN2ACYVW6oa80IY3vprL1XOhl0nzGa?=
 =?us-ascii?Q?ITyg5A+XsxZGhr7ITRZ+bcPyRGXioKOqLNtqubDQRRmCQBz8qN9/gavR98NP?=
 =?us-ascii?Q?WfS+7EbN4JTCgsWXzQyzdi1MfRj5aEaXo+dRS/FK4VBTAhnginkiVcP6leQY?=
 =?us-ascii?Q?3CPJPnYAK4t/zO6rgERA051Id6pD/2BCJe99bgabidAFp3wbtehx70O1O5Ra?=
 =?us-ascii?Q?FWktEF9oedXWsN+4L8tn/Z1nUUeqw2MThwWUmBu846fo1jvG+DDGdM3eUST9?=
 =?us-ascii?Q?JaRdr49CAhW6m5Ng3XzbmCaY9o4nYtl51Z45fNHQRPTlhP35uYqRjUKFINOC?=
 =?us-ascii?Q?0GUIs+t7EufJmrF9bfIhway0x8B9YfunmUTyt76SH7UI0qByuhRAFNGS4z/i?=
 =?us-ascii?Q?QvkJDH8mbEf4/qLCXT+g6TmYJdOv4rQ2hcyvnBsnkyjG39GixQKGZmBntqoY?=
 =?us-ascii?Q?AS51wHlS70vmZwFcwMbn8hNx6C8vC9kOJwvtnvIRcsJmXfjElHdrlcvpwGpp?=
 =?us-ascii?Q?D2SJjbVELcHfziREj1KK7XXiPYJ9UQvgRVydjzYDUMOaipdv9Aayl/ylT0p6?=
 =?us-ascii?Q?sW5L69r9hIsv4Y8pi2Jt8NZ4sCISABreqNce6lmbgrETPduA3M3kK03pFjzD?=
 =?us-ascii?Q?rmQf8oiJ9RIhaSnybCMxM//0RqCy+OFzxSlcLLo5LHo+C8eP+W/tM0JoOiBK?=
 =?us-ascii?Q?1W0RouvGceDv8DGZFrS6deeWNpxDcJvzew7dVuQpb5TkWZQmu8oTrrY7uUcG?=
 =?us-ascii?Q?+zVHjsG1jUPf41JYjdPUDfcC3aq5olizbEW4+4/c0A0g5J+bcCSQxyaVpR/K?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MSat2YahuVQuEY+YXVsU7RuVTtuyU84qJy5lMmrDQbQumoTckFYbd6+kXiokMkiWuHB6Q2fEC2uK7GaiJakBTiVFbXarxrlIVFcV4fRGZOFtQmqXBOT4TuCuv69r1b9wLdTLQ3zECUeiBqX4TjYddvFM0O8DozXwL6kdzg+wBIp4Yygnx7DbG80lDYqoLgD0Rj5AMmuNPGiHQ/SEwnfxApDNIh8Dgv7jESv8crySTyXMyfbG7cR/zQovcu/skZzl790VYPAJtgEIklso/yTn5GhTgAOn5Dqc3BCdTVLCYGkjQsnIBQrroOguxgYTje9YgCiq/2w1LrgAnMiEjFJQa6GtBDKk6OdPAtSX3uX1CFNs9K3ujNIOT7nsuipp+ZqWxQhSeh+8KigNpNtulSrVdoqMI+rOzo7LlfTyfF6Z2RRJ2IG3X1tIqp0xUx0oW/0nGYACv0cWDWu+a/clkBf3bZi2ccBfTvhQZzj+kHJ7NNQNLAwBETE032N76XEmzGX5egpsJHwLEQpQKGK6rOxGaeIaBLFjnIEHfKJ49SjlsRI9xa9i3uZDDzNvSeZKk9mXoJFQjlzIbc2HwVRmiSSA351rXUXWP6zqec3w0e1sd2s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dde747d-e696-4bb7-1138-08dcb22cf727
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6601.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:22:18.4920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d02KpbQhVC+3SrakXOp0+bMc9otQHP9Cx4CqIxMWrPch2+4bAowSdxtNxcNbueZgXaiRxltGQgItm/qXCkeZZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_10,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408010086
X-Proofpoint-ORIG-GUID: SHF_gh4kLb0qSrDM-TMchBZR9pneiBqx
X-Proofpoint-GUID: SHF_gh4kLb0qSrDM-TMchBZR9pneiBqx

This is the specfile part of the sdt.h move, rendered more
complex by the need to clean up the mess left behind by the
old sdt.h renaming.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtrace.spec | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index 42ea9bc33958..28eeaa478376 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -86,8 +86,6 @@ BuildRequires: binutils-devel >= 2.30-58.0.8
 Requires:     libdtrace-ctf >= 1.1.0
 BuildRequires: libdtrace-ctf-devel >= 1.1.0
 %endif
-Conflicts:    systemtap-sdt-devel
-Provides:     systemtap-sdt-devel
 Summary:      DTrace user interface.
 Version:      2.0.1
 Release:      0%{?dist}
@@ -194,11 +192,6 @@ make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
 sed -i '/^ProtectSystem=/d; /^ProtectControlGroups=/d; /^RuntimeDirectory/d;' $RPM_BUILD_ROOT/usr/lib/systemd/system/dtprobed.service
 %endif
 
-# Because systemtap creates a sdt.h header file we have to rename
-# ours and then shift theirs out of the way.
-mv $RPM_BUILD_ROOT/usr/include/sys/sdt.h \
-   $RPM_BUILD_ROOT/usr/include/sys/sdt-dtrace.h
-
 %clean
 [ "$RPM_BUILD_ROOT" != "/" ] && rm -rf "$RPM_BUILD_ROOT"
 rm -rf $RPM_BUILD_DIR/%{name}-%{version}
@@ -222,13 +215,14 @@ if [ $1 -ge 2 ] ; then
     %systemd_postun_with_restart dtprobed.service
 fi
 
-# if sdt-systemtap.h doesn't exist then we can move the existing dtrace sdt.h
+# Clean up the mess left behind by previous installations' overwriting
+# of systemtap's sdt.h: if an sdt-systemtap.h exists and is a regular
+# file, move it back to sdt.h.  (RPM itself will identify and delete
+# all the other debris.)
+
 SYSINCDIR=/usr/include/sys
-if [ -e $SYSINCDIR/sdt.h -a ! -e $SYSINCDIR/sdt-systemtap.h ]; then
-    mv $SYSINCDIR/sdt.h $SYSINCDIR/sdt-systemtap.h
-    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
-elif [ ! -e $SYSINCDIR/sdt.h ]; then
-    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
+if [ -f $SYSINCDIR/sdt-systemtap.h ]; then
+    mv -f $SYSINCDIR/sdt-systemtap.h $SYSINCDIR/sdt.h
 fi
 
 %preun
@@ -253,8 +247,6 @@ systemctl start dtprobed || :
 %{_sbindir}/dtrace
 %{_sbindir}/dtprobed
 %{_mandir}/man8/dtrace.8.gz
-%{_includedir}/sys/sdt-dtrace.h
-%{_includedir}/sys/sdt_internal.h
 %doc %{_docdir}/dtrace-%{version}/*
 %{_unitdir}/dtprobed.service
 %{_unitdir}/dtrace-usdt.target
-- 
2.46.0.277.ge12b8151ed


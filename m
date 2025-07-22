Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BD622A1E1
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753181170; cv=fail; b=tID3nsHTEWYR/xq3LtEGwjqi+M3mDQjuDnKV5k7bgmL6Tv4/CE/JPYqh9T5ONFhVx3ZHN0Eqab4RV2l2P8HyWAZqSIthZha2vOVnA6zN1WuKEEhTWBd9b60vKoKq3Ldo2QGed2JE1s8ETqbVPHgCDqryvzpmmnPNl8TBpTa+CXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753181170; c=relaxed/simple;
	bh=ICyUvYHnNjkO/Vs6zZJmSnoDJ7NpI/GbIVl/RZIpJ60=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=Un7igWWArpd/4dpSLAE/vDI6+RCZLNkfPZHV9oB50qyBAA103rLI9JDeC8fauR0VtiT/ZscHf3ucTAvOpI39l0/+7JPvn9RtaSLbStRtgl44U1tSsK7gxuP7W0L16lU9JjKILPc7aFKF7ow4ml8sMoqcV8/nZTcqxliavOM+SME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nqXIitlJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=u//FiWHd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nqXIitlJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u//FiWHd"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TC5j031671
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=hlT7MuB+Q4tSQRPg7a
	NuseoKVZYqufRsbC1iHCYPVGs=; b=nqXIitlJCMb+grJwQHFglK+/uwyIvfSBpk
	1stDAf98W3RK5IDXQlz/TzuF1e+YG3LT3zPc3Ywk4ZbaT+TA+TgBNrXvGGQ+5rYC
	OwWbQiBWVOqCQZBrkhDpZaf8CLjYJXDD4VzPokwZVZ9J9f8WWOhe5H+Ys8Rwy4qZ
	/kqPWNnyZB2Ao/txIPzktnHlyA/r2PHCmHw/XWVhoX7HTj/FFdazKwJW6dLPelRC
	I1V5dLK0D4yQUGcOyFuatvcBAGO3HpHjoWAmoMsXxdkzAS+a/pf8V93p1FIimx2v
	qgfeUC0W7iEf8Tj8F86snt4L2WRZkJqC8Vknoq2oaaUzCtKyzLHg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 480576mukk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:46:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56M9lP4q010337
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:46:04 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012021.outbound.protection.outlook.com [40.107.200.21])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t96015-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:46:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQvnyUeFmh+ZO1I2VtjucEEB01aHAGd8Omck4Jjry7weaaMO79It9UqmvwMq5SSvcQ0znxAbepiWeMC9KievKT/q0eHFmwc0vMKnE4yazDZuT63wCDtGAtFgz/03Z288STt+2em49W7X6v5qcDZxxtb0ajZz4Ee5M0gEYZAek8MeekwyN/VonCAW6zRwj8feCYGKJbkLwXRCr0Ca2Htp/q27T9VxxXW00uFyPr+A+VonpHDYB7S29QabosGNhgzlumXBln/I7giVgRQXK8TpkSCtbNxqg6zG+GwBfDbdLzTL7qNGE9SofpPzM4PmZO5VWbqBsDW7/IivFOnc4McUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlT7MuB+Q4tSQRPg7aNuseoKVZYqufRsbC1iHCYPVGs=;
 b=Nylv+R6lCZenMlKvqjZUHz5ofyL9TdcL2GjMQXU7hduODTbL0pQBEm7ghlUlFwbWXB92gS3IJjtd5N7MKta03DySJomjGppletuG+IqKjxanhf392l2uJvQcMrPdlypxs67ARw3273SJJLnfRLeoN7lSWAtLt63TYMoAQl8V7meEYWkhw3k3lI+HJ9kOYk1HNM/4Cp5J/IOiVDCTKW9W2bYyw5P/kL8ipSYssSA2zomrbylS3l7r47MJRnTMKbeHf83ynlZF5N1Lo1jLk6M0al0xY2cf7MwuKB5UevFOUDNXDbFccYDpRkUgpBskaNd4j4IWkijPbMLW0ovGkeRG/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlT7MuB+Q4tSQRPg7aNuseoKVZYqufRsbC1iHCYPVGs=;
 b=u//FiWHdGZf2sgu2Hk+CIubblsbVx8Q20UMyqzuorhyuAHjnIJxIGE17hgKtjHYb8FRvec+xAbPgk0+vaQ3C+RK1OONHVDmK2V+4N3TAKfNGi33Az3ipkur8EP7FSw5ZbaVX5kbUkv0fzArJU9lb99c+biFB/rl6EZ9eEl2PIRs=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SJ5PPFE25FD365C.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Tue, 22 Jul
 2025 10:46:01 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 22 Jul 2025
 10:46:00 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] Optimize USDT discovery a little
References: <20250625060305.15707-1-eugene.loh@oracle.com>
Emacs: the definitive fritterware.
Date: Tue, 22 Jul 2025 11:45:50 +0100
In-Reply-To: <20250625060305.15707-1-eugene.loh@oracle.com> (eugene loh's
	message of "Wed, 25 Jun 2025 02:03:01 -0400")
Message-ID: <871pq87bc1.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::19) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SJ5PPFE25FD365C:EE_
X-MS-Office365-Filtering-Correlation-Id: a7dbea3b-cf87-46a1-7955-08ddc90cf2cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5vz7pZ4mmihd8l1fsz8TLrQmW/rQy4SuCvnr5OVNS9chAgKUt3h0N42q7aMd?=
 =?us-ascii?Q?8INlQZGJYtUYPP5fDY1IwYVvik8fsFi9ITiNPKFSX1TQ5s2egRM4lyzeYdJ8?=
 =?us-ascii?Q?Sl9yAap05O3f6+7WumwVJYkcm1DQhLHW9c+NvAbN3GWZHhZ8kyz7WevVdBu1?=
 =?us-ascii?Q?Q4bjRuHyIhRs7NHLpm8TndJTnjRt5CG9GJSeKZhmdhX2cIjkwy7x04gCGUYo?=
 =?us-ascii?Q?6EhLef0lLnJhYa8lMC4q5bxmluAB8bElm172yXL3h9z32CSduaQZJxolfJ8/?=
 =?us-ascii?Q?HkyOFWwxVLYbdK7xK3A2Fcspp0+l8eRFo5EsaLI94t99CEzFgk7Aoax5CMMV?=
 =?us-ascii?Q?Oh3FphpIjhXjuTreC+502pqu3I08kZmyIfCRGrWRCEt5QAqQ6UyeKohGC/lB?=
 =?us-ascii?Q?rh6wkMMAhPBzmXclSlGK4F1tjuxkAm0N+QCkC5bvw4Bx5+u6WKEEtvGDoi/F?=
 =?us-ascii?Q?fsCOSBRIO3Ppg9rFMhbCF45la1ifweA6t1bHD3BUW1fZ3rlYsPnPV29Q9Wj3?=
 =?us-ascii?Q?lmOzHBUUUazleafnZ7jOMhWVvlwMMGeGhoK8wY7WuugZu+cRbiR5CB9EWAgR?=
 =?us-ascii?Q?tkmIwePLehEHmTt48QSXpg9HSIJ7qqEaTsaaXyH33UQuiqo4MZri4M9Ylo68?=
 =?us-ascii?Q?Q12w6rLvxwPNBF/BRxA8amVuDnb3drHyKT7RvyjOhr2w6FYxqzKBb5yX6Wrz?=
 =?us-ascii?Q?bTDhXHPCTy9NUY1jb0fwKxfSxjYiC3FjBfVXny0X7/J33qmF8/MXKGYpeIcZ?=
 =?us-ascii?Q?EAq9Z7pXuGKbvl/ITDmLwKk6NYptXIOZcFr5hC7DcnZhfGB0DuLDfbfFV4Wv?=
 =?us-ascii?Q?EAJmGBkjZSR5d7+XGUqDfXUvwkyvhuc780OUSzr2CERV8eaTaJv4hpfKsuGm?=
 =?us-ascii?Q?Q+UX7ON7woxePKL3Yl5DZtpO+8gPFgks3w+WumoGSzjvMO+cm1mGwabhY7M6?=
 =?us-ascii?Q?vBgzQoLt3nippoynARzsDxJQSYrYC+pUtA5Wza4x3Hl6lnplO+b2SYGc1V97?=
 =?us-ascii?Q?d41KtH3RC6QSq4rl6mFXZ/aAMI39D6co5tzCW8QIEXHj01QQx6G5HiodrXfB?=
 =?us-ascii?Q?pfDpxKd6Y8BDAeVUZFPgVRS1TZrYZ4RKDsm2NPZ0cjA7CiS5D42TuSfEpETH?=
 =?us-ascii?Q?rxyEhkI7NwwThdZoZ16PUAF8AQOhIUCemOOVqbuM7iNPTUggV29ZXtPi8XDA?=
 =?us-ascii?Q?QkMy5jKSKwTYuwxSzXDOWU4m6TYQeqZxrNU6FIQ+bbmCrXWYQDnUYw9Z7oxp?=
 =?us-ascii?Q?N+r0ErXuOEKW91LYIgrYbRHEbDu7jVGlPavCpvfUpzIAnIFSWzhMaKrPvMCv?=
 =?us-ascii?Q?v6R8w5kEpxLw/rsZLr5cshGpMCxCLlNDb4p8y/opp4dkWueZ3d3jyJ7pg62z?=
 =?us-ascii?Q?kKB4CA2XqpOtyi8YClUOXsYUsepuXDin+8DDv6FSvuKwVRlXa24xchra3I+E?=
 =?us-ascii?Q?kyQQJx/tFek=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oXAj0PThOdZ8hhVh+ffOxhwn4EtNpqyi+NIhHzwXZmEV7R0BV5IV7kXui/YF?=
 =?us-ascii?Q?eMvbYz3WTEA6BJzr+IcHcRQZPSDuPXU71/OtLSN49rtqu7aJzx3mAx9V97Mt?=
 =?us-ascii?Q?CeNARlFZkFrWei14k3C/MZU7noKc8SfJ8K4rECUvQFIW1C5cuUBCbOZYMMtl?=
 =?us-ascii?Q?6hLHEJF70FHWtkYcC5nd7qOXUYYj6vmwmOcrqWfUuySj2GfCeh0Lx1wdQLLj?=
 =?us-ascii?Q?FjTHebd7L/wZej+K4feI6DG8RV47rpx4eEZtQFBW0gd7mkseHjPHXI8Q56+A?=
 =?us-ascii?Q?4MByKhuxpU4h11agkxdUN+s3MnMvOa3ug7JoS1PshJF7eMsis7KzpO4rGosR?=
 =?us-ascii?Q?3BSqPFitg1+E1iKGgO5MtpgxgEsB4zUJXuq4+ywGgpuFhis12kk9ZVZjLit+?=
 =?us-ascii?Q?Ma/LJbZ4LO6vLkL3ax0bMZIDDma5ICVCrtBZs0Az9O2S1DhjNPv/LpsZx8Fq?=
 =?us-ascii?Q?ueXDroZaXEGmVgy/6kKdW/0C7CY/G1yEXD7djeGPKrlnmULR4/a9IOlADuug?=
 =?us-ascii?Q?EBCXaH2VM9HvWO8iOk6yOl1CAHMNWMIRHXwUT2JYK10hV2LRM+ERPYsQJvO6?=
 =?us-ascii?Q?8dMtezDTA2fHgGTf9UhBfcRsaf3sBYiZpFrbGwVnG05rf1NPmBqS8CTY7o1q?=
 =?us-ascii?Q?CxW8EShTS5VkmsLsEHrAtZsCs1+17dFyNSyIS9CV5GKS3LRcBYwKL17VSfSd?=
 =?us-ascii?Q?cZfw35bdeGGXhxd5tLMs/Bnwgw5jZHgO3piwQLJOYpftvP2d+PESnxCo4Gbo?=
 =?us-ascii?Q?IYjGe5i4MKEd2u2Y+jkgPsZKbAVfpUVG5cX3jQMlULpB6b3q40tw1npv0zdX?=
 =?us-ascii?Q?il3Xc2d31CIkesXupxcUfm16VxAAhK1E1nWYWQ+99lPqTcM8vGEDfVGf2jOK?=
 =?us-ascii?Q?qBejFYc+9sPEdOF3WFG+D2Mm9N7uDOQTzro1dURgEwXLIXZ7kgXePEiffxbV?=
 =?us-ascii?Q?tmGWf3Rl6fkksz0QJ+bZEPdz5JcB6OA5NvHprr52mzNRG9yc3Hg9NQcB0gv5?=
 =?us-ascii?Q?+UWsV7kC7WbV/P6/7RSnY2N6JYjgJaM8beXBKawekmQDK38NJeAB44QhX6Jt?=
 =?us-ascii?Q?0liw0aN63FuDhHMacWHeGyBRxQwlSdPxdzOtih7wTa++m+j2sNdD9C5mFy2h?=
 =?us-ascii?Q?IRgnhbZhJTIklZm9iSl9qbPy9nHhvesowtdvy1UhrfKco2Wz7wWx0/S2DtQi?=
 =?us-ascii?Q?Z5x7KSozIwgtK1jjV8JJ0DJzdDZwMsPfdSQMJKUsvJlWsmxyxIvQOwJ+lSYZ?=
 =?us-ascii?Q?pF1uM60dq/hSczkFG+3Z8NTh5fpG5O8vHhttRTGEZbDr16cxyLXBBS1YMcSD?=
 =?us-ascii?Q?y6A7Ft8U3DU5C9H3+rq51ev/lxEbLNtpSHs1DHkzHof2bWJct6nZyDwC/6Y6?=
 =?us-ascii?Q?H9J4iU+U1Must5UagtwDFr062/LNW5QCEpArBmSdbpul1/sJjeJfBMQcZ/jn?=
 =?us-ascii?Q?I+UDp5dVaE79ZwnfkWlXX7imi7fvxHYJosvIC8BZqn2dC9DiQJ71konWjV5D?=
 =?us-ascii?Q?wKCfePu68PaaewSBxQow3Ca7CLBnQNTUDxDiCAs9liJlWaUdBGqKMc1iVzGD?=
 =?us-ascii?Q?3OocKDlvgGKviiF2qGrA6CcWwVTrtympSnIBWWRYxoBsMiSwUcHhv/LY5Drr?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YcvDgU+31XBXtmR37+dYSKK7mmZs+Pr47kHLJUA0OxWcQMZl0rrVH5OSkriDqJW50rxP3NTHx36gTw/sxhYelz7Rkk9dcTDLJTLBwaWNVjINyVWHdVJvPQxc1HXigJVA2YhHY5FJYVmZ0SGdg343utlRSB+pB6LW/mp6+UzOlZhVGjKhVnbfoAjfzJHPdCiFlKnsWNWP5lqGX5cIG+9vVTp3aMcmtDFj2SajXcoMZTXbYoezNhjse1AEW3cKX7hxozMPZXlI3tOVFuvShGNumf3mSnolVAcUVRNp7UjYmyijbPcGhsJv4kfzOn6epmndL2uWPBveellej43qi6vKF94ONYu70K+WWDKbBpAZV3pbjiLlu3R3j0Y0AQc1SfCSrnNqa30m4eXf4GFAXT5xdY3ASP0CNZCTyi0BA4JtylZQ8DLshKZOdvZPbKVNcLjzz8nkUPHxadYpsAsZZmBGX7ikx0/evdO61R5yqjhqEqgEBAzOPZwC1S/2EoQS5VpWmZMzKhmvcNlSdbDrDUpPUCejxgz1UQzsOt01DK8syJNhdHK05tZF5zIXtTJ53jlXG2XwOMZgTGIKG0PHarFtVozgDh9/JmUHPhY/vBdlvGw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7dbea3b-cf87-46a1-7955-08ddc90cf2cd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 10:46:00.8422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfTe/oOZCxuKdX/P+G0mQ5chpHigs2k+JMgR2jjU1hovoIlhlEd4X018598Ve/YuYmrQ2LZm7j6Y3x1N5wdh5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE25FD365C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507220089
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4OSBTYWx0ZWRfX4hGuc8qh7ZZo
 qqHSIr4eAEt47MCmNf/k4J5CPlNOWnpvCYvdw2xaSDOKbx+WcHavBe7XS5D0Lr9KzE1/2V1cMqr
 /Bvkfke5d2y4UXXdI0ocMWzjfYi4LjgQ/OtbgyzgbuQ1Q6/EzB8clenXdECHAP5LMC6lSyCHtBF
 QACWRIposX90AnZMJnwxwlYMsV2t7NvylT0IGHiWh9DiMN5eo1SOYkm9fP5Yjq3EimRQlTdKt39
 7aX1wkAQcm7ybvpuuk763vV9/BcufEumO/yr86RiGPWtUfvfvQwZgHQ6RmHekP4Dp0Urh7qsvF1
 Jaikek4FtrPxAn3aMChZp9mtLBayZ+/+JiABrsGC3JzwL1S4TaIGBoq5MtPz3uByMYOzKmZQvPh
 dvVT6V3YmKnNZWlJGIPhZieAM+QjF6S0iNF4MSAht0pYZR53jUkh+Lv6s1cYyZVvR/ERaktX
X-Authority-Analysis: v=2.4 cv=doDbC0g4 c=1 sm=1 tr=0 ts=687f6bed cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=PE0_wtC8llDL1Pq7dcgA:9
X-Proofpoint-GUID: o8vc43zLke3CZPAI8MkSnEIIMtXeOcaa
X-Proofpoint-ORIG-GUID: o8vc43zLke3CZPAI8MkSnEIIMtXeOcaa

On 25 Jun 2025, eugene loh outgrape:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> We want to reduce the performance cost of USDT discovery if possible.
>
> Specifically, a number of statements -- with probe descriptions such as
> "dtrace:::BEGIN" that could never specify USDT probes -- will not get
> their clause flags set with DT_CLSFLAG_USDT_EXCLUDE.  So these statements
> get considered unnecessarily during periodic probe discovery.
>
> Therefore:
>
> *)  Expand ignore_clause(dtp, n, uprp) to support the case uprp==NULL.
>     This case is independent of any knowledge of a specific underlying
>     probe.
>
> *)  During probe discovery, check ignore_clause(dtp, i, NULL).  This
>     sets the DT_CLSFLAG_USDT_[INCLUDE|EXCLUDE] flag and allows faster
>     exclusion of statements that do not need to be reconsidered.

I'm pretty amazed you can even detect this optimization, but the code
change feels like a good idea anyway, if just on code reuse grounds.

> To take advantage of this optimization, users should specify providers.
> E.g., instead of "BEGIN" (which could conceivably be a USDT probe),
> specify "dtrace:::BEGIN".

It's a shame this is necessary though. (In practice, nobody is ever
going to do it for BEGIN, at least -- but it's common enough with other
probes to be worth taking advantage of.)

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

modulo the tiny nit below.

> -			char	lastchar = pdp->prv[len - 1];
> +			char	lastchar = (pdp->prv[0] != '\0' ? pdp->prv[len - 1] : '*');

I'd be a bit more belt-and-braces here, given that if this goes wrong
it's a buffer overrun:

> +			char	lastchar = ((pdp->prv[0] != '\0' && len > 0) ? pdp->prv[len - 1] : '*');

> @@ -555,6 +559,8 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
>  	}
>  	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) == 1)
>  		return 1;
> +	if (uprp == NULL)
> +		return 0;

This could do with a blank line above the first if in this hunk, I think?

>  
>  	/*
>  	 * If we cannot ignore this statement, try to use uprp.
> @@ -751,13 +757,9 @@ static int discover(dtrace_hdl_t *dtp)
>  	 */
>  	memset(&pcb, 0, sizeof(dt_pcb_t));
>  	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
> -		dtrace_stmtdesc_t *stp;
> -
> -		stp = dtp->dt_stmts[i];
> -		if (stp == NULL)
> +		if (ignore_clause(dtp, i, NULL))
>  			continue;
> -		if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) != 1)
> -			dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
> +		dt_pid_create_usdt_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb);

(straight moves into the callee, ok.)

-- 
NULL && (void)

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2C423B604
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770754613; cv=fail; b=TeTTLUK2wMKzri2v4CvldwNV/SIz0WpMs7daac4VGLcbIQ4rWh/YUEISn2jdar74jO1V3SU7wj6Gk5o3cL2XIowIwjHYJGYChmy+lAAQEPlvnUUdc18hRPOyfA2J2lS4Cn0bqnRCvbvRlrGuW6NqxzdnAb0XalF2K55BdnFHp6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770754613; c=relaxed/simple;
	bh=M09WAW8DI5KmGHgEZ0ruq09EYtVnGIn31TL/mw3opkQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HJGEpRxYuD0EIWLJ3ugCkM+h/du+kA/Sydw5jAQJJk06NcCjyy/F4jzN7UtedGm6d3w0alFSTQZYyCpmZltRoaJDzayi9zsUnoLP42roluwCQRy//3pvlFKgBWST7l+2bCavHR4N4D4MnNZq+IHJPhBGxNMJFHAsW73OnZMa/1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pHaS3Nai; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YSArf7r1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pHaS3Nai";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YSArf7r1"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AH3DMt3924178
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ycS4mZqyAmj6/nfVqp
	rBd/d418MNW1mNewLXvDpwftU=; b=pHaS3NaiQvFvO3Vm1sDnai21aM3hz1TgU8
	W90InV/iQTcWj89m2uwhp1RZDxUCANZNb3rlH20E4yVzmCpHftJZwaFNOqm8zUwu
	/HDuJMeV1kDjoPMipz253INCD3PmQuMAT5FnCPb7EMKxj20BZ1lb+Z9RKS94oRl1
	Qv3GlZeQrkI0EDm/Sok3Wk6ucMCSOiROA7kAVo2oAiUngv7VrJtSmjIwQFRIXIRF
	VHiz/0yRLrcDyqumFLc2CSQkgZFJ2ge1YCAyGLy8GiUCXDVBvrC0e1pkyzDOfGjD
	EPDpBC9M5vZxU5me26K8n7ApK5Z7JI8kH+qYwqE153XSmw6oltwQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88qt0cw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AK4is1033687
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:51 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8245ae62-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6esAnufj9HTpaKeFkqmj5Z150LHCiH6E6gVWrI/y+2pviFfcA4EvYjb7IE0F0JKSUh3MSJAHm1+40X+U8ohYzNudm0uw0AbcVesaowjsI4acUfTrSY716qyqHkJkSAyIkR5ikL5TpIECUr9c5CC5rEbOIrQzSQfiZfe8fKvoTgc0qOskhQ0oHaSv8jcjDWT1ZAPDtUtrzc/2H420dN8N5iaMriZA85e1nGn0HKX4Np1GShrAW+9XIzJ7c+LC+qPB3eyc9JA6b+L0z6dpHhQp0BWo9t6JJP+UWaROa1ZIryKe1rDjBf6fZSi2D3qt5XouBX1178G71Bch4j0wxQnMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycS4mZqyAmj6/nfVqprBd/d418MNW1mNewLXvDpwftU=;
 b=B/grZuW2zEdOelVjXayiYEA3jqUAn1FjRQlQaf7uPNSj7SJqK+VGFMhsZD2aQIMxLJCKEWd+bAwX0WkYWu5jHnoV9H6gmuisS7j/AUJZpwKAN2s9D1txsth4GCNeCAiYikPgFKUAbtUBYAwZEdXuZMN7A24U2OL/DtJJMF5KvSW877ayMWtw8TbsBavXPsrwruH8hWY5T/Wg3Vwq1vvAKY4WgRnE7uOWRyyGhFCC21dGIehg91WlHSHHP4tgprF2stsMwgkHkN9nw7nxJpz7kfFbB6vXgakry7I/xhoewoEantlkpdBO3ID13kVOEDvJkeua5rQd0y3fcNdu5P5Nwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycS4mZqyAmj6/nfVqprBd/d418MNW1mNewLXvDpwftU=;
 b=YSArf7r16iPQnqRRb/0TwNnvMhvKQUoKwIegBYJTWQiwikNs1xKzskG1wh8ERpyTGMGea7tJ+wt+q5oaxhIlWmvhVNS9dpSfzfgCYJgxUlNtAFkkeL+tOhUpo/YU4cY1uWVcRJzuEYsjHYC4MjaHK4ZB/8pL9VrIYkPimfD4FHE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4607.namprd10.prod.outlook.com (2603:10b6:a03:2dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 20:16:48 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 20:16:48 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/3] NEWS/dtrace.spec: 2.0.5-2 release
Date: Tue, 10 Feb 2026 15:16:37 -0500
Message-Id: <20260210201637.8863-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20260210201637.8863-1-eugene.loh@oracle.com>
References: <20260210201637.8863-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0027.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4607:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4469e2-d280-4e87-9ed8-08de68e151d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CVI6zj3p+gPOUpPMQHAjkOn/ivhPIp3I1B0nUdGdCz3y45c+KMCIQvY79S/Q?=
 =?us-ascii?Q?8u73pB1o02c54vdTdqDVjYAygal/KwYr3GIpFg4o442x7sMAfrpaEQ9vFRCk?=
 =?us-ascii?Q?bBlG6n4vsO7bB2TXuzffA8EdILq5N27gB7Qa6d2PybOJdjb+2eP9wJcY/QDI?=
 =?us-ascii?Q?L1iAYkVHGx9krpNXayi8aYqpXsuwzOKk2bbfKWimaEVxNGJ8McZlEKrMpZF9?=
 =?us-ascii?Q?jlnP/E5iTaCqwwEgpoR9V3xcCwTUjUa6uyYQkkXl6j93ofz0iagKLFixFnkb?=
 =?us-ascii?Q?/ZVY7iYcOObW3Ek27RflKC5Dy1b8WPZYd1h0kKn9wXVaZ873zYyJBdSsV7sp?=
 =?us-ascii?Q?9QT1qMv3h8GMW7Lhm1eFqtQv/ntxepowlVg2rM5lWuGpRfybL16f94lF4O8r?=
 =?us-ascii?Q?1ymqH09xJqYhShwDQTovny6EEYVBcRqUav3fW5IKYYOJahA03DVmULBUEa5g?=
 =?us-ascii?Q?cULLSrh6yJ5nyr1kt2wsDdmZaxqEHT9drHIQ9bqZsg17RihoHX35ej7rdioe?=
 =?us-ascii?Q?8lvVydND02lVNfCTOv+Jo/vqp2KNG0JSauKh9aGg0U37E+2tEGx1WzHWWzF1?=
 =?us-ascii?Q?y/iqefqky3XrXwTP0LZ36vV3fqxj+f4K2d3aXsnqhghgXjfMzm4mTF4avUXS?=
 =?us-ascii?Q?sveB2xolobNROIu6DO+gisVC1cMTPOWGJPHdI27txnKeCxBZPC9Nml3WGNS9?=
 =?us-ascii?Q?HLHQuwYnmxPM5wrPDZw7/hLWJCWVbOUk+aREX3DvVwGyWc2k/gf+PywoZ41H?=
 =?us-ascii?Q?DqlkIWIa7p+bf9GeMEhITq/yRrZku/4e6RhgIUttZwxB3BRVx61SLDy0a2IJ?=
 =?us-ascii?Q?QX6acXLApsLB3Zlk6TWhgAev3PUVoMWfYOGeyVssXfuCHJGKY9on6PfazWQN?=
 =?us-ascii?Q?qnSH28PJdFNC4Wxg2eFsdz6pSpzSSyejMlfC8nGJHAuxnwtnoybv5WzCFYPQ?=
 =?us-ascii?Q?aOSI80XgGnvLBZA15hBD3iTwApLeyPxt2XeoE0h3qs5idho4qiUjncg0sYgn?=
 =?us-ascii?Q?M5SvmNS/KMC4Yz0UOW0Rmypp82b0YTNDZEeOOg4iCp0pPqUseljm/eHUeHKh?=
 =?us-ascii?Q?wdRe8bXB1J3WRDlV1ak7QkE/RA34XUK7JEmKkRSTjQLPyMSlGtOGgLouxpjW?=
 =?us-ascii?Q?lwLfE1Ln5AqRPRW2CBC+YeP17NQpikDN/SnTvuONjAs9Xe9zfugkvsJVCaFJ?=
 =?us-ascii?Q?dWfunv7/3BxprlKTS2aUZAY7eYc9qH6MLa8DGjMgsBRPvcA+hayfIzTzksEF?=
 =?us-ascii?Q?J17T+EzCCgpyivs0YCy+WS8AEY/77ooDrth/YzlgDDfQwk7htw257uXeOoyu?=
 =?us-ascii?Q?BH7p1disKMPTjYvzNAoERsWe2JTJ5zkItmOWGxNq1fbRNQyPgn6o1lsLawqk?=
 =?us-ascii?Q?ogtm/bgbOAxUgZBpB3xG5MqQXBPKW9IjNLj9LbxqGCf7gokiuTNf9Ch9sV5s?=
 =?us-ascii?Q?Tq+cQfZrpE0rRL+RT9yJv/AKXL1J7RGLYBPlzEFTccwvpOtrB/VkODns0l4k?=
 =?us-ascii?Q?FZw13DddXt3F9AbQuogXaij5QO9I9jdEcO7TFDvUay2CJiEHwEghesc1OJqu?=
 =?us-ascii?Q?GoHI+KzBSvmpeGKIVOs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L5hxP1mX1ms8S89qNLunWu0apDQVE00aFQObo4o07z07y7lqtK3zLyUk9kKo?=
 =?us-ascii?Q?A3SblM/JfRz7zSnebvAs00f/cza/fN8Vzvntrp3p8EZYP9qlAZkNRwUmoHTq?=
 =?us-ascii?Q?oRyd2XAp8C2sWVgMYPNDIxeoK9Qq16yWp8D+3AGDujzF7kW7NoRdutw74/dZ?=
 =?us-ascii?Q?7iZUOGrUHpEzChsuivSvwZcUTIJvfyrea+9hfpQnwr18E4Sw7FgD+Uekm6Bu?=
 =?us-ascii?Q?wniGpmsW7xmLHUv8bFLo++VPpdrMzk+bmm1LYvTGuGH28dgOer7vylxUPi3Z?=
 =?us-ascii?Q?qI+jAxfXDPWkSIs+TFTdG1tPOvWMD+83Y4angM0fKRrvlz1bTooh/lh+8A/5?=
 =?us-ascii?Q?XPPccTFs0FGHDoxXAQjif7TUOZP/5SjVEBhDuY+lEYlXnaXOu0tuFGWDaq7H?=
 =?us-ascii?Q?6NStMctt0XJb8Kl1ZHJEBQ39NZfPNZninqqDDtF3DUYEBQO/rQoFDT8HR+k4?=
 =?us-ascii?Q?wz9a/0DfGZugV90rBUOnKdqE2nkrGyhx7HbU/rMd8b7C06rcgdqEaoNJhwqP?=
 =?us-ascii?Q?6rhHCzoWPrtQFeUNHd7Qk23LC33PfbnYcb4QODx5/Rp11Ynlz7Wr6kvlTF0E?=
 =?us-ascii?Q?P2D007+7yNfMyxV4FpOukumtD3nJ3wPfz8k7JqzP7a5k+9SwpOOUs95fGu5n?=
 =?us-ascii?Q?Xyr3V55iWoKC96MY+DIcC+XyvJ52w/VEi6mW28UsS9z4AovhX2L2A+QGgMV0?=
 =?us-ascii?Q?CPrM6N9FAjp6pOcxdJwYIX7T92bKOpWOht0ipkSurEMprt7jrKcJcYiTp8RO?=
 =?us-ascii?Q?ftauuwUTLgjQnr+6/NytlyaE4rsOqzLkY+l4dfCUwuzrcnjKzXxRx4Xue3Vq?=
 =?us-ascii?Q?DwStaDUZYGOiPOHy8xei4F/xpuOw+O6UxbJrR29QotKXo5JGfonmIPywu2Wh?=
 =?us-ascii?Q?4eFLCtiSmqcG9daSwEGiao33i4JBwYPmlLY2JGmAmByUrrVS1ZaAAt7TtDO4?=
 =?us-ascii?Q?B6clun26mdxM43vv+abeCIi9J8KfoEHwjpIdkn7stt2PqjBKtiG7vE9XRbfY?=
 =?us-ascii?Q?SHEUMtLNoejHMUp/4ChX2qYybAby0UEMGZiTlI5UtZ3u3wG+KENwEW93aNZv?=
 =?us-ascii?Q?sVenuZJ5XvPcv8MOEhiyCB2sYTcHd3OUVnuTA2UGnP/LHQMaeyyPDesUZ/7Y?=
 =?us-ascii?Q?5vBUiiXFCo3HLwydDQ9x6DclotQc/2HRiCVknjaKYal+W5iAHFKYUKwuhr12?=
 =?us-ascii?Q?+4QVes6Mg3dOE8svxLAu8lDBdlAEVTgzG8nrnaEtQEZJWdhC+m/NGFaXJ3d9?=
 =?us-ascii?Q?wm/p4goRMer34E580Tb82Y8XRYbBIMUPZ0n84WQI/iAigBgnfFWD8zz/mpWq?=
 =?us-ascii?Q?i+4oJNFSjexqpZei4LFywbpngIC4B2VBCH0xd5xMUw6rkaIDly+W0uqy7509?=
 =?us-ascii?Q?5RRrld04ViJmSnkX1+1c7bYNNV8twNdQ9R/hml0eMlstPZKMVpGZ1auVEsEV?=
 =?us-ascii?Q?zkrbccKYiblDAse9xtaGhebPCLgx7KeA2RjSxMzPYYy59tpWOsQpVkNk3QPT?=
 =?us-ascii?Q?aKUdmeQ/lIFrgKtfFm/xAXogiIFWlExFZQwl7voc3rJpKKCzRGlbJjXQCSsA?=
 =?us-ascii?Q?KuUxtseBQesIGNerqkCabigj7XufzcokztHRtvgi9kHd4sGCebcpXnLESe2b?=
 =?us-ascii?Q?44mDMJeje9cK1iA84Q2U8ie29QpkcKzGkBOFOWHgc1HbXMx99Pz2W6cGr1O+?=
 =?us-ascii?Q?qqGEYcPVmpKi+b44rQkvHP7JdKQZvWSkS7Dat3eBw3QCBWhs8MRm/v7rlnQV?=
 =?us-ascii?Q?OprKXO/msg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NKHYlGxX2L0U8Bx0xhN6dFuLoX1pYPYPlm9a/JQ5u1rps9r9pTViac+PAsetjrBGdSfWNwEyg2KALxh3XJGG4GUSFVGPb1nqJy1pqiEOYVRTfBBoZyL3CHHUvDRGY/CX7oEWmnqBFdr+wAbjw1T6UWNrPI993g1JuXy7YzC3XkI5FhiOa8ioMdd/7qskKoIxrNNuR9lbdnw2KxsH87R7K0Y46HiVWM8UqAGLYFSG2xXpe7dR7ul6oWYmNgd0p1BWfkPj+2DZURwIEnnxLHTkXJ2nuh7cFgTNyoh1Xfe3CPJcu3D0LB6mhnL4QnSsZnQOm9HuPIXGI0tpxPINzGrtEALEqUzUN0Us9TBiDvafZ9jVd/j9l27iMDkapdXRkjs3HX0KQ6+IB32KwzxiKdKWtMDlwCqSfUWa7XT4zq8yIzjQzBDMVgP86yUtsyHtoZxTBdgU7QADEmx1tgWgDH9iI+qpmN9GEeBENPFlzTCJs58QSZjKcybvKLsEtijxzWHTsKx8gRkB/qKcG4t5xXu2wwIgFCc5cnTjwJhg9KqE66K6Sw/4V3q3Br+HOOiB1Bq2eSw58x9pmDI6a0DkyGUyInY3SZSe+qNg9voLM2U8238=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4469e2-d280-4e87-9ed8-08de68e151d0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 20:16:48.4324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LD8mbAMcwCa2mMNj65PrjeabUFIBOc1OoRE+WfUOe/nOTJWVso9KMkZsyJ0reFdGTXuc4EIKoZr1n1AsT/Rjaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4607
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602100167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE2NyBTYWx0ZWRfXyyGmf4RG1A1k
 0bC8SmEB0AFxVdo8YN1i3Ba57pC3biEFUFQC0h/bMDEHCq8VaEC3o5sMB/6Im/wXg0Z30gIzqyl
 u8An6ZoJklAaMMBXDT8KL+M1ua66Hpz3cROH71HfkmHj1CTKYOIDN+RbJ4eHAHlNHjS/PsTk5im
 cWRzxJV9kW2Tb1ch5MDbVMUkk96+2bmLpOJTg1IyAfeTte2m4jVWKsi9ZeByF5Ujw/zx2wLn6bN
 vVZ/C7Kp0gM1zc2rfvCD+hsubxqEP/eIGld7V36LMrv8VJhR37AJ8KI4xe/65c+g2bZKPQtY0ee
 pf+ybyD63htU8ZFRj9QxsevI2s8VaklBOcA1mISQ9WmMeixoVAXqpVjNsHW0Sbe0wwIQFDMXvfY
 l5Gp7g2bsVyny9srhOuUXg3C+9uOBrgPyqEdFPfy6ZuUEOwUxQg6e0ENWyOFoIY6e27OAJEDY9M
 zbo70hA1CNPUu+tw/6A==
X-Proofpoint-GUID: GUk36EnBaXR_SqRz9EqZLv69y-0hy0yX
X-Authority-Analysis: v=2.4 cv=Mehhep/f c=1 sm=1 tr=0 ts=698b9233 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=vQRoIAmISbQbEiobHJwA:9
X-Proofpoint-ORIG-GUID: GUk36EnBaXR_SqRz9EqZLv69y-0hy0yX

From: Eugene Loh <eugene.loh@oracle.com>

Update version to 2.0.5-2 in a few overlooked places.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 NEWS        | 2 +-
 dtrace.spec | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/NEWS b/NEWS
index 9c62e523b..c76ac114f 100644
--- a/NEWS
+++ b/NEWS
@@ -1,4 +1,4 @@
-2.0.5-1 (Feb 4th, 2026)
+2.0.5-2 (Feb 4th, 2026)
 ------------------------
 
 New features:
diff --git a/dtrace.spec b/dtrace.spec
index d6af5a80e..54d8f1239 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -230,7 +230,7 @@ systemctl start dtprobed || :
 %{_libdir}/dtrace/testsuite
 
 %changelog
-* Wed Feb  4 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-1
+* Wed Feb  4 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-2
 - Implement PID-specific uprobes.  (Kris Van Hees)
 - Allocate the buffers BPF map to fit highest CPU id.  (Kris Van Hees)
 - Fix argument handling for multi-location user probes.
-- 
2.47.3


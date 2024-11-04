Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA020326
	for <dtrace@lists.linux.dev>; Mon,  4 Nov 2024 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730738332; cv=fail; b=GCGlt4j7usJRWWMLOQS+X7HZEfjJCesSgfclUotD09egB2zj17wbq8ZUWvp62vBV4FJ1EAv0GHkxKd/NHk9j5A06kPZ1vtc9cbP71esXwwDffRHihYsngnzNvwre/hvjDuj4Id/uyIeqAunEYec9N4hNZC2oVSPLiOKjpR4A2ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730738332; c=relaxed/simple;
	bh=tQ81cra5d5q+G9bL65xRfU7K2p5MlKvrJBYi7JrVTic=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=KiOQ2zd2i9ciQyWf+BFvtrYisI4DqQQy52f1WsHvMVFffG1NyFLOlh/ZVYlHnlGOd1ZhC5bGh3+GL49g/IDkBj58iA3OgMbKsF9U2dvDmFDNzAIJyAmHRas1OrAuwLSEYe34G7yxzBPZVZK9951ppwzbvKkUWsKiGBpCRRtNH14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=akO0t91A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s/+IPmUu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="akO0t91A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s/+IPmUu"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4GMcWF015619
	for <dtrace@lists.linux.dev>; Mon, 4 Nov 2024 16:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=wsVHuQLHst2ONL5X1W
	Ys+9COPqqHVA3WXsLtnGHvewQ=; b=akO0t91AesVSrBNnaQo4r3UHl9gTJW5zdO
	wskVZyFtKt/IYKfS/BgY8HITJHbXYwXZSiD0ammWwHnvou1mGRbZp+NW6vpUmatm
	hPe1G+NILEFg3ATc6ToI0Q0EMTy6BUb4Vq04td93JIwsLuVpT2bQE5kofaLVDHH5
	7wB4ryPWNqoeeKKkkR3oIjMfut+pHgw10oIr48yEV2wjfDqlziphY8BSysuqVIeM
	XZ2OKz7zGCnhs5bb+nDi+ayRR8JSba1kTsDgASg8ackCvRK4KePc63fC2OAhEnwg
	Z6H09v+SFx+PME5yhMxcJXe/DSIvgZDulB8Bp3p+p5l6XvO2JQ8A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nby8u5gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 04 Nov 2024 16:38:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4GIJOp035232
	for <dtrace@lists.linux.dev>; Mon, 4 Nov 2024 16:38:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahc8xfu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 04 Nov 2024 16:38:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwa727/vMIKqMPFWJz1QscnOVE3m9JgxqErLv2ZsmA/iMf1yd7WReIgL2k1RYLPxGFC+SnsHNH+UOG8KvRti0+qSnetvM9Sv59DS/GF4cQBtOXhL8Mrezns+Rr3VObh1YSlhYh6nt79PRUMOBmihKMBFfuTwV+BmxxK+ihgRXeV36VFX2OrPXkNpUH2Hvm2EQ7hKoMMGJFecRl+svoQhp2CIpeS5qY5m9GOSyaM/rkNVyXSyfk51SklAUJTbT9ncPfyM8xkILbOa9m3TQUIqwWdQmlO75qWpPEFYcsjglMyCFBCwMr8H0xzUyFxFrNcYJUvBqoZ2isI1ZUbvlFQtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsVHuQLHst2ONL5X1WYs+9COPqqHVA3WXsLtnGHvewQ=;
 b=Sr8pnYbOjNzHQM0i/2rwq5hDqSwgYUUhtU+GjYkK6P2uFqmEs0JCWLNNkAmnP+muED6/HHv4u6TVpmfyaaBnCownpFMzvEGwfIfufC+Dk4yL20BIOCryMc68/1/GsU/xCxh1/S+hHG6rgWI4v9fS5A/DtJ0Q1st1toBvTEib0PXJ1G6DNwW9tVpinl2/1Pa7GPrKtTcokiE0mzxxmntn8GzOBFYXIC1VbbMJt2V7v6TWVAOxhqNtqgsDicx+fJr17EXX5IY5obgxBDbBV/loUVYAvbs/SrVAcoDalJJhzlpl5ECABfLVXfVv03j5eW5SBuBc/TM7lpWhJLvN7t5tjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsVHuQLHst2ONL5X1WYs+9COPqqHVA3WXsLtnGHvewQ=;
 b=s/+IPmUuawlnWYK5xB9IdXOlFeGh8Ll8/yVBedjIvjAOZvI8E0TR388m43j8f5iy15PgOiVq1UNHLnAFNF/TLIB9n03XxYh+bmpzhgJ32imF7fRdUIVqhv1BpyrD8v6h55dNJeSYd9zO0QzPpssuk88IaD5ygWA0ZWlti+DCDx8=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH0PR10MB5004.namprd10.prod.outlook.com (2603:10b6:610:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Mon, 4 Nov
 2024 16:38:22 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Mon, 4 Nov 2024
 16:38:22 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v4 4/5] usdt: typed args and arg mapping
References: <20241101155712.397674-1-nick.alcock@oracle.com>
	<20241101155712.397674-5-nick.alcock@oracle.com>
	<ZyV7wuoL7J6us1ri@oracle.com>
Emacs: a learning curve that you can use as a plumb line.
Date: Mon, 04 Nov 2024 16:38:16 +0000
In-Reply-To: <ZyV7wuoL7J6us1ri@oracle.com> (Kris Van Hees's message of "Fri, 1
	Nov 2024 21:09:22 -0400")
Message-ID: <8734k7hs3r.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0559.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::15) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH0PR10MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8960ec-d811-4694-0609-08dcfcef18d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jCDHCPJpPCaTTZyqLhmauytGSP2TZ0SaGR7r+cx5x75sQegLdXH1VTLKklUA?=
 =?us-ascii?Q?kCbcWb2/VcEi2c25DuVatYtLscXomLLdzbQ8FRfP1pSjEVBDqnK3wRCdbHo9?=
 =?us-ascii?Q?3qsmwisrL85bAwjE+uvdFwX1cHBm2Dg4fvyo6oZPupqs6poeWdWPZPcXApSu?=
 =?us-ascii?Q?kbTtBYoDuikswbC06JHMrcJoIl8GVtd8TLh78rEw/9xgQJERLLnmSl93XYkK?=
 =?us-ascii?Q?5wzYX69THFNynOvs0GQ+vnvWaYZefVq6j2c91kh1h1aiM7AV1RVQ0Q4qXNpu?=
 =?us-ascii?Q?SqHcdKJtphodjGzGkh7+2GdnHAmqDp7x1bRw8JNSlYMJ2MjUZ9JYhBi6Nobv?=
 =?us-ascii?Q?gJZsCg4k99ctv2NcckkSJQomYgN7rH50NxFVEdzrOqc4Z9H2y2pLch5jVK3V?=
 =?us-ascii?Q?+7nOxZefL+ruIW8QhnPuTyCRRV9d1JF37kq9SBD7hOYm22OdOqPBACLMD3mP?=
 =?us-ascii?Q?JqOnWYXRP6Tr4Ofpb7Ao5JNIFUnLxF6Au0o9zGH9IQyJrz71JEE8hbmIwoCQ?=
 =?us-ascii?Q?i3hvSqsFwcx4JQAxTaNiJhISoSPdhHsQsh11tpsueLeB0LJULLiNiPeNm72m?=
 =?us-ascii?Q?ZiGeq7sr+Y0o0HLMe6en1vCQlYdbXszDbrGpTWsR9o8u2NoCJHhCuqj3Zwuc?=
 =?us-ascii?Q?FVrm8O1tQ0K5CMx+nbVErvWiIIN2S0SugQ2nKdkZH1GGpQ0cVQ6y3VYHYd31?=
 =?us-ascii?Q?f8cWHIVK/HkDEu5H9F9U8F6dKu+RGiwAHwbob/1aShPRD2s9rCrDbFT9R9n7?=
 =?us-ascii?Q?t99GTjyF6GzEOqeztWsOgKjIUESAbtBSaZvuP3al5PaCiI1XGWR4hkIUkAvE?=
 =?us-ascii?Q?CHzI4ZnFmJKk2WYEXeKuofmTUFE5FB+V7oDm9+iyviDfMqXcYSEDIbtquZ/Z?=
 =?us-ascii?Q?8RmF0rCCrLF2Lcj5LM0CAUDdEul3U2c3Jqo9HTniUvUWxUV67Vclg+UZ2cFz?=
 =?us-ascii?Q?JACUTdBYaWp2F64OALuYEHd8/Unw0IyjVaCToZotW238pJNZmh/x3oBIBp3q?=
 =?us-ascii?Q?gCcx3t5rOT8X9IWF5YxTA1p6Oc+iGuxWjQ+RvIiklsuGyVWwZKH9Vp1Mpg6w?=
 =?us-ascii?Q?S3m7aJJtum9w45SKICZxHLJ3kAtlHwzAqw+Npfy0+dI4ZSH7/Dk7JOolo4Ac?=
 =?us-ascii?Q?HydASAu+nUKtZzpKGhChhbayaB9Pv+kLThdpuYCtBIoMkKumMP/ch+jdKuy4?=
 =?us-ascii?Q?ylAc0oKAq0RBLKnz5W++XQDGH5h131p23KDhUCD5VX388IxsIh/bE2Pa8/5F?=
 =?us-ascii?Q?4Da631kFwnsmZ+vazUsQrVxomBkS1Mh/8qZ62e4iZX82CvdF+wLeyAEKvfpd?=
 =?us-ascii?Q?SIXRzBqNriFLSkLMhQ0Xf2Uk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1fvaixFK9s0fb4XS9/QMmWK91OYR5Cu4b0U+Qxe4qAvR+TAmHwGF0/K6Mykh?=
 =?us-ascii?Q?Jyf0vOH9xJZu9DqTLA2yPFdywMAPu7kIb3gy6vThxfkkFqWxvX6yrSMUzdDV?=
 =?us-ascii?Q?Ox8PTtMvSDD3CLUX1OYXUqfLc9WgxvaJX1jqywr1sgEpyBb9RWtqCggqHYPL?=
 =?us-ascii?Q?XXhNpvCa8va96aK+ciI7It7h8LrjQJ98AnJ7/yqA75xYcwZS50zqXrNeBB3S?=
 =?us-ascii?Q?Ev4VxvmKLlJFyVBxCg7LaeqVfwxgEuQGoNfU2lNUPcYcpdOs/7M3btLpe4dz?=
 =?us-ascii?Q?cYhL/eg/Zquvdvce14oY3lOdF5Q5BfiuihGYdKGViReG2XYVawP7Ci7o1VTf?=
 =?us-ascii?Q?Nl4bR8lQCtXndKwWuGVHQXpdZmTPP9zVtDYwlY1SdSvaFw1aM/+jAyVvSjKr?=
 =?us-ascii?Q?JUkxvY2Nag43Cf5K9v/nEgI87WhgoP9t3QjmqyvFWttT33HiC2h/x9B0EkYd?=
 =?us-ascii?Q?s2YaNvc+op1rQcCktMY+ChkMyBzZU3fGUHdUAGytkxwGrC5JvwlKvg3/maFd?=
 =?us-ascii?Q?jN0DXxsGGA+KsBCAuej0cIDny9FU3lcqKWQew7NECCLoPJAk4ALRqQNYBKhg?=
 =?us-ascii?Q?iBGNu8iC+jNYho3P9ZHWjapg4LyCPmALltUGpIf682Z/LXzs3ipll3P0ORmc?=
 =?us-ascii?Q?SV9KF5/HU3tz3MMQa2ipM091vhhfneQtZldYs2fpc9V9dcmN8d0G1MctEG5v?=
 =?us-ascii?Q?zxNhrh8jv38jzIBJwQcyuDzHi9kQqLe/m7nm81W2cy3WejNT9wO+xgvoZi5e?=
 =?us-ascii?Q?m5nmCGen3INQgwp5VNZUfgx/MArAjJsIAZPJ8RMwd9c9HCoxEwHCWMNE0IBw?=
 =?us-ascii?Q?Ng5rJAco+rjucgfVVYnvid7Vu0fx55XKvuzZ07KBLUTxMokl80cgggIVI0CK?=
 =?us-ascii?Q?hJAk2JBA4UC1/eIeJTpZcT4p0uzjdV8lxKI7ktXQLgXquM/tb/HhiT52Fiwm?=
 =?us-ascii?Q?nc4CM9olAQSgdVN797O8MmeuThfo3UBOgmuISSs3iRApoMSMe3vcvOy1Q3NA?=
 =?us-ascii?Q?69JclG7Va6Xv+kF96fQ//Q2OZIgicHsDE6yean01uDyu1Fk46OdVQrOLKAi+?=
 =?us-ascii?Q?PX4phMV2vjoF8C+KoDW/+JCZVRAoGdOzl1XuqJkkfEpzTQTqxRoG2+5C7Z8k?=
 =?us-ascii?Q?HYvKf8sh4G7JxGCi1t//7EVcC7wKS0ib796LrLvaQlDVx/KGRsbGvtGplWwi?=
 =?us-ascii?Q?W+32zl4UHqwgnnVuXYxj3XaaxD/NZm+3CODyfrkXg6E2NMSwj8bj2K39Wxb4?=
 =?us-ascii?Q?JjPwaXcf59zX/o+XtdAI00Vp7p9NzT6QV44374vaGztiy74f2rirXY+0KUcd?=
 =?us-ascii?Q?0qLdz2PvyXRSUe2efLLFqzvnMKkrcae05U6qmJT8pBGLnOr9lEffXT31l/rS?=
 =?us-ascii?Q?X6D6pedpW6YKOCSKbTcrU7+ISw4K9CZFa2XBV7a3aB1w9ZaGz9hbdu+qNZDf?=
 =?us-ascii?Q?jL6mGBJBAQBV2bjCGOrL4ALX0aWtImNZDj9shJaTpmgRkEvR2XBzsXRTY/v3?=
 =?us-ascii?Q?sEhgiWMgD3l/MA2LVYUktidNqzLf81EjHTxidogmOaCM6ZWJPk/70qV+45R/?=
 =?us-ascii?Q?LIjGvY1abzw7R5B6Uxo4Ekz13fNM4EV5Aug3tHiEiPaRwOStFF4K9EVBclHS?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	32EegXwriSgIh+y/W4rA+XvP9DgZtfzAEQPNLt0cSfh6b2/xB+++mhKz1DBJ5QrswfgWtPLciqHCuS4/hBF4P4223yi2extXIOYPBdBSdQCq86YqkPG+DTiHM7EhHy4wvPm7y489GHDzp/He2y1r5naEJ4yj6y8+niiRv/8hTluyQkrVof+eCVxGxi8xcX47LBR3s2Ov1P/W2WL+8aKAJuUkUfPjxm+BhCwf4OQYYknUnCuM3slvTbQ0IxzAAjpSXIFPoJ+yx8h2sTFhbqXphlwSAy116WBMf5e/qowEUHrLyg0cKFV6nNbPAZ361npeCIXhg5v6ffIcc9fpGV+TPx5tkgnBqyP1MZVxXE52/gNBOL5V6b99dLALtea/J7NUMb9s5g7gBJ0CVbJCxybSBujLcmdsFSF6wSnFoIly1kWh++EAuxTAr/VLBtjvTIAVhL8Ib8bZkJfpXHvxDlVHzm/cvVny7Na3IbGxEAa8ArCmyWHItOO6Jv/NGFa7CxPA/RSGufGHAcK+5KkLWdHsJzrJVC+RxjeAo8gbrsO+ZHe4XaOopb+s15WQ3wYQMQInRcfxLVdrVS1L117Lpq5sVngt81gTHeBm3VKEKrJrff0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8960ec-d811-4694-0609-08dcfcef18d8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 16:38:22.7770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WN/8JdK8mvzYWTO9uIcACKtqE3hUlIhR7QySaSC+Ef+anBwbnqg5K3A42CcR7UmxQkOqxk/ORFgli5aq+gBaQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5004
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_15,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411040140
X-Proofpoint-ORIG-GUID: p1FMzn7PYAulsZONoQWbUo38Qc9D5fYs
X-Proofpoint-GUID: p1FMzn7PYAulsZONoQWbUo38Qc9D5fYs

On 2 Nov 2024, Kris Van Hees said:

> On Fri, Nov 01, 2024 at 03:57:11PM +0000, Nick Alcock wrote:
>> We make one assumption for simplicity, noted by a TODO in the source.
>> We assume that overlying probes all have the same native types and mappings,
>> so we don't need to look at more than one underlying probe to figure out what
>> they are.  DTrace always generates such a thing, but DOF specifying multiple
>> overlapping probes seems perfectly possible for other programs to generate.
>> This should probably be validated in dof_parser.c in future.
>
> Two comments:
> 1) DOF is DTrace.  If other things generate DOF then they better make sure they
>    generate DOF that is compatible with DTrace or else it may not work.  It is
>    not an assumption that multiple USDT probes cannot share an underlying
>    probe.  That is an actual fact due to the implementation of USDT probes.

I was more noting that this is nowhere validated -- and if we don't
validate it, we cannot control what other programs might choose to
provide. You can say "it may not work" but in practice other generators
are not going to be psychic, and if it works in one test they'll
probably say "that's OK" and release it, and then there are binaries in
the wild with embedded DOF that do whatever wrong thing we're not
thinking of yet :(

More generally, we *really* can't control what *hostile attackers*
provide, and we can assume they'll wriggle straight into any ambiguities
we leave and try to compromise our nice running-as-root DTrace with
their unprivileged binary with maliciously twisted DOF in it.

There is no evil bit we can require them to turn on :)

>    In other words, there is no assumption here, nor a real TODO.  The USDT
>    provider implementation does not support more than 1 USDT probe per
>    underlying probe, so you can depend on the arg data stored with the
>    underlying probe to be truly representative for the overlying USDT probe.

... again, this is assuming that our DTrace is the only possible
generator of DOF. We're not cryptographically signing it so this is
simply not true: it's the only generator *now*. (And even that isn't
true: there are other DTraces around that also generate DOF, and
cross-compilation is a thing so we might be hit with any of their DOFs
too... and God only knows what they look like after all these years of
divergence.)

(The unlikeliness of this scenario is why I haven't fixed this yet, but
left it as a TODO. But see below!)

> 2) Why not validate this in dt_prov_uprobe.c, i.e. when creating the underlying
>    probe?  If it was already created for a USDT probe, then we have an issue
>    because two USDT probes on the same underlying probe is not supported.

Hmmm... in this specific case that might be OK, simply because it's
probably hard to get hostile state past the reduction to dof_parsed_t,
and if that reduction fails we just get a jailed parser child crash. We
can probably draw a distinction between format invalidities (which are
the sort of thing attackers like to play with, and should be detected by
dof_parser.c) and things that are *semantically* unsupported but
format-valid (like overlapping probes: not sure we have much else yet).

I was worrying that we'd have to check arg types and mappings, etc, but
we can make this trivial with a flag on the underlying probe that is
flipped on when a USDT probe is created: if that flag's on and we try
to make a new USDT probe on it, boom!)

Done, I hope, assuming that idea works.

>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> index a8c1ab2761f0..fd7ad1643946 100644
>> --- a/libdtrace/dt_prov_uprobe.c
>> +++ b/libdtrace/dt_prov_uprobe.c
>> @@ -57,7 +57,11 @@ typedef struct dt_uprobe {
>>  	uint64_t	off;
>>  	int		flags;
>>  	tp_probe_t	*tp;
>> -	dt_list_t	probes;		/* pid/USDT probes triggered by it */
>> +	int		argc;		   /* number of args */
>> +	dt_argdesc_t	*args;		   /* args array (points in */
>> +	char		*nargvbuf;	   /* array of native args */
>> +	char		*xargvbuf;	   /* array of xlated args */
>
> Not really arrays, though.  Just a binary blod of concatenated 0-terminated
> strings.

Yeah, bad name, it's a strtab really.  Adjusted.

>          Since their content should have been validated by now, why not just
> store them as a single concatenated blob, e.g. argdata rather than as two
> separate pointers?  You never end up using them anyway once the args data is
> populated based on the strings.  So there is no need to keep it separate.

Mostly because that wasn't clear when I was writing it. Adjusting. It's
basically costless and maybe even slightly clearer. I was worried about
overruns but that is of course impossible.

This code is buggy anyway if xptr isn't set, but that just highlights
that the non-xptr code path can never happen any more: dropped.

>> +/*
>> + * Populate args for an underlying probe.  This really relates to the overlying
>> + * probe (all underlying probes associated with a given underlying probe must
>
> The first 'underlying' here should be 'overlying'.

Oh yes.

>> + * have the same args), but the overlying probe doesn't exist at the point this
>> + * is populated, so we must put it in the underlying probe instead and pull it
>> + * out when the overlying probe info is called for.
>
> You need to be more nuanced though because what you say applies to USDT probes
> only.  Yet, an underlying probe may have an overlying pid probes associated
> with it as well.  What you say does not apply to pid probes.

Agreed! I wasn't thinking about them :( hence the bug noted above.

>> + *
>> + * Move it into dt_argdesc_t's for use later on. The char *'s in that
>> + * structure are pointers into the nargvbuf and xargvbuf arrays, which
>> + * are straight copies of the nargc/xargc in the pid_probespec_t.
>
> As mentioned above, why not combine the two into a single blob?

Done!

>>   * The trampoline will first populate a dt_dctx_t struct.  It will then emulate
>>   * the firing of all dependent pid* probes and their clauses.
>
> pid* and USDT probes and their clauses.

Ack.

>> + *
>> + * uprobe trampolines will also arrange for argument shuffling if the argmap
>> + * array calls for it.
>
> That becomes a problem when a uprobe serves both a USDT probes and a pid
> probe.  We shouldn't be mapping any arguments for pid probes.  No need to have
> this comment here.  If it needs a xomment, put it below where the mapping is
> actually done.

This comment is simply wrong now -- it does a lot more than just emulate
firing, it copies in things for is-enabled probes, shuffles args etc.

Far from removing... augmented.

>>   */
>>  static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>  {
>> @@ -864,7 +960,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>  	}
>>  
>>  	/*
>> -	 * USDT
>> +	 * USDT.
>
> Why?

Because 'pid probes' above has a trailing .

A foolish consistency :)

>> @@ -873,13 +969,19 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>  
>>  	dt_cg_tramp_copy_args_from_regs(pcb, 0);
>>  
>> +	/*
>> +	 * Apply arg mappings, if needed.
>> +	 */
>> +	if (upp->args != NULL)
>> +		dt_cg_tramp_map_args(pcb, upp->args, upp->argc);
>> +
>
> I would add a dt_cg_tramp_save_args() here, followed by dt_cg_tramp_map_args(),
> because the mapping should act on the saved copy of arguments.  But if we need
> to do anything else with arguments, we want to be able to restore the original
> arguments.  That is a function of the trampoline, not of the mapping function.

... ok? I still think this is wildly less clear and adds unnecessary
coupling between dt_cg_tramp_map_args() and its caller (since
dt_cg_tramp_map_args() now silently misbehaves if you don't save first!
or more likely causes a verifier failure), but since the plan is to get
rid of it eventually, I don't care enough to argue.

> Incidentally, you could consider adding a flag on the dt_uprobe_t to indicate
> whether argument mapping is needed.  It is more likely that we have argument
> type data without mapping than with mapping, so being able to avoid making a
> copy of the args (and going through a loop that won't generate any code) is
> worth it.  Adding PP_HAS_ARGMAP comes to mind?

I took that out because you said it was unnecessary! Adding back. (I too
thought it was unnecessary because no code was generated, but of course
saving the args generates a bunch of code...)

(To me, this is extra evidence that the right place to do all this is in
dt_cg_tramp_map_args(), since it *already verifies* exactly that
remappings are not identity mappings and this would just need to move up
a bit, but as noted I don't care enough to argue. The optimally
efficient approach would be to save only those args that are in the
from- or to-remappings somewhere, but that's probably ridiculous
over-optimization. It only comes down to one or two lines in the end.)

>>  	/*
>>  	 * Retrieve the PID of the process that caused the probe to fire.
>>  	 */
>>  	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>>  	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
>>  
>> -	/*
>> +        /*
>
> Eeks?  Indentation issues again?

Ugh! Why didn't git log --check tell me about that? sigh.

-- 
NULL && (void)

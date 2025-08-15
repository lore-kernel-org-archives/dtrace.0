Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D340A308F23
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755273389; cv=fail; b=fa/eeC1l7gCqRsQB/SEnCUqYbaqhThxpewX3yQnkSpXmjSjNTmk6qWkvf+BNp+GAC+X5b/F2F/bsdaCvu83SCtqEm0etP93Qi/FK2RIdr5zYYahsZDX1qLSuTAx4bXJdNjw4MHv74YqJ+wSW1MJa0zvSE6yAtU+peNBbeKq58lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755273389; c=relaxed/simple;
	bh=dSGVhtgToIzImDlLZbvCjEM/GLpwjjcSIaUW3cKieNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sfnu/yUuouTzeyvAvkpPxif8RBwWLVwNjiTkGO1rq0A5dFSSXrW8PAoEU6zh1iWTWlDP9OPIOd0sRMXXS4GgWElHzDA4w+kCJrNf6xV8/zOMasd1quFlqAOXRvqWme63EEIlBDOFZqhTEFZKzJ/S7rcXpuPnT2uT94qsy6RhVy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O5kauxF4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jiYsbmx3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O5kauxF4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jiYsbmx3"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FDN6B1014979
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=pkzCgkhOniiAdn1OQ7
	eAJrscz/pphB6+z+JPI19fz58=; b=O5kauxF4PZyeicGQt72NgJCI6p9QHbl1lC
	Z+Jq7qwEKBxUbw7H38HpFH2bDGJg3gRxxqksV75gHfCyB8Vzm5fkrATJWTWhP7fe
	u0uaJbiDapWZ0/KThMBZDoaqRvWOY29TsODfZKxAU1ANrb+iZWiPakJej4IfROdF
	aLFali3yDndPtyO2skbfX0QtM3zx5zFFt5s03pbsV9k5b3WtLlsws6J5Q/MONusW
	UKOJPy/v32JoA6GazR3nZBHf8n4M3oTTdNHWJ2FMqXN1KIwxl6FWJ4M1yw3ptG7V
	tI/atlsvSFwOnkEZIa1Sb/sTspoIeCiF35z8LyunUqmlvFUhL+wA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4m7ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:56:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57FF1D5q029996
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:56:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvse4k94-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIiwj4R9YZYt818pQEGrM47Lx5qafCSK0Q8qKVRpXsWn8LO78ArdpPpDljQWbpMWQZg8DS5zs/QK3+nLpv55b7wcU458+KMZ023foPdeCH3Zrz6+qRa/aUWmwWlQ7gl/sxxFf9y8Oq8LaqgT2n+Y2rrysZ3cH8oufBxkXN94ziy3N3u2D7Rz5OT/6pEwG9GNJTUUSJzExQojk8UBjT5qWQ6nGMKhrnj0RTl93/OVSBC6k+ure+pvZ0KExaltfH6GNlG04eHTsqfaIdnLwKen/k/ltO+E7E/HSVZ3AVvJe4W1OElV034TlSIv+6acbisiyv0IaDT3buz1dsDFVMGaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkzCgkhOniiAdn1OQ7eAJrscz/pphB6+z+JPI19fz58=;
 b=fcBAPwjbOkP5wgiseSaKXfu0sCkIfPN4tHgnRnbg70c3y83vBgDyc75JWgpFk5SWy+sndFevPnmboQoxbE/KT2Xi9EfT9jLy1ZAatO98IFPOBVkZ3LerGdAsVCifTMdgcaAOghuKiAUmAmcXAuQvlevx/S6b9kLLr5bFKLy7UcRkKhMYMwcrcwYmeYJZE/tWBMC4veTpK7UNDmVT8p3Tfopy0LPQksGRh/w4zU5eIzzF+tp/bfzyGrc8QUs544UYbqk2ZrTpRV8Ikqer2NNalVAwiOyFOr7E6usns5YEjgd7WeLmkRUAJb4H3ysGaVTdiCSTvgs2bz1zZvyKyIWKvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkzCgkhOniiAdn1OQ7eAJrscz/pphB6+z+JPI19fz58=;
 b=jiYsbmx3eROJGwKpEvm3dWfxoVeA+BFOxKZOtAEsexxdl6mxA1epQEKHw6ZlINWSnigDxbsAmib6h7jNnSQixIRr3hXoTPAk3IceI3bi9dIvDYlOPNhZ72PD/Swdo0LE5AdUNevTQUYiSor4r/7CEHPd/Bp+BTXFmTvlQBjw6KQ=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB4760.namprd10.prod.outlook.com (2603:10b6:510:3b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 15:56:22 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Fri, 15 Aug 2025
 15:56:21 +0000
Date: Fri, 15 Aug 2025 11:56:18 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/2] examples: update the comments in
 script fcalls.d
Message-ID: <aJ9Yonv8Km/Js/Kh@oracle.com>
References: <20250814222249.13445-1-eugene.loh@oracle.com>
 <f7f3d5d9-4400-3544-858a-d7440ba79afd@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7f3d5d9-4400-3544-858a-d7440ba79afd@oracle.com>
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
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c841476-ab4d-421a-01f1-08dddc1447ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pFkpVac/p82RSIPSDa6XvovxzyHLoq/7IJzBquPbYsijzC3/igDwrgDzboiZ?=
 =?us-ascii?Q?rf75i0FOjYjIM/6tJRXJfIZ/jNxu+kP6DetRHnMBz+d+xUQYtWJFg2u1VRtQ?=
 =?us-ascii?Q?0hmiZZSOyIbeN+3jutVPCGkYwn6KgKzS2qFJKE6RmyC8KSIuBHw2sSSSYXoI?=
 =?us-ascii?Q?Me0waVhxQZzS1ivIeIUlzelYHoSS+lXUfGjDETrhStXc8/If7VTU5+ysyGDj?=
 =?us-ascii?Q?f3ycRIgOW8j1VbLCL2bGLXwhK6DaU8FJgkKbVBNpS+cJZi6QeJMU+OmhtOPm?=
 =?us-ascii?Q?38x4ejhu8HY06zDEDgOD6xxv5g67LEOgvZMUsbhSIx6M6bwMSPn0bTSXNwJQ?=
 =?us-ascii?Q?JY5I0K63ray/TS+IOxUzU5FbcVXYlHC8H9dCMLPwqRC7TPKpE0j//QYP7eJs?=
 =?us-ascii?Q?3zAikCvPmazelt300N0FiATq3QlYn1YcuNbNzowVJOJNnp1MbdR3yB/98270?=
 =?us-ascii?Q?gsQQpEnZmbgzP7gu4dVlOs3yvAjvscx0cbGYA+Q1EUZfvn1c3EypKbvpuzfT?=
 =?us-ascii?Q?vUB/KiyAR447WiwWC260iTGsKZAZUw5O2wyUPLjzHX+op4z5853qXJt63RnH?=
 =?us-ascii?Q?mLvIoi1JOUlQQCvJDzrRKneAY3xDMPeE7ae5V13mJdxwkT8gcItKGlcS8FGP?=
 =?us-ascii?Q?iAKQ3LrvVeJ7AXqZl1ap8YeqDQizc9yaKdKpXh1npgipHkBZGlp8oJ6mw1eC?=
 =?us-ascii?Q?vKckc/SbnigQjnYbKYmCf3ib4BR8WPQ9Vru/JbYKUvFGmwaNYMbWCayI0uNi?=
 =?us-ascii?Q?8zUHO05cAgmXRnpgFVwP+OIMzDz89xeU8QDj5buHwUtutSi+WFEXMKQXigvT?=
 =?us-ascii?Q?4m2FjB6cRPcb8UkHTRYagrtlfNXpGPrf0KGIL+qitfcQlI2IALB/JhaKdG6V?=
 =?us-ascii?Q?d2OofhyFDaHmeIXxO3tSBaImI/VTdn4Y1ZOL5fAooPE2oWeGuSqqZPV+4kq3?=
 =?us-ascii?Q?ZrEAq6dPePJhwpOF3wOAovRi8LQbHZ9zkzif5TVglZQh47yr0oICieDUt6Z5?=
 =?us-ascii?Q?3/vZmPhiZpp1CFaQL3Y2EIKy88enU6dYbjA/HjFPPzwpeXWQ+Py67Ba68xdy?=
 =?us-ascii?Q?Mpc9pVi40ee2HYzdKGvwXaGQRcjP4Bu8ai+R1y+15n1TCp6pzestMWnaSySe?=
 =?us-ascii?Q?P/xqbQyf2qrXhSYhENbe269t8dHPTZLQftVPbr4D6P1x4tRU64kR6uYmIEdc?=
 =?us-ascii?Q?p+0vyS6QBH4zDcTC8skfCgojv/sLbo+WJnhBlAoNelS2FSe7X+xJu7S6o6d4?=
 =?us-ascii?Q?C7XowG5cQb/ZQ3ELOHXAku/3OeSt3e08HVgQ+zN0aZb8q3sHt12Mhqw2dz/N?=
 =?us-ascii?Q?LJtruA3QlaJZAwhqMyMLggB3W3D78WCSYb2iInymDiZPdhAlxLKcmmdju/OQ?=
 =?us-ascii?Q?nWFtMupH8d0oJ4z22X8k70EYaphpEUSmhpwJX3Nx0i429cS4cpdRp9wGjPgM?=
 =?us-ascii?Q?nmKnfTYmFdk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yzKio3x8CA7ZNMZRZ49lUorMOsFSmHulISL6wedantX0zq17ziqOteiQo8zC?=
 =?us-ascii?Q?ap1eZii+W6bgRIz2yYnXRCUYGfs48NCkJleKjYeRPaqmdKRg6W9gJ2/D8Hca?=
 =?us-ascii?Q?zRHLFVMYfoQg1B8j63T1HNcrYe4Q+HOQX1RhPALYq6Xpa0Y8mbozN1I/ndCB?=
 =?us-ascii?Q?prDr+Olz6xnfYe9In00AzqfH8mXPEGEhS8A8NG4883BBjGahSZuJ8h1mz9b4?=
 =?us-ascii?Q?fq18pRJnTrRL+2PWRSVfSZJP6i1kJv4efyCbWyKWtpaZFMxtXnXOUnVyMfog?=
 =?us-ascii?Q?3H5/TLuydt8W4hkzxxN6RX+A6zVNDzShGcu7+abI5T7zwPDbyLhZbYtZ5wna?=
 =?us-ascii?Q?XXA831bdCEtNMXcVkaLhwfpw5MyJWVL6PsciydehAyc4MHPyUecBUU6wo/W/?=
 =?us-ascii?Q?J4ngAM0DmceDGCereVqFTnzsTMK0L4fRoXg3E8KbmxMl6wVss3xPIKM41NjQ?=
 =?us-ascii?Q?CGZbvaDzxNoZYLG5iG6E4/PSdSF4Ov7PAplX9+LW1t5z1l8ns9dh4mwhD7pW?=
 =?us-ascii?Q?8OEQZ4lVtYwHZKe6AmFd5VsXOjErqDzm595zcWQlxF5ngcodBrqo3NuxqSyU?=
 =?us-ascii?Q?+30KxiBrR91ryR+yTbaJMgx/wJfievtfPlZlneeUKBuikKH0zEIapBqIxVBF?=
 =?us-ascii?Q?sklzbXAtkkfsMcaDcFU8mCE3kozeqPJugrJ0kL7MxC4FxBN1u2braq9M011D?=
 =?us-ascii?Q?UluKLs6CCtXB4JYo4ZOBaublXOESRJ1JZ1uuc12VbiR4sSlGdSJWTdUPaQ1j?=
 =?us-ascii?Q?xHzLlDkJfa/y6bMbDNtRli1enr2c8PdyeJYvuq5mKvOfM/VFcQNrqq8QRfbs?=
 =?us-ascii?Q?ypk7EskuosMOCyYzVWecVnZKEW738woDfHqEFLYb6OttoeWlhfE1Mwb41bxM?=
 =?us-ascii?Q?vIatRmdcJjybmOkMGgp34GaJponWV88tWFVgy23f46g0BR3CrbWvfTqVBlvo?=
 =?us-ascii?Q?sal7+tJeJ7cT14MDZuDhteFYDklinrUntZMbing26iBzpTZLHFhVFVeS/pmw?=
 =?us-ascii?Q?OqvagoOPaQcuUOXP+TvMLVeUdwBQfJNtZsbJElBvHquoI8MFkDlXIMqpdpsP?=
 =?us-ascii?Q?t548yPEG7i4BVjSKECSbZz6EVZbvKnsiIRBaDbK3FINiUTMtMrFOcuFQ4mgD?=
 =?us-ascii?Q?4zX3t4Ou/LO9MKIQMkiybgPTSx9gUBJiRiD/bMW2/UTe8hyvAWua+hBlBe++?=
 =?us-ascii?Q?JIsWejGkumvqpusElCbO6obWzlXETT7sC25jWmAQ8bpulcU8nAJX2b18WmQO?=
 =?us-ascii?Q?dwCQSDwyQF0ZJIxVHiUIhYGP3XTcbW1Us2fMjTBpfMSThloWl3CJ0RNqY0H5?=
 =?us-ascii?Q?KREear62b2h20ij1VNzXz5x04Y7ELAhZ20c8+4Ls6OMccQgDUd6llq+GY0Fk?=
 =?us-ascii?Q?JzWBBLgaOWp4MOjuiy+QChljD8M3u1Iai9iccERUHl2uMSmGct13v6937pqq?=
 =?us-ascii?Q?1zNm86bRLXm9rQ8MxZUTXxHeknXZODf/1BoYjQJCledfBvgxZokrPdp0w/81?=
 =?us-ascii?Q?yZ622bzYerOF2rjw+cICSl5MLTgz8yunFLbCs+64l91hdPvuQ8GkqkNsxOdC?=
 =?us-ascii?Q?ucyHbK4sOMP3/p33dgU4HKlIA4dxBw5KuiNvEBR5p9yTDDJEWd7y0rhb+TuT?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yI4gyedE5oSDQGLVUQvwkd9GJRNu/eE2OejnZP8JhsL5jJQ1ApCMp6g9tIPPXebF/WqgUrCN4h/QzpllammGwZ8uvAXPlme+FjCxcmNGy154N46pNCZij3pd2k/NxBFEzO98o/mU/srPrTDcPb6KBCjOBNVgMWr1oMtMSKX5Xuv54R5DHPiM/iABxCAZirldXUTaHZWcrD3M0TTKECuz58a/uW8SJMPs4LeNx5ItVE2k8XKgf630aI5MsBupktrLHuwSTzcNGAbg6A8rzz6sYG8ccw/q1grfA+GTFUzGsIFpWV8uUZrAoiA2jJ5BMaxkLtpwJrJ2OhZwNXyaYgSpHmzCsjCMdsqhdCJ3GeDsxOOZHS/f5FdzJh370CKUrXh1RbcNXUCeveKi36paLT5mxJLGleP55lIyfuapFbJSu5DZrvnZv6eif5JKYoecSwbwxyIHGxgi7ne7jboavgUOLK5Kb4JZhWt2pWo/FqakNUY/GTVjvFqfX5eMoV0q8wn6zbd2CZB5s/z10GlbrBz+NKhS+b5PN/kYWIIhfWHvCjcDei9+diIhqtQgJhw7RxE8EXgq0ecCGi1cX4EXGB5Rr/YawBxvQDha2M/HjADKEcY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c841476-ab4d-421a-01f1-08dddc1447ba
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 15:56:21.9063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJAwddFts3uJOaS5fYlmWNGYZl4+isNJfN4Gd6FcIMKBDBPH6JtgK16jVn3YRBF8k5XV3Lp+ueHt2drld7ykk8wFl+wrMrXEp3KD1+HkyyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4760
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508150131
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE1MDEzMSBTYWx0ZWRfX1mWZUFEVFvLt
 x11OLc1MEIHDhN/83ls1fi9gXeerStwe035pyP3wsGlNxHuc/vZb8bJOb/CN5JFVnJasjboYvkh
 MUzNhQuC71GxqBmTC/+Wu32hpp0sX4LA4WJYag2hyW2zWZy2zk0R1TJo9RERYnHPQrASZ62ucyK
 /Ths36iK2MN9+Mbv7nex8m134A29qbFvN2CGM0n1ll8R2sQgXq7ZR+Nxc5MClNY9TGgbE5EJL2r
 p7tWs82B1uB3UVm/eGNy926VKyoP4tHm6RPsguKGKCQ4my8wchWeqSntE8Ffez35VuiQ/QERkcO
 Mvmo+e+2JCbMlSj8lv3LpZ9+HxkMS4aJEhmr7t2jfEtS8AJ+5EHPyXdiFGSo+A5c3fwnPnmaDAF
 S9jnuEOqqaGeb2hYFbfZ296pYlNTB2zUX/ehqb1EsonuaedjA5lAiS5BD/eAzSpdwmMR0ft0
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689f58a9 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=PPpY0beArC-c6NCkStUA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: AqCWz9j7cwf5tDM6YF8GHf_90S9iZJH5
X-Proofpoint-ORIG-GUID: AqCWz9j7cwf5tDM6YF8GHf_90S9iZJH5

Comment below...

On Thu, Aug 14, 2025 at 06:24:56PM -0400, Eugene Loh via DTrace-devel wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> On 8/14/25 18:22, eugene.loh@oracle.com wrote:
> > From: Ruud van der Pas <ruud.vanderpas@oracle.com>
> > 
> > dtrace/ChangeLog
> > 2025-08-14  Ruud van der Pas  <ruud.vanderpas@oracle.com>
> > 
> > 	* examples/fcalls.d: Modified several comments.
> > 
> > Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> > ---
> >   examples/fcalls.d | 14 +++++++++-----
> >   1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/examples/fcalls.d b/examples/fcalls.d
> > index 9e42f0041..c332dce40 100755
> > --- a/examples/fcalls.d
> > +++ b/examples/fcalls.d
> > @@ -8,7 +8,7 @@
> >    *    sudo ./fcalls.d -c "<name-of-application> [app options]"
> >    *
> >    *  DESCRIPTION
> > - *    This program lists the functions executed by the target
> > + *    This script lists the functions executed by the target
> >    *    application.  In addition to this, the number of calls to
> >    *    each function is printed.  This information is given on a
> >    *    per-thread basis, as well as aggregated over all threads.
> > @@ -19,12 +19,14 @@
> >    *    duplicate the probe definitions and in the copied lines
> >    *    replace a.out by libc.so.
> >    *    For example:
> > - *    pid$target:a.out::entry,pid$target:libc.so::entry
> > - *      { ... }
> > + *      pid$target:a.out::entry,
> > + *      pid$target:libc.so::entry
> > + *        { <clauses> }

This is a strange comment...  A clause in D is understood to be a { ... }
code block that is associated with one or more probe specifications.  So,
{ <clauses> } is not really conveying a correct syntax/terminology mix.

I think that the original { ... } was actually more clear.

> > + *
> >    *    - It is assumed that a function called main is executed.
> >    *    If this is not the case, this is not a critical error.
> >    *    The first probe is used to capture the name of the executable,
> > - *    but this is not critical.  The probe and printf statement
> > + *    but this is not essential.  The probe and printf statement
> >    *    can safely be removed, or replaced by a suitable alternative.
> >    */
> > @@ -45,9 +47,10 @@ pid$target:a.out:main:entry
> >   {
> >     executable_name = execname;
> >   }
> > +
> >   /*
> >    *  Use 4 aggregations to store the total number of function
> > - *  calls, the counts per function and per thread, both
> > + *  calls, the counts per function and per thread, both
> >    *  seperately and differentiated by thread and function.
> >    */
> >   pid$target:a.out::entry
> > @@ -57,6 +60,7 @@ pid$target:a.out::entry
> >     @call_counts_per_thr[tid]                   = count();
> >     @counts_per_thr_and_function[tid,probefunc] = count();
> >   }
> > +
> >   /*
> >    *  Print the results.  Use format strings to create a
> >    *  table lay-out.
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel

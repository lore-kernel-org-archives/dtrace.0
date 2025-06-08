Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11BE3BBF0
	for <dtrace@lists.linux.dev>; Sun,  8 Jun 2025 03:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749352142; cv=fail; b=gPNZXVOpt3+D5MRHjQtwmlVF4vaYv2U3NG3UxSfziG0yaCPrwrHfWFJ6Ys7NGqhJlZQA+laXBooXc62ZIcZ0HEmJrsQ71dKisGw41aH8URlnhCOfnUIFNkUvD/YiKrQ98VVcCRhAbhgscrxjtIfH2hJcIfQ6se6/FavLqcHnWmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749352142; c=relaxed/simple;
	bh=HDoCW7CZPz/LtNiL55Jh+zMf+KtipqJO3TxA473R7W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DfrK6IK73k4KUdkU4d+woFmIjKvs0KXsrD0POCb8ZQQrgRbS2EvQnQskZk+KCeD4e8eP7ugaF7Lzy+LkDn+q2+lv56pQBSSoMFgWoHsVYUT9bWifrYQccxz9PNEUL0QdnZ27qx2KWjwXTQgUtZYm3NAmb61BA569PWjbL8e0fv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IB1lJEEy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mwXUgwYX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IB1lJEEy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mwXUgwYX"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5582rxMT009900;
	Sun, 8 Jun 2025 03:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=9mHLcllP44o66cQ4kz
	e/F6gA5B4hO7QkBNggPLdIpZs=; b=IB1lJEEynJJEPyVQ3nH/OTITal12lkskDS
	PjhXSV03fDNt1oDhWeTmrE72GDJNbt+e95baGE+KHbC9uT4QJs9jvnhoP7HffANp
	cf+V5aXUOzsK0yb8P8tkv6YwS7n/3ZcK/iPL1dIM+5LVMF4CYjTMXRke1iyhMp2f
	FWPokOZYlsIv5o4QdZRRNT8oCMfX6JiAOfc1xIRX72XnQ+KhKWGolD8Cb5wqumzK
	EA17MxIJ7yeAQr8lhCrQIkiBS3AF154Ez/KANglLqWRIRYMegNuYDHwG8Mslf8ZI
	mRnNeKK2pSNpCrLBHWtilk0ZdYSI/2PPfOheKm6K4wvGvBNc+sjA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad0mhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 03:08:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5580o1LF007435;
	Sun, 8 Jun 2025 03:08:52 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv63n4q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 08 Jun 2025 03:08:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+Ob1xKWI6k6yjfiDoBTf+YKrD3rv6WRN/XnKEmE5Ivn5kLeqnAPPyrOC+2ECZSVdSorROatF7rYGbT6X86u3Kw7bz5bLMPa5kPL+oUXIwd7vZaPUy7lzKdK2Jn4FPoP/xCY6nrwXTinh+YhH4MW+a7w6SojSYKizk5XbXfwwbCTOIcnvr/ORnBhvnZ9t0Z83pR70AXHw4ovW5fHSIleaZgFSkzFHZhI6g4QXGA9dXVKLIAU7YP1BJlF4pBUiuOs/7FnK18P0ogtDfBEtxeF8Qjp62XvS6eOLwdt4L0jMeToMA7S80xM11JeDeOmB8p6xiotVBmw6o+nnNirJB0HNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mHLcllP44o66cQ4kze/F6gA5B4hO7QkBNggPLdIpZs=;
 b=iJGUICsdKZJN3DYZjnM0Jf5pGNxVYC8gGBRpzho+QW3JEnpOcg6cqhVoUszuwh133stPcW40g7g6NsYVMqetZkysJ6unO6+NIiNFoY/2HFT3ZcKxioudm0mU73yfJET+eYnHH/t9JiflWK1VntOPfB2yWeR6TyCMCbq7w881PyOkSyHkQ1fhUaZ9xTreLMj/+LFZOzVCZH3mLYrAhmzkQdqQHOcRYjlP8H9f9p902so6htTKMbS0VvrE7c0FXtj2xc8jTH7j9BeI2Igb1gncZ+j4uzx0989jG6aIMNjfZBRGiP+SsAoH4hzPaEN/q4N8OITfbuiihs6KqaeZNNoj9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mHLcllP44o66cQ4kze/F6gA5B4hO7QkBNggPLdIpZs=;
 b=mwXUgwYX/LEqIQHNcAH65qLxGgB4Gb7aNPJ1N7ptuCvRttNGnu+wXrzQGgEYuvppfESvPq9YdTQseS8uL045OXH11dMFA/NqhWD9oSzSZDou7NYLpV404yOl6WUTrf0b/fN3Q8N8o1nLh1qIAhuYHDWp0xfKQ4+D3iUKGOUj67w=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by DM3PPF3AA48E9FD.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::c1f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sun, 8 Jun
 2025 03:08:32 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8813.024; Sun, 8 Jun 2025
 03:08:32 +0000
Date: Sat, 7 Jun 2025 23:08:29 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: Alan Maguire via DTrace-devel <dtrace-devel@oss.oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v2 0/4] ELF note-based USDT support
Message-ID: <aET+rchgHHTRE4mt@oracle.com>
References: <20250129145522.512341-1-alan.maguire@oracle.com>
 <Z5pKUy5EOa7U/Ita@oracle.com>
 <407bef64-903d-43a0-a5e9-071eef13c27d@oracle.com>
 <87ikl7uhzn.fsf@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikl7uhzn.fsf@gentoo.org>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|DM3PPF3AA48E9FD:EE_
X-MS-Office365-Filtering-Correlation-Id: d87a8a66-0382-47ac-1044-08dda639bffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?13oGY9gdA4IBw/3Hw4dEt91ACx/c8KdleGANkCEstIZgvjhZ1RmAmR33WUyM?=
 =?us-ascii?Q?FYtcnv1GSM1TmaE+z0VNdFjcYct2xEAwrMHeOkJRQhO5ublkJYqFiTsNYSD2?=
 =?us-ascii?Q?ZUrrzj8pVsgIK+qeGJQqfYDg3Q07aGXpA5oOgtVvIX4hVLLQ8fi5XsukfjiL?=
 =?us-ascii?Q?ayiSOVXO2q1mA3dXQbVU3LbH0V/lVe2jL38mFnTpamgF4BQwkfmS7GUO1hgk?=
 =?us-ascii?Q?gFDjBZ3ph42+FzaJwzZwwAqkHEUNqKodKsSUr7ndeRjvA2gNUYCpwjEf1Bv4?=
 =?us-ascii?Q?CUopa89R+1XjXFMOgMoGb02C/aAA0afg+hFT35f17yytAT5AnBPusI9MyGfQ?=
 =?us-ascii?Q?l3sC0CEdYRKnzY+3QSiLcZQUZWeTP1xO/kDL5aT8qMKqrKuVN+ezm6jHBqKA?=
 =?us-ascii?Q?AQKBknbyBFvV8sPLlN8g1qiWq/htr9IxVm7KjIHXE/TXITkAoagFP5ZAVbFh?=
 =?us-ascii?Q?Q41knk0J3poFmb1HUGLxU2xWBj9j0JOsLXweLznFsfCVoDaDTGJKt4IpTzTm?=
 =?us-ascii?Q?GF5xuJZjUL9BGwctmnBKmHHx2A0oNVF7gVuo+/xf+UjpQnv9Db2Gec+xjGQM?=
 =?us-ascii?Q?I2Tt/bGrmdZxiIMOGTJA+KDhV+2hF43WoYuOBuir5nugkNwPY9a3YMQrrA+9?=
 =?us-ascii?Q?UQ2A+n4Q/Yn46Cz9p8OXuP8HKiLtseFMqANo6jr2JF/nENBYAXW8JXPz4uuX?=
 =?us-ascii?Q?dFYEJYZkM2vOR5aPqFimcN5yCbaMlyjDoOxeTKm1g6GC55MdiB/tUXtRkzBL?=
 =?us-ascii?Q?gYTEUhj06uCEvBhqM2uOSiV0UikAg6MNAKe+BDBfC/J5R1U7LxJgocMMMzuJ?=
 =?us-ascii?Q?ZfcLwn54rQ1slhsYGxI3VxWpvo4sgX7NNbXik+rIHY63zRIiFxfcuxfx+Tp3?=
 =?us-ascii?Q?KqAk5Sg/huc/0rcmTKOtQ7ATair+gK2A+bbS8Jryh1Vieeg7wEGNlDeLZwYm?=
 =?us-ascii?Q?OWd8sTo1RzrjVBAW2zmPkxJ9O1RLA/4Qvnz+XuW6lpJ/FPVXz/I5Juxb914O?=
 =?us-ascii?Q?3nyggGfRwHn0RXlYsb3efszFHnIjK8sZiHKXndOqj2QpE7Raoy7vsBgZjhpw?=
 =?us-ascii?Q?bzrcqykKkkMw0/GA+snRb8L97yJYpJfDbh6tdTqIFWv3sYkFVY8l8QD0lLR6?=
 =?us-ascii?Q?PSK3lzG9ii+A4ASKNGv51WVy/hXvPN/jZd+0545p7qDMn+dYmWizvEdRTXxe?=
 =?us-ascii?Q?OCYpyzGN0u0y7smVRE/sOhgnVyAK+uNLEhvy79fc2nMzfzR1Jo22Z6548d6+?=
 =?us-ascii?Q?6Dp12pszPDHFdJGVHJcP0WwgfXqLuYz+ejaQ4+ClTk1+bHYF3CdsujMdDYIk?=
 =?us-ascii?Q?IfgfbXZSMOtCCh7rFJnHdPYxv+n7wBYGBYnE3Zz/ea+zr8zTN/0NhU4sWI2N?=
 =?us-ascii?Q?+9iSYt+IcNrRz9M7wtLcwYVP8pwzsPl3mWeUnehLLXkrh1j3wpQtKK53pfri?=
 =?us-ascii?Q?rK+3gqyJ9R4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HomWhzOGfQEYgGH1wytiQDdF52kwLDw0t9C+QZi4ibEx/omP55t3UMIDskpd?=
 =?us-ascii?Q?r9UeES/0dfj87fLgm0IKqc+02DUjiOgIfPx6lFBx5k3TrkUT4zgBfz/OeRTf?=
 =?us-ascii?Q?2w3fxZ918w8LpCpuD71zw8q0Fh36QNkVYp5GzIMsAh6V+i3AokEeLqTZjJ/H?=
 =?us-ascii?Q?9E+4u17GKuhyYGMLUQoqWLfJ27aNmhZ53H4cGzIdGNEtiowbFD6l441zY3wW?=
 =?us-ascii?Q?2TbJtZIhiJN1NgF4Aal/KiVXn/+5hntZ8wg98jLo+o9wygey1cnYrmmVq1WG?=
 =?us-ascii?Q?6A4v3nX0qXPuQ3JHZD6tTQ4B/sBmqetuYtMQcRYZZ/OqwyjkxWYiQYuiF3tQ?=
 =?us-ascii?Q?zAqv2W2kxozMoygIw53j087Qtcwl8Eb2XN59ZZQIiFpDgfjqPHiF23+Qmhwz?=
 =?us-ascii?Q?c+/A5u4Fz53qor2ODkYs09OHYscY0mfnJdIZQF5j4WnZjq0aXyfXmJhvx/aq?=
 =?us-ascii?Q?A4rHKI6lKMWtnJqWI/gHR+AyIJLqPWvOA1UWx15TKtVFXu7EMop06F68438q?=
 =?us-ascii?Q?qhKS3LFO29oZ9uh7axGLLZ2Sfkmmm+RYWa/TQ6qBDj+2CQ8XctK1+Yi9Q8tT?=
 =?us-ascii?Q?mPBlBQIC7019VWQPRLceNaHHySmToQFhXf4PRha2cR2K9k4uQymWEa8wYA1z?=
 =?us-ascii?Q?3idCzzt20bQvx6tF1ZLsUD86Vv9uHLtVexo6UNnsuJNUhFfHzI/pD820NvQm?=
 =?us-ascii?Q?O1hOE4Zlc2IXMatkrndV5Bbr0XAX3N1uRHYi46jNutaoW/sfgGFOGko3bCXI?=
 =?us-ascii?Q?Dn8Am6wD4DInfifN9eSr14okH++I8ceKWzqDeqzopHmOPwFx4sHJpR8/Hhzw?=
 =?us-ascii?Q?xFyTJDxMzvFuxcUXmbw3JUGuLpCy9/tqy9Aics+nHmdIeLT8WDD/NR6gtmJu?=
 =?us-ascii?Q?HpZebODDubazW5LKB2sEhg79kcvr/Pg96Rf7Z9xYN+h9xPWAhwFOclEDq1XP?=
 =?us-ascii?Q?MZXaWF3GB5xIYhaqZxScl9XU6VcTMOXD9h87xbb5zxN94EjFcsGdlLqeVbCc?=
 =?us-ascii?Q?JXZk2MD0e9V8FsR854AHm3BM1X+waWajIimo0+5siGOhWuVkXDuaLLsCHfkz?=
 =?us-ascii?Q?DoFkC95sa/5xlJCDsGIIubvKdMA8XU8G+6sRbVKl7cFeNue3CHA60rlhfwcN?=
 =?us-ascii?Q?PeNqr9Uc9B4S8Zc+xiqD63zqsDhQON5ROTAKcwZvcbWF622sU6/9tVLEizuE?=
 =?us-ascii?Q?qEaX2K9waQXdGRlD3AG/zfjaLdCK1n08FSS09+5CzTOSobgJrgTEBnktgQp5?=
 =?us-ascii?Q?Gw1IklAovKivErqs6eZC9qCFBLuRugDzaMiHDKjLbyfUTk6J5MfvDQVPEvc0?=
 =?us-ascii?Q?ldPvVwP20NIV3GKHJO2RN/g4iWMI5U1wAuNy+vS0tQyUuRoqHUjXaqFlWT+1?=
 =?us-ascii?Q?WvbvjZeDHbBfD4t6KEJM4+VPKmdeoZ2WXIYzljnj9xqN0Eicjn1OIoX8fEQl?=
 =?us-ascii?Q?b/RAg5TIArPU6glW5A3tu203R+zHwFHApYMjVj2FIdUfGWUq70+SCI8ZbKec?=
 =?us-ascii?Q?FExdsyxffcq3YC0tTcRfwNBUWhV0lICZBpEoWSncvIu1QG2mm5K/qzxuEKFI?=
 =?us-ascii?Q?gd+O/VtVH0izyoQuehLmNebaaftNauCrWP7PLRfE+xN6ilQgZb2PIHiwTO87?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XNLeJDLse9xMnzunCE+uqyHRwmy2H0ibzHG0L/t36dO6hP6iYgcersx2KWMzPtPxSKEop8oflb9g/YzfsYuYNL05h3vVOg8hIX2VHUODj1qKlg/FaokmoXnusRqthkSLqtnA7Rn8lRFrHpojbOo1Qy7tk++ee1pGTPHubyvUSWHDP5WgqNo6Rjx1D2Kg0mh9eLsdCbma6+PGx0uQMOEKbSckhlWyk6VUacYbX43dCQfPllgwzJ7n5KYCZP2vt9kOeT36i2lE3kQ7SqE3sTFlduxx0NVUvCtuMXBsFWc27eu9QvYcbINN8VLJsI1aX1OHa8S9sA+xxA6N9FbB25RdnmSvGyokpL5H2KVjLxDaRMgJJvYoi0sYdHEZiW1MEEePC3aqVp48Zw3eERZwGfmRQ89cOvOxSWyrLVIWPQ7OoAveUy6u122kh9y7KL6S8PuWL6vQm9KHmnQkeR09i7VV5hQRBr9X/Dxqp6mlmDK82AiLFtU6cZjCGgqNJGKvXuMSgNGSgYxGPSB9yGjvQ6DN57DwtGaosvpcL8ueTwuVPTEW15fxE7mtO1NFdUnIYx/uE0jsPQAg2kb7bsz2Dh2jm5aV/vwe44tyzbLYafJWT8k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87a8a66-0382-47ac-1044-08dda639bffb
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 03:08:32.2527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpbiQViGb0J/shRXEHzl1gTKdv4nNv+twVJyH4Iywp7t1BlMMIKcxj5dY3vfvxD7YAFDPyBz7OP9679R/A4JYdq5BnLCu0qlzVHUkt5RT8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF3AA48E9FD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506080022
X-Proofpoint-ORIG-GUID: NHKhhZGeAUTIAmBlCsINGGqGsp1ZFPCj
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=6844fec4 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Sm3UxyhktH9YVciucgIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDAyMiBTYWx0ZWRfX6rmH7cjz/w0N OOk0983BZ+/3W3hZCAoCHNnAhVA9B6CpLztV0ZJbMVySHXPLHqBFsBG1Fv2iUb172qp/F9OIB1z YstwLP3NJXu/IqXPxbcEjrv0XHeuDDvhjB2xVGxLY3F8aTz9qvJIzco2T6C8ox7guaTfnvXJ2uK
 Yt4a+V9qCk5MFYP6210VpMnygNTsKXkOKyYXu2SqxAGTTs8coiyPUhDAW0Az9fsqVjcxuHdBOoh Xvui6eOCi63EgWNXbW/JP8fopBWtkWzQ6rpj9XG8DDP1BCUUlQyvjZulIOpqk0u08B4OAP5lBhz FQY7LeGGdDFsET9j9df8m/+Atj0+7hnPigQoDOnV4J+h+VyeA871mIBzych6v7mTMF/xfuoa3AW
 BoE0WxsfFfLLn4rpokVsTXH8uwqG76vyNi4cnGE3pknG/MOLaJTOKoobfJBhfFroOJudpg6W
X-Proofpoint-GUID: NHKhhZGeAUTIAmBlCsINGGqGsp1ZFPCj

On Sun, Jun 08, 2025 at 02:42:04AM +0100, Sam James wrote:
> Alan Maguire via DTrace-devel <dtrace-devel@oss.oracle.com> writes:
> 
> > On 29/01/2025 15:33, Kris Van Hees wrote:
> >> Thank you for rebasing your work on the newest tree.  That will certainly
> >> help review them and move things forward.
> >> 
> >> I would definitely rework the commit message though, because
> >> 
> >> 1. DTrace has a specific understanding of what USDT probes are and how they
> >>    work and stap-based probes do not provide the same functionality.  One
> >>    example of that you already point ay: they are not discoverable - i.e.
> >>    they are not registered upon startup which is why you need to refer to
> >>    them directly by provider name (with embedded pid).  I think you need to
> >>    be very clear about the distinction.  Using STAPSDT or stapsdt might be
> >>    a better choice than referring to USDT.
> >>
> >
> > sure; I'll use stapsdt.
> >
> >> 2. I think that the commit message fails to highlight that this support is
> >>    to make it possible to trace programs (and shared librearies)that have been 
> >>    built with stap style probes.  I don't think it is in the best interest of
> >>    DTrace users to build their executables and shared libraries with stap
> >>    style probes over DTrace USDT probes, especially given the significant
> >>    advantage that DTrace USDT probes have (see 1. above).
> >> > 3. While I can see the point of mentioning how to add stapsdt probes to
> >>    code, it also is a source for confusion and thus is probably better left
> >>    out.  Since this is a compability feature, surely those wanting to use it
> >>    already have executables with such probes or know how to create them.
> >>    By including it here, you also introduce the very unfortunate fact that
> >>    stapsdt uses DTRACE_PROBE*() macros even though the probes have never really
> >>    been DTrace compatible, and it is only with your proposed patch now that
> >>    they could be used in DTrace.  The systemtap project shouldn't have
> >>    piggy-backed on DTRACE_PROBE*() in the first place because it causes this
> >>    type of confusion and complications, so I would very much prefer not to
> >>    highlight that mess with this patch series.
> >> 
> >> The stap probe support is very significant because we unfortunately do have to
> >> live with a world where there are multiple ways that such userspace probes
> >> have been implemented.  And given that packages are released with probes and
> >> people may want to trace them makes this addition certainly very worthwhile.
> >> But I think it should be clear that this is for compatibilty/interoperability
> >> purposes only.
> >> 
> >
> > Sounds good, I'll rework the patches accordingly.
> 
> Any update on this? I'd really love to start wiring up support for these
> in packages. I guess it interacts heavily with the work Kris has been
> doing on making LTO work with USDT though?

Yes, the USDT rework I actually just completed is a pre-condition of getting
support for stapsdt probes in DTrace.  With the new USDT approach in place,
this series can be revisited and adjusted to make use of what I introduced.

	Kris

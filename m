Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902C49461
	for <dtrace@lists.linux.dev>; Sun,  8 Dec 2024 00:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733617616; cv=fail; b=tq+g4NWx6urrZUrNuLscdCUNXzGOr4nTjZrxgbd4/7IOQHIUlpjAtC65KTIAsskVlKLR7PaajPRCWpjLKM1NXGXhFW5ipkIaTDzsLXrSzGiD2ZwoSoHJzswtGmn/sRRALYKSAh1mYGA/+fpU1gd0Poe5hK14vAEFAPtG0AgE1Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733617616; c=relaxed/simple;
	bh=7afF2cYlkvGeGYGfb2X03PWMKaeEgVpJr9s/1xckqwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d5CjB+rZT4C9iF4RE24KjuuXhYgT7bJ9jyHlg4NiPot4/sGUk0v2sUFerrFJSEOjSG2I+sGjLuL0kb+sZo1gWAVhoiqOg+88JPp+2tUz8L++Tbn5ll5CsZX1aO3mgdbOIyV0CKbjY2Q7ptI+R8fSOSlMEkrZhpuDWwzn/Q6gPmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PBshcmR+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EZuNBK0S; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PBshcmR+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EZuNBK0S"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B80024m005993
	for <dtrace@lists.linux.dev>; Sun, 8 Dec 2024 00:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=rcOSy5jyD+CqB/hhGN
	I/46Z529GJn+YbcG5X8KqVdko=; b=PBshcmR+bCCbKPrO78YCCeir4cAC9Zb2cg
	ft7R8LBjNKEkgVlMSjAyspogCA4WUCLYV+Ur62seksaC80f9UcB9RR/TGbEdnQKN
	kO0r1aSRIdJ3na3kkpripVsINQSMUZTlne/rLsns77ZEhlvsetQcPD8Slh9oCnwC
	9lvqHIuwtfBzQXDg9cKj4prZim9VX0Gmeh0Q3q0LuQLhIpVcr0R1UrRTAY+tcMm8
	VBDohXzlmjHBS/93uV1Qpj18MI1x8jWBqq+2K3LB3FIzzI7b0cKwewM76667HX9s
	CXaOaI45RC5buE1f/y0HKH0JDs62ztXWBXJr4a9C/3dJgEVk49Zg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ce890ybm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Dec 2024 00:26:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B7N1sYU008634
	for <dtrace@lists.linux.dev>; Sun, 8 Dec 2024 00:26:52 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cct5txh2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Dec 2024 00:26:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfJvajZt85qNUSKA0nn6IeNR1JSOfHTbw5pTht/XC18gQavBvhtOdQxPLAFOebrufA4kkoDUfF2ilhp6zkSo0V92S3ZoFRD1LUBTmJSYL6VcsZbdGKmR4BpSSXYpvmid1JA351LFqwqkm08VaEz2ZRr0GkAREuVeKpYg36rYUXNUwWlcS8ZOh8vWMzvzIGjPFKpfTOFQs/M3tdoaZPxfDxkIQpVOvjCsFYxCjlY2H27vzmfegdOZx+Dnp3xoQxFVDG/erpt9wUZaeV/+ueiKOgpDhlfvxZhZ9ZTnkS7GlNxNBa2rk4hS55KQtd9dX/1uFNlfiN/zSst5Jf5pM5355A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcOSy5jyD+CqB/hhGNI/46Z529GJn+YbcG5X8KqVdko=;
 b=kYFGsUsrn5Fn1huIBRe0lX+//wWcmYB/Tbl9a6NfimnV7uSxHJaORw8ZlI2o7xgpwCSNrzA9UJTGYozcVlGoxD7X9OgMjAwUJex62g8fg8ul0vkS+3f2nckTE2LcC4FvdzJFD+W9pFRUf6gTNWw98/61rZ89T82FakfiGG9cR05hRzVzq5cCnFqPdHlHGgl2P3RPlkP3ZXgliHjH1O6MvFhEFzzpab6tFXm4hDPba2TyzKHxmg3iNtD0SonZLSXcpi7nxJA653GopTjFjQWDk+JAZ9ze9wmH2PmUI2sfs6m5HHDmn27tfyykNXW3G33IQxDCued4MGgI0OB1A3Rxpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcOSy5jyD+CqB/hhGNI/46Z529GJn+YbcG5X8KqVdko=;
 b=EZuNBK0SOe7u5ClDvt9YHe4nmaqMhH5f5grIujPy/+BDO2k6wpDFobp0mZWU+NwABn5UO3P+i3aXgN2V60e6PL2cEAkDWJnrX4j+mkoPi+WkUg0O9JsLXSlB2LZj/rCLT0+Q/eJkQ6PRySJw5N94zZBvVn6DLoMjkTtIOFrDHQI=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by DM4PR10MB6253.namprd10.prod.outlook.com (2603:10b6:8:b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Sun, 8 Dec
 2024 00:26:49 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8230.010; Sun, 8 Dec 2024
 00:26:49 +0000
Date: Sat, 7 Dec 2024 19:26:46 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Preface usym/umod/uaddr with pid
Message-ID: <Z1TnxlEjHv+BKutr@oracle.com>
References: <20241119235125.20254-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119235125.20254-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0442.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::27) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|DM4PR10MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7ff449-eaf6-4419-7031-08dd171f0184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kxFn9t+A4PjhFYCL9NhiLRm9R/nuyHmOczZUVvSdZ5DYIuGglz2Ex5E/S4QU?=
 =?us-ascii?Q?XRwZGn47wCxOPpz8Em4xzny+3MyLC+XY2hm68Be7FTXWqTj1i4dUUewLvzC6?=
 =?us-ascii?Q?6saWodPGHsFNKzsMx8YHDY4NeVGeqZtfoHW72k8eas41fFaHao0IZ3H7+5eI?=
 =?us-ascii?Q?jImaFHpLvcyt64xXY2Z4YhYJ+I7oR2ydEPpkoqkM3F58VeKRdzo4HvnXF/Jm?=
 =?us-ascii?Q?aljAe2uo6IhAfTdg0Son6hr9tkSXEatgw9kNYzvfRouvihiGSHgYMUlFz91C?=
 =?us-ascii?Q?klZCudeGA/PyEAbxciJ5p4EAKK8p4HpBGZ1PJjsrAsJLAF5dFNXeiylGhixe?=
 =?us-ascii?Q?pN6HWyCoOqc7RmObjkhAOu+Rps8U8Op7kW1skPDN9Jhg+JdLdI+JAacUSMpx?=
 =?us-ascii?Q?4zKNESsDzITWK//uBn8RF/9Wavd6gpvT8rXEkK8JVp42mQMSQh2RLhpEJPyf?=
 =?us-ascii?Q?url7x/PbQ7RD19QgSTsZHP4eucoqd5RGegDirwaIsgBnSqZg4HrXxcN1Pq3l?=
 =?us-ascii?Q?BA+HE1e3E8WLiTVLV5aoI9E0z7lLISkZltrPgRPgGCYOzgCDuRAqqYuFJvAi?=
 =?us-ascii?Q?/tG7NczNWwimlKFuMFDn2HcUHYGTY0q8aQyBP/wNF31pKDEm8xo0/CQZgLF2?=
 =?us-ascii?Q?ZyNeVCQny5gHnV7W/N2ChT6xXBeDNiewP5SdQ1YOFii08civNKxbpjPYhCGt?=
 =?us-ascii?Q?g1ddQtsi5Z97JUOpb7n+fDelojHqYClyDFg2omxai/lr9r2B0x9TBJTGeaHd?=
 =?us-ascii?Q?QMEqFfI355Fp3TWtcrNvQ5V9EFFGsb8XSFzGT14/Ud2/FLHlnkfDs+5DqCfw?=
 =?us-ascii?Q?uKx5jbpdbjA1/epPMpxJwUQ0BKNcD1cjbjkRvFFhYKTU4Ea0sk3PE4+bZyNF?=
 =?us-ascii?Q?QtPNZkVDuQk1v4CtOvyn/a8SNnkAw263odA0J7haMG7/pkDyOPtjIpCFEh+a?=
 =?us-ascii?Q?kbaVvVRFHMwCpBK/j4/dh82ie1Zb6M5cS24yyqpUzIVx+aLh4eYjIdUVU2Eh?=
 =?us-ascii?Q?uoC569Mk1ZLCqrXo73yN/09M9SSXDIkLMynhtccQfy3yG6oOqkzSq76pA9N9?=
 =?us-ascii?Q?EaCiTt2GqFWFQm80CW/k0rI9RORJY5LtSHXyPTi+WTVmzrCue7UiPUEhx6fg?=
 =?us-ascii?Q?hxvqUf86r++ATIgMD3ZtSn+iabhaQFfSVedm06tLGxcbQMMnqDeXGF7zWHXo?=
 =?us-ascii?Q?vzt66sMdqIak1zrQI5iuZHLGa4OBqQQiqTSJ8x9LkpZt0NVo1an0DM547yfc?=
 =?us-ascii?Q?HYpPcs2YhRNPcblYEyBc2Gk23CM04Zzyzv8nx4Ti7Ax2pKuYVM8CjdIvJQoW?=
 =?us-ascii?Q?4U+5GEwsiqaZlVAtwk1cDZaAw/kYlBVqChFLjQe9OuitxDvT3ZHjWGlYpBmJ?=
 =?us-ascii?Q?RME8n5c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tetrywqi4y+oIISHX/esWRL8w73lEFwxb5ucFhFKjRsoG+vSsq2Za5abY0GV?=
 =?us-ascii?Q?ZyI053bZH8p3DoSJsZpLU1AQ7RWG0o96ghVUFBwHhlznSmKDKfsE5S2gF9jb?=
 =?us-ascii?Q?g1fQaVYGt2enDz41zGrqayyUry9WshLdY99tSIb5WCB9A4uKUxDpj4SpZnr+?=
 =?us-ascii?Q?YQIM8XuZvoiuZLNzsPFpTYRrL5uyxyDNbCiTPB8rLAv6ZFpUjyQcbE7w5wdr?=
 =?us-ascii?Q?eUfadYFIGauh7/FjyAySVLbiLjMoBOkXgoY5KCq4KESDMP6wbJEOVWM5gS5v?=
 =?us-ascii?Q?MaB7Wu66WjbAMRn+jBnF3JpnqTqzHhluNDq1O0Xug6xhbjx6HkjmrMlYlfqI?=
 =?us-ascii?Q?X5oLq7Y8nJtgmv/WRRtZYyI3Rr2PczE6dA7eXuloujNjhFmvi+b5bR7bj0h2?=
 =?us-ascii?Q?7/5BSwPVlBKeBuuHvXPe3t9qIo7X5RsrXvvKFKAuKSAvHk2rGIlxjNiRWSsT?=
 =?us-ascii?Q?eePmb5OTM+21oqjdm7tEJebK4HwD6QQb86Dl6PANSgLtsV2zyRQqiICqcEuZ?=
 =?us-ascii?Q?UCxE8oeVqzf380fvCA3cZIxiUVPffoGk1xp7902gXxUONx/ALx/I8FaKkKDw?=
 =?us-ascii?Q?9uFMzGbN/kH0dmeMjiKwHj8bXnOI1pBsJZpPtI1bxuIw1A7geWHVYWmme5sL?=
 =?us-ascii?Q?bVXi3aXbfqfsOuOINjxQeYfP4NYxWPc9OkFO3+IqQs+P7GPQ5fTVYIj75MXc?=
 =?us-ascii?Q?3neXzWQzmGbb7NqgUWOsL77w870xEASW+oA5Z1knux6pV4bghXyupQADxn4t?=
 =?us-ascii?Q?lDKIzCca8OUDciRkGbbRtk+YmGiyGJyvUl3xHVPyZouMLzNyL2TKr1pSGZTQ?=
 =?us-ascii?Q?UdGDjraaaesxABRs0WKldrFZKP4fu3or6omGkk3cI6oiZvRTXplRZPQq38HP?=
 =?us-ascii?Q?m28akKIjJ7fghL4Y37cB2t9zKueDBU3S8xvriLM/xxdTXywVEOi61eHLsaoX?=
 =?us-ascii?Q?Msn0GLpXytXgaa+dCOwOoYIC8gqPMvuMIWcrhvH9upE1EAwoImtN6iRyPjbg?=
 =?us-ascii?Q?WvxmLyNhoM2lqry/fKtctjhOLdBb1l3ksCTfYEsqmXB3Oaag/BOIAeeb6P/G?=
 =?us-ascii?Q?4h0NGVzZRiZJ57D44AzmqP9aeiZlLmSeaQPmWx3wNRv14u3HUfTYzLjTGSqh?=
 =?us-ascii?Q?fBHyWfdfl9msK8UXpc41emJp86zf+3LnqeqvwCQHrTD8lMV/gYDijnj+Hfjr?=
 =?us-ascii?Q?VkyVwaIdCFyewyh0YAEMkY0S/+Qd6Jly4LFpMBN4XeJYEiFgQoJ15Fd6GkWc?=
 =?us-ascii?Q?GT0ABLAHajIQtGffqRnyk+UpxdpeoVxULNsorFjo5viAjQV4zQMjiw3Wi+J0?=
 =?us-ascii?Q?t0K23oe1frUQI4qNAv9Wq+9HeuUSUCUJR7M5MCZ6uvbNZEVDcNQQs09c0Va+?=
 =?us-ascii?Q?35rLggf1h2voskBjzSQHWZyhKz2O35Gnr2raXSXCxi1JcqQEG8u9BKMv67UW?=
 =?us-ascii?Q?bwOLW+p9KegugNEQieB4B0qDhlT6qFzHVXMvmtwYaz/l9gHiwbcrkRoG4snA?=
 =?us-ascii?Q?Ci6o8YDpV6rWzeXNgQVfCzolInnQu7E6lLa48khZ+NWVk2TFO0Rf1R6pfCQp?=
 =?us-ascii?Q?0KF4uMb3Gqjhg/y7swbXi6cZqv1jH3lbmPH+IS+hwbrK3i9/2wmP/ngdQ2Mf?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IK/wLgLJp8hLNJwbMNXpw21sSoLf3X8YaVuVobM5iDhTiDMxtVfdUKL9h9wMNyP2kcZqpvPlE4G8a3+zZZUGG+C+zAC8G8Tr06tSPrQlICsZU3ep5w49H646FjUNmRcwrXwost2TNSjSFGUvne0ZLkj0yIYR0xJ1MirfLlo4rMozNGnlKPAgor8BbF7EppfMMPuP3zBZdRcrNm1uHUbtHwJwva/E5vgYXqBaOM+HTNrEJbfZ4YI7vDWwZSlSFERFk6Gf5XprS8W2s//1n2qw/FMAJFZ3ameaB96OkxhOFYbBBDUOs7UjXJpeeAF+Kg8VNhRRxIGQU3tUZ6d5qvnfmwjPeLXHoJhqMTjnmXA6EhbFCBYGW1XWvdXonBEas8JHVERqlPTWc3AXbvN+UTf65WGgXKu3r9fEVtSFNInM3yyNAPPSforPPRJLD6NzNcqdvLgDCGwKa823zdVA08XePKSR0b1Z+6rc4Jstn5BR73rhWU7/NhqRVhlXClEHj44bJ7YttUCJ1juhyr7BKk8dRWsY+NgTHl2xhpdAFYMFKUYcVYi3BwC84RlmpZXf0QIbFQBiMJgvRpcrzHNND/JG8xk+rz0ue2agB9Pd+7VPvSc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7ff449-eaf6-4419-7031-08dd171f0184
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2024 00:26:49.5197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6j/lTbuXgG3fzryrkhim1/S/eTyecuJU5JMZVmHz7FJQ0FbLCAjPV5wtdGcAYU9W9Fayyh6BZtiB79NYjvSVsj/NzyIEQ0aNMMZvdzQPtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6253
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-07_05,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412080001
X-Proofpoint-GUID: uAcWXrEGxK-RFnt1KlkWuSpZCqaR7-97
X-Proofpoint-ORIG-GUID: uAcWXrEGxK-RFnt1KlkWuSpZCqaR7-97

On Tue, Nov 19, 2024 at 06:51:25PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Translation of user space addresses requires that we know which process
> to use for the translation.  We have been prefacing the address to
> translate like this:
>         /* Preface the value with the user process tgid. */
>         emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>         emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, 0xffffffff));
> 
> One problem is that the IMM "and" operation is a no-op.  The 0xffffffff
> is promoted to a 64-bit -1, leading to no %r0 bits changing.  Another
> problem is that we are pulling out the tgid.  This means that the
> translation will fail.  Further, even if the consumer knew which part
> of the pid_tgid combination to use for address translation, keys for
> aggregations could fail spuriously due to different tgids for the same
> process.
> 
> Convert to
>         /* Preface the value with the user process pid. */
>         emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>         emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> 
> Also, in the umod test (which uncovered this problem), add ld-*.so to
> the list of shared objects we're going to skip.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_cg.c                   | 8 ++++----
>  test/unittest/profile-n/tst.umod.sh | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 461a68270..b07aaea3d 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1647,13 +1647,13 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>  	    kind == DTRACEACT_UADDR) {
>  		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, 16, 8, NULL, arg);
>  
> -		/* preface the value with the user process tgid */
> +		/* preface the value with the user process pid */
>  		if (dt_regset_xalloc_args(drp) == -1)
>  			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>  		dt_regset_xalloc(drp, BPF_REG_0);
>  		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>  		dt_regset_free_args(drp);
> -		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, 0xffffffff));
> +		emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
>  		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_9, off, BPF_REG_0));
>  		dt_regset_free(drp, BPF_REG_0);
>  
> @@ -3823,13 +3823,13 @@ empty_args:
>  				if (tuplesize < nextoff)
>  					emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, nextoff - tuplesize));
>  
> -				/* Preface the value with the user process tgid. */
> +				/* Preface the value with the user process pid. */
>  				if (dt_regset_xalloc_args(drp) == -1)
>  					longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>  				dt_regset_xalloc(drp, BPF_REG_0);
>  				emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>  				dt_regset_free_args(drp);
> -				emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, 0xffffffff));
> +				emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
>  				emit(dlp, BPF_STORE(BPF_DW, treg, 0, BPF_REG_0));
>  				dt_regset_free(drp, BPF_REG_0);
>  
> diff --git a/test/unittest/profile-n/tst.umod.sh b/test/unittest/profile-n/tst.umod.sh
> index a5b1127ff..45d2b1e9b 100755
> --- a/test/unittest/profile-n/tst.umod.sh
> +++ b/test/unittest/profile-n/tst.umod.sh
> @@ -53,7 +53,7 @@ if ! grep -wq 'bash' $tmpfile; then
>  fi
>  
>  # Check that modules are unique.  (Exclude shared libraries and unresolved addresses.)
> -if gawk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> +if gawk '!/^ *lib/ && !/^ *ld-.*\.so / && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
>  	echo ERROR: duplicate umod
>  	status=1
>  fi
> -- 
> 2.43.5
> 

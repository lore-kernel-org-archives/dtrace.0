Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1490D1C2BD
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 05:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722576564; cv=fail; b=WNw7EmTV0+PFafbvn4W7y1HaFxjuYClJCWBJyn7JycLizWQ1HiIDExesAdxz1WyW7PrnKV5afMHmLOVJqePoufbq9D7WAuiNo6YujD/Q2JzBJ8fxB5N1B47f5QeqBCNBrJtuVDY42ZqUMVR66VU4Ir/k8ZGl2Vbnp+m1kZImRO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722576564; c=relaxed/simple;
	bh=7eK7MSB4J2mJ95yhsVYY1fo4tQ/tkdiJdEbqOji8mrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u61uod0dicuttwkOg5shpWVeHhJpb7ejmccHhIYxIBenTi/ihGU8EwuUHmvWUmIBnbzrQE1GiehGit5vEtIrG7TWEsbQX1vDxzPsVrVYKTjW4n1xkLuqKkiMhz87hEpyw4jztKLMpTDOBJpB5vWVNr4kVpRMXm/HovNqDVCjhUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OxdiQjch; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=guE90Wvi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OxdiQjch";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="guE90Wvi"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723fWvq013617
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=fuIxurvaE0ABLk8
	mB4tNz5mOHh+SHY3MJKTcY4DtZME=; b=OxdiQjchq1CO7kQ5nh6BEkAyjyKL3Oe
	DJtFasmidoFR0YnBkS6EWHQPX5vVjrEPq/OlPI2z28CUki3sVwJRSBXMiiNoIet4
	NJk3wLteJx4QEpK3MSaz+j+pp8c6zmrWtbFE5/WhwbpQ16qk10WoPBTeEDgvVHx4
	YPD+Fy9xhQKlaMkbUg5gOaXhWluzGLMtvihMPkeSZo7QfoS//huHdKb/9dGsrQMi
	K/qMEkJhfr6r+1RgTzX3LUP8+P5OEM6A2aJXBeQjI8JEx9zVEvr3B8v6cvWnQv1V
	LhFBl2LwPtdyIz3PIfb/7NxWkLDgtiOLDk+gdNKcFWIDNewNaqImXlg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjg30dwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:29:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4724r3kO030795
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:29:21 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40nehws2s5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:29:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqT6l/2cKUqtqIWcCo0Jnj/zICRNNcMvut+vZ/NvAtUgRh1KZF1RgoBsEIyuI1VlW3wR+Irr8GvPxbyGDcV6DsPnotFxyKyWUQSbBApc+uCQ+1AuXab69QP1RPhi9mWs8O2t0Per/fCkR01Hr/Tyy5nJU7GG4WXrJIZsLix4sW76oL9Lz9xGsNbWuPslawPpXFRv4gTQjEZgvCdU9wamYOHUJbUQjCoelwQbrZp0WffsNMGbRGtTjTUWMzHU5ExIKh1/XAZkS6FXkE/HIzvSCas+YGATVH4UdJvnvSLJnUuPyH+HSa6LCVlyZmy8OHpwIUnL9E75A5qG6S+WBHRSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuIxurvaE0ABLk8mB4tNz5mOHh+SHY3MJKTcY4DtZME=;
 b=dpZdrDcJZSGG4E9/CG+Y1iNlqY3vlj6DqQMZtEbBxxa/YTs0mOc+45bBu1HQob7t9OHnbyevp9iKv9uPe6z7Mq46ibc3yRUwUN0YiJly5MW4P3KaWXS3+kcIPrnOC5ByutFAHyL/xAOgvaXeAVgIrd1tX3er5tqfPFlChT/dnRaVC8o6AZXcuZD4P8HC0JeEkoHdFnmMG8WCwSr9KoowACWkNxUr3RmxfzHhcJBpD5nuVj+Er5pGywFq0XeVSoDrXrL3KZXW/r5nVc04H8S3udY+zJj2B3oS720t/OIcvFQPVpan75GEfnVvJVvWDeyXQ9iGm8Q90kML0quHiv8RKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuIxurvaE0ABLk8mB4tNz5mOHh+SHY3MJKTcY4DtZME=;
 b=guE90Wvis/1ltS28XQHCGkl+1wVZnuJdYhAuUMFjGaCCVGA5Qxh/e2WQ9WpR/nUUkqiF9S0Hnw+Je7hQIPCmNwrxB+UMfZBJI9qIn7FhEvPltme0VcVrIyCbn4xO47V1/8KMs55P8uTm4j0XjyBrDuFHk3aEcV5AAZsA0bKJcZk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MN6PR10MB7421.namprd10.prod.outlook.com (2603:10b6:208:46e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 05:29:19 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 05:29:19 +0000
Date: Fri, 2 Aug 2024 01:29:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        kris.van.hees@oracle.com
Subject: Re: [PATCH v2 5/9] build: the TESTDIR is relative to the LIBDIR by
 default
Message-ID: <ZqxuqqUVmqNMdrRE@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
 <20240801132156.286780-6-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801132156.286780-6-nick.alcock@oracle.com>
X-ClientProxiedBy: LO4P265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::8) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MN6PR10MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: f135b710-f4b9-4130-5937-08dcb2b40e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7VVzox3W1tic0cZVuOXLsAuUVI6Au4DJA5gFD1hfGbzll2rX9ym6r/oeTlrt?=
 =?us-ascii?Q?/dtKFrv1d+vJZa6hCAbzysHBmXYsviOyIEKY+3sqDAbQCAFGPkF3Pjt/G0tk?=
 =?us-ascii?Q?3yQQTFt17/QDnnAZsZao8DRbv/W7EzBdnzyAjeSnlkQ0QvrWdFN6E9X+cG4L?=
 =?us-ascii?Q?8Ic2C1vwSjFzVgCap031uXzZDCqgy4coh9D809VbXNPQcxhuFsCJ/NS7ZByq?=
 =?us-ascii?Q?gBYDESJVxcepQ8Sbc9vbJLh6cXX0GVB9tu2k8q6UkAJERlgh3EZoWwNU204y?=
 =?us-ascii?Q?H7aKNPaYKHZu8gahfFx8CnxJs5jRr/zH+b7s+UQZHJMWk89T3ZA+iTfSfCwf?=
 =?us-ascii?Q?oxaOAit2fi/J/GSkmOisVZBrWH8VX6sDffyywb5qQQGLrGVDkPDw66tBtm9D?=
 =?us-ascii?Q?flaJjkLYKlTzd4QqPRT4h3X6DHFHc5kquuEx+GU5/aIjVEmheP1zMWxBMMui?=
 =?us-ascii?Q?eRhiSnjUR4OHa6msBSBvTcMXeuNfgGh9R8cgLI4QJZpbgJpQp/26zRsNJxsM?=
 =?us-ascii?Q?M0Yytw7r90ZUPD4xYGlNlsykhd8Ml5BbiBYvrRFqO9DscZD5FuhjVJYd2EJ/?=
 =?us-ascii?Q?a+6H+zw63/4tEWxmZ/1+Qc5htRnl5N+BO1ZbrhoaW9SYivsmdVr4+M2gxxjI?=
 =?us-ascii?Q?3Z1TCQKkgArhATjZ9Ab7m/6h/Ok1p1CmDAjMXpTgIMUp9s0itKDxcgH1xHNN?=
 =?us-ascii?Q?vXU8Ka8zvoR3+1U6fdAZh6i+37rFKjZXaWie14Xf1e3fVzo3movolQ6Fe8IK?=
 =?us-ascii?Q?AIaYud0N5aDLK414lTao8EVSwUvk7mTXs5RdDHGEYw7mohbVd0Pbi1kNI6a6?=
 =?us-ascii?Q?ewrav3DMYQTfxN5+UeaZAIImjnbkRxUnq3bUzLT/w5WhQ0qKtDo9s6iWiKyy?=
 =?us-ascii?Q?l1X+dIZE4rjb7V6nlLUkQ+DDE7wr0w+zO/hmT9Ae/Yb2UpPxUBRvYa9saLx2?=
 =?us-ascii?Q?RksxX9Nb1zFeerPy+eHhb18DXnjfBrh71VexIxR35oL1z/bTD6iCbfI1nF/7?=
 =?us-ascii?Q?Rlqqzp4OAofQ1yzfiUbDZlniM0hd+Uhfzc5ARrEO4YN6OyrLGN3Lb8kgXAlI?=
 =?us-ascii?Q?dc4Cb7cBkNmysqkN3N8OUOV1qbJvR0yv5483FyB7D200iIU5Aj4MQaWuiPdi?=
 =?us-ascii?Q?VENbGATpGI2l+e+1Svo0wo08CbLvy/odM00tFu1rrVewFCQUSZxvZA2Xo7hS?=
 =?us-ascii?Q?VT5zREWi7kfG5JJ4oG6U2utla1R0/aJGreUbJOaV0gcMgbN9mw2CDZXMNOc2?=
 =?us-ascii?Q?hnPaU9yTY84pTAAkBQgfowM20BwdQFSTGgfngiVgYbguausUlq1eWM7aVPiP?=
 =?us-ascii?Q?+johbZ+mvwiB/pVjxZUwdxyK5zjScVm1YV+Ml6q8xVTuHw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vhRoV5gtdUxhYt8w24kdCG9U43pCQZ3Lim69HUOKi+9XRhmGNJcLKEpbSjX5?=
 =?us-ascii?Q?7tDSQ2tbpKmg3i+DSQFyNltEPd/dp7tX7G2byhnKw3aSMT/ccCJZKgAM3xEo?=
 =?us-ascii?Q?j6liqs2yCJPdrKvqfP8vI4ZXCwrczGx71LmUnVgRtgPiEZLFqJGKKeqtuPyH?=
 =?us-ascii?Q?14+TDCtZlRtUGsUKdd62nYGp+RBNGMeN8DbKPOflZ/+sGUttrg2vca4hMoE4?=
 =?us-ascii?Q?Mm6S3IteF1gcDtNUabJm8LujGzkZwxJ9OhPCmWvn92p83dKVsKEs6xHyZ0ym?=
 =?us-ascii?Q?8mQDIYq6OMuHK1q/LRPC1wUNJXhs5jDr25tUqRFWqDP0W9MJ4tXID55KwuYh?=
 =?us-ascii?Q?9rMy9tt0t2nm82kx6sk2bE5GScAjWPFqm47pA1RS2kD0L/jVLTutYKAPZZL/?=
 =?us-ascii?Q?SOzO16QMPj43S6xbDjLkb6F5vaKocWQxzj18iKbg+07Ozd4SpIziVNXnmkqj?=
 =?us-ascii?Q?k6HDDB75dyvn+/KfzbkJdrolao/MxNTU4takdpPstX/O4sNC69SvxSOKt+dL?=
 =?us-ascii?Q?CU60PKf0D/7lZqRmbb/q+bbYasD9jh5AeXE/Izo8nqTNPB7L1enlPZuqFTp2?=
 =?us-ascii?Q?LpE/nb1+0Fu/U6/ec4SE/WPt9y4FIj+ymZvYdqbHM/HYhJ31tLVZ6pwrBXnA?=
 =?us-ascii?Q?wRUCBUViMkyJGhhEo791EBRtqcHlMqd0ffQONH0ZFNXcyfF1r0LvXFSGI+09?=
 =?us-ascii?Q?sm84KbhXWSfMa1H97IvFuQ/XxLXTK1IRvoLsGYC/91X5BLFUcgXflO1cbRIq?=
 =?us-ascii?Q?kOvHNQijOZhV3+Jo1S0E9Pto/0W2jd1f653OMMRuOVEZFQy7ccR7vbgz+vKq?=
 =?us-ascii?Q?zQhqQnzyXwfpG+m3q2K/gajEnTlIKL/9mqkSo2AQlMRhB7wEGtth+lX+afM0?=
 =?us-ascii?Q?Gv2Pt5hYbNauHYa9v614iUWChf5i/MoeG2nQqkWa5a+AezPE7n7M89f73kwM?=
 =?us-ascii?Q?9HPxZUduO1Fc+HGtpntbEMNrKEsAhn1cBHyMfBqcWrm+BE4wjMh2Komb69CN?=
 =?us-ascii?Q?QyRff4d1dHJ1Z3u7ur2cewASW4iAGADXogH8cVjHXGoxDa0cLy6+0C560LKp?=
 =?us-ascii?Q?rUjYLVVYl+LwSNWdq4hqmnMTieBBH9H41TRn0GiT1UDNXdAEmcvClyqEITc3?=
 =?us-ascii?Q?0CLF9Tv0ZFaUBhbAvReMhd8VlzRFF4gHkBwI0pvigaMJ8H/AKQodEXs3oMh7?=
 =?us-ascii?Q?z+hQy9n0nS7qz8MmGGyd5QJn1zx76gvFM3clhEP1pQq2SPTbkxZGIwIMa7Lk?=
 =?us-ascii?Q?CPkGVZ6F0Y1HRc6XzAym6qJL8ZnuBuryKr+sHlCAnMeWkaGnIj6FuwyZuTdW?=
 =?us-ascii?Q?swesw3BPFTqMNk3w7YUs4jBynBCnxeLuEFDB4hCStYk6Vh+7EZ8k0osD6tQt?=
 =?us-ascii?Q?i6urJUi66jkHlAGdll4lZXi/U6t7+xJyhaXpobIWO8G9+60pSSdbTlabDpXq?=
 =?us-ascii?Q?ndGX5Jxhg46VEcil28ERZG1sqU7qGDhU8y4BpapZWZO2HFob6g8M9WcUrcQD?=
 =?us-ascii?Q?JqosUvCJwIetn/losTN5f6JklN5t8l57SsqBaNg1ES5IQVG2LdiagZnYHG4p?=
 =?us-ascii?Q?SilgaYCO4pPI7UqLXmeyWqn6I+J+i2CIoMSxooV/AtDaoBKsu+gTI0Sg8PI3?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sfps3nqFbWpZuBPvJYkD7b5EIlz95/qRk5qOaCaquVx4FmBRDOxaY3hoaA4w8vvV7r/L5idyiGWu44/QJXznPEHcJZIxMlIBxo8f/d8yE5JIbG/tq5FjXa5KODAKx2QnOyfbdCUgN7VRC8yHApTkz2AsntPCyBXnioRs28hRu+weL4PM21jo4Xnuik5PJg/2F5mFNcAWs2C+c5GFsNBo5JHRgj4xUQ4Fu5z4FPqnOQ1P6+HcXrSvLPITOvLSGBx47Qg4PUuqS3Q/peP0i8XRL6Dz7WS4TaouIRyaViA++7AENxTr6unlkADSkhs9Ld8aFU3VmT8xZXOSQrA6ShW9tygyEtvX2KqV7KkAOptPPmwolk7XfgJQlgNH1mH1UhHrCn19L1ALXGQHYP3stOtOOdYdm76bshzHXgjPWBHRslQuB7/EVP/AEfmzAMpEtMKfwLdv6UcQjDlVxZhjN7V42Ptknxw9PatjTYR/ZhAmypkBNjB/iDOH882YiVoHJ+h7EWEcGMf05f5/Jhz9t/OmZFmesTn26i+T9Er55hTQRTwLF0vZW6GdfJSgDtpyUMHSddRX/9vSCAg9BBnA9r0OqtoCnRkn+oxDdcUQyOHkKs8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f135b710-f4b9-4130-5937-08dcb2b40e9d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 05:29:18.9483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQPmc5kgFg7AgaJ8GAyeT4D531pPVIyiN7BoxtTNiOKdqptI7vWdpyCw+R2MA7Okkkwgspd0Fo6Ikz8zaAwySm01na59trXKzTkucqEOS4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7421
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_02,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020036
X-Proofpoint-GUID: UFpiwjv7smmvGK5dCUB03MtHdQmj4gQ0
X-Proofpoint-ORIG-GUID: UFpiwjv7smmvGK5dCUB03MtHdQmj4gQ0

On Thu, Aug 01, 2024 at 02:21:52PM +0100, Nick Alcock wrote:
> If users change the LIBDIR but not the TESTDIR, the TESTDIR
> is meant to follow it, but wasn't.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  GNUmakefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/GNUmakefile b/GNUmakefile
> index 5903a8e355f6..e7657d466df5 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -100,7 +100,7 @@ MANDIR = $(prefix)/share/man/man8
>  INSTMANDIR = $(DESTDIR)$(MANDIR)
>  PKGCONFIGDIR = $(prefix)/share/pkgconfig
>  INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
> -TESTDIR = $(prefix)/lib$(BITNESS)/dtrace/testsuite
> +TESTDIR = $(LIBDIR)/dtrace/testsuite
>  INSTTESTDIR = $(DESTDIR)$(TESTDIR)
>  TARGETS =
>  
> -- 
> 2.46.0.277.ge12b8151ed

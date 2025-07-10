Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552E486334
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 04:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752122797; cv=fail; b=SFo/IIB8myNANsaGWSYkHXfGxRIo89/P8nms8BuGcsEsdiXAH6XJzkAg24Debumr3kZF520+I1cRTfEcokb/5ItohtZMF2eYI6UggpJQS7xbsd9cDl65rJaNLH80hTOTdj7j6WUkLmsSmPaaBi+zmK0rp4emuE8Zar9Cl0wBo8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752122797; c=relaxed/simple;
	bh=FHDeZFuKcOGzRVNSfjpOjTnphUWstz1WZIzO5G4Zi9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hpK1Ikb/m07L1/jZ7J5PLEFk6gmuBrpB7zN8w5h3S1eHHjBgBOb/me6eeyt1kBnRL/od7smbC37QZyZ3nNW0Qp6UMgywzEhGM0VKDh74Tec5bJXmGoHtzjv0r7nlsAHRbMtyqXhN+QLM/j+xBqhGiFWfaRHwBRUT9fuN65P4PKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SajgeGiK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XWsxIfw+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SajgeGiK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XWsxIfw+"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A3WGHv012855
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 04:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=HHxNzFxyCoUP3B4ZdI
	EwOjIxPzS7IB9vlepEXWPFPRc=; b=SajgeGiKudnrFOqllXGFbEpFRZJ7ty9Mm4
	Q6c/nStzs2wC+HSOwrorzFbzxlKqcBR0f2SvA/xnwBxUQk/J9zEUN0ZNJnI3CND7
	OX5lgDeEHGp2Rf/75dCcS8v1JvK3rlt1PViaOLGyEhNMEOH7CwH/C8f9xNE1QBlP
	le8jdCJGs/QCuek3vzIjjINPJy+0INHnAHkCkJemvyCrd44K5gUk9UUP5Z3Cegmy
	YEoLAffVpU4b8OPNDuF0NCJsGtoeNzsXBjl1CpHYIV5UIsz4VNRK/s/GQcMGguvR
	b5y1C32/9sJ6GYFPGTNI65PeX00o5MJfvd11lbS8IPRQZ6aB9uSQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47t5phr2mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 04:46:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56A2Qcob021874
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 04:46:27 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbrqes-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 04:46:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J21deCMhkK0jMMntCdRLtt7txbmpA9PC5BthCSTOJV1dNrUt3wb94ptJwDd9JF6IKIIoWLwRzCd91stww9Zzjqm3u77uWZzO9M6VyZ5nEKx8CVmKMVWfAhseiv6yGuWNPH+RRAzC0CoTV7nmGClRz6h4KcNWnhCPPma2iDknmTNDBk7OJ1E6vi/Q0R7SFAVqFh/8EvDVVdh3vFzgTHATWf79eCPQRahSB+2oXR8pmk89eN/qohC+tDlOn45zBJU8Zjqeyk48Cd/oo1csdZTtXZOB6kKVZK6gaXTG1QqSX2LLmkSpafNZn0mfA9LCceTTrs1zjuvpLw1vAG5W+DN+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHxNzFxyCoUP3B4ZdIEwOjIxPzS7IB9vlepEXWPFPRc=;
 b=jgBdkfB6Eo2IhYq//058KPCD7Ib2CLQL86i7ofq+Q2RVNTPz1UjHtD6LpNsoKlfF6bjcIbRE7Sr19a1pwd8rWfEzmKTnZxuYSkLXgxOdyBDljfB/d4UjEh6Vm1+lFMTNZqPU6ib4GkwmJOlJgtrShWbxmZx+nm8V0xcIoCOL0X2bRUYfpUwqTFPhDxYh2S+3bWxMhxlY9djAVu+Kltill+SfY6fzJPJxVFCBEKMA7/kQj8CTqTOWmaKJZA5hyr6T6PD8f66GNhQ6Cg7ri2bPQRARQ5dpP1P4ctxtBPaxWEuHp2prw47sO/AjJYgHAoN9a+nqjkMlmEnwLy/vXI+qLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHxNzFxyCoUP3B4ZdIEwOjIxPzS7IB9vlepEXWPFPRc=;
 b=XWsxIfw+hfTQ5/bGYFwyTj9NCjBb2rEiXAwMU61pGdkH0pyxMYiWe6QQc7QtLq3lVGzN2dD4A/skK49yGgCQhEfqU0Uj56oQSjmSxl/EDOGENSpSkoziQiG4Wupa8IZL9okolSFfTedp5bDRL2TmGar46/7donQqFJEDyzKMAHo=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ5PPF1A1B8C819.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::78f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Thu, 10 Jul
 2025 04:46:18 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Thu, 10 Jul 2025
 04:46:18 +0000
Date: Thu, 10 Jul 2025 00:46:15 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 2/7] cg: bump number of TSLOTS to 6
Message-ID: <aG9Fl5wugl4rYLma@oracle.com>
References: <20250709144700.20591-1-alan.maguire@oracle.com>
 <20250709144700.20591-3-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709144700.20591-3-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ5PPF1A1B8C819:EE_
X-MS-Office365-Filtering-Correlation-Id: 051d3e6d-b3ff-4996-2831-08ddbf6cb5a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KDWksGhawTxwodr1Liks27TNxdiluDDmPyikAcUR/qdFbChtW9sbOcWFmByW?=
 =?us-ascii?Q?7GVRaD7IeYptVf9KQeUZhjQaizqu9ErM5EXc+/caY8m056cUwHVL9SE/LNVB?=
 =?us-ascii?Q?RITE9Wzq+1HnMb4IGS5a9qprJ291yvkR/Zn//vM721e9ahBz/9ZsKWvZzFYd?=
 =?us-ascii?Q?C3/P4Si/gj/0TIALtP7/5BEbol4nwPmcgBcz7hqPvEAW726AatPqCYdGeutD?=
 =?us-ascii?Q?0GAxZ6zOMv5qB5SK+U6vWtClb5hPmZLLL7KxeiH0PBBttUQY+yrVacf3cw3u?=
 =?us-ascii?Q?7AZqcu2eA7Pxkbpb3LhARtj8Syu7akdW6n93ARAsmJRnQWTdHfmO52L9jw0H?=
 =?us-ascii?Q?lssfP1V8Vc2mCE7E9u4L4AxXsEbKF7kByM949giZPTOkt6GltYrROmp4oRq9?=
 =?us-ascii?Q?O3yPicrXc2KqANyRtzADZg6RGjRTtReYAgSY4Erwbb03abDxGHUXCpQdmk1x?=
 =?us-ascii?Q?3MNGn7P5RHCYdSciLvSTvzqEaQYim0Rn1HvY1UYPhtdGGVluwE3hwTDscL3Z?=
 =?us-ascii?Q?10vgx6OTwXuLwPmrOqbYuz3hQsSE+ZWNc8CpaDMox8sRYkP6y+vgRIYhS2aS?=
 =?us-ascii?Q?jzhWr2WB1pQPw1duP1pl9VBXP243PwglPYIbTH0EySUxM3577kGiBbVM/R7V?=
 =?us-ascii?Q?B7uUFyGuQIoGSbxz4tUrdRlAeRR/Ekn08Wn2I8BZTcVkksm8WC3pzo1tc1Uo?=
 =?us-ascii?Q?kTJ4m7qbfANMy8ZNJUAC4cHNB01kcq9bfk81h3F/pRagOlowRcmlWC8q5uiy?=
 =?us-ascii?Q?LxkNdzdw6kbI2DQlFyH0Mp5DlNNqFE/6+3HOy44kNZ3vv+Zmf8tWpGjiWZrT?=
 =?us-ascii?Q?txjhSGD06iB/hvY6kHeihBIYRms0vzwWmYyBnzKAju7e+IMG+4LRFUh20agQ?=
 =?us-ascii?Q?U3/mqxccKss8MqzyIMp0FbPvY7PSPC9jntDi3muiCBmtEnSOS4HHn4u8P0NZ?=
 =?us-ascii?Q?v18NRQv5Nstnjdnx5oovOSykby/5o8VPIAm2S50iqRHVvg4/Yuslc7wi/1B9?=
 =?us-ascii?Q?17zguctQW1G8oPOA++aHmq6TA8VLq4D8zytsvOQqdUJGoWLfCGcPL8K4NoLF?=
 =?us-ascii?Q?lsipTxAo+U+nmqaWY8VI0eHLMeDl027SiinwbRTdzOrmpChmaYBNUoiHI3vs?=
 =?us-ascii?Q?/e2mzh7E39MJ/vNa3F3El3bmHLajZkZKTScLKzDGwJ0taW8VidXTYmx91fca?=
 =?us-ascii?Q?BVLr5/Q1ON3980GEHsE9gBRHmPLgt27LGyvLKWTBASI/YswdUX+UFf1DZNKb?=
 =?us-ascii?Q?kRxMMHyi53yrcTMbXypDZyJOrrnjc4rbeP1L7QHmSaMei2gGaiRCsx0esDyd?=
 =?us-ascii?Q?vDtBEFMaRC/6S0sPbx3tENbL4gkuoqso+HLmZ4qYCrAO5SHkoDeT/BYUe2L7?=
 =?us-ascii?Q?MDod+EVAaODU5grDlJS1+liXiC4gx1+2vrYxdzMthXzARc4CDmwQbAso6vMB?=
 =?us-ascii?Q?AaPQhVDsJpQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qVewCPRk7Tii4MuzwsX64X4Tt++1P9X6WSC4AbvVooLpFdiq6dh43sWYremm?=
 =?us-ascii?Q?YS0L2nQAjDS7flphbQ55zcRfSCpEjpIP/8IA1A05c/m0McX+Wa4oeIaX8Xf4?=
 =?us-ascii?Q?yZUrvbkoLiNKuHFLqti5DohzrQQr7OOcAJ14wSRGAJt1SNDJx12AunjzGfus?=
 =?us-ascii?Q?yr/kaUVZlS7DtkEGsC2um9VTRRp+XhhOIJl9xwMYzOdE6kx8TpmZfhercv18?=
 =?us-ascii?Q?HNEIEcYDaYsL/T00n4u8TM4M0mRQ0ph1kyU/GVwok4Nt3pPDevqQGuM6x6lV?=
 =?us-ascii?Q?9UA3t7bKm4DyQRXqnC/rk0IU9Bq8jmxCBm3x424Qz5MwOAg6NezzzCpWFkGN?=
 =?us-ascii?Q?09Y9mLUFmbT4CgfCHxELyArxbknJs8dxwIGj+4R2OH+x2KhewtIVLUOGtxz0?=
 =?us-ascii?Q?l52OPb8UfdLQTVj6vnajMZ3xzi0KuZIkIaIV2xvWvczTrNAg5QMRnjQz4clV?=
 =?us-ascii?Q?N7b/OJEJrrISAeb9YXd1yqmkDFpgbWafMCxTV7waE7j9TzePlIch7x6RCZ6u?=
 =?us-ascii?Q?Gjt0eQKywQ/fcQaqjc4S9tS/Hci27Uh6V69EICk2gU+47zKU/pDSS9t9Jm5b?=
 =?us-ascii?Q?gi5ttZtc59hCvxzVTm83biTkOgwGNMN5L6yUuCIo96y17cDLrAx0Sn0vprS9?=
 =?us-ascii?Q?CjB3aZTBO76kNsnkxP1wS00aDk6Os6fWpSkCyjXnjQNuuqiMCYGxuMgjAEKe?=
 =?us-ascii?Q?voZgcYnSevcwZXVLLcr51dzVYG9Um5SaVD67Mco5QJ3sQgcwe/TQbMMTaMXA?=
 =?us-ascii?Q?VkzRtjksvUOE7O675xNdgTzFsL8LnJWc9Pldj6HzqjdlHULBvgULhqyV6vnN?=
 =?us-ascii?Q?JpGgDxUEGnOHIJoyRqRwbJbD0pgHYDDkKIQpdFZe6h/xMfaE06219gED1l99?=
 =?us-ascii?Q?RjlkvnL1lCTY1qGJQwLiY7r/oiduvszbuPD58uGHcDixQu8GHzo+ApfPF3A/?=
 =?us-ascii?Q?3HAxnkEuDnfQ6sBCMsiOmtV9in2EzjMDq7RWmYRgw512+eXQuokB7JSqHjrx?=
 =?us-ascii?Q?saOCyAjfhKFQS4tgnQSq3rMXyGZAlxMblblvTsXZlKQkhYsd51R5nIuAtP+r?=
 =?us-ascii?Q?vidHv946ZxaWhSu08Bq8lBQYskxGDFOML+tFTmHUe+l2AbAv5u9sIqyw6voU?=
 =?us-ascii?Q?piHWMzB4Y1t+FruK0A1oAY1kIieKmekvCIu5AxmUFZ0MJkZ1DjV6q1NMgKkV?=
 =?us-ascii?Q?QxmJg/PdSiepFp+7FfZQbpTTAN1T5xC2P3wWZZv7+PvE1PgPPMEZzs9xhyhk?=
 =?us-ascii?Q?vdZK73Z9IxUh/jx1ywZ7dpkcSbs4MCXxDXMTtDhIHTP1NiBkF1hgk7XEiEvx?=
 =?us-ascii?Q?YnyppGIAlmXytgGhpFA3CXfhSzmQMzxHUXTmH29yyl+TkFFgqK8S9extvPDG?=
 =?us-ascii?Q?otldPEmJacWxWVDirmiZsKxkbnJD9arD5Ulz38CSN6zmXVta2kC+MFov9w1K?=
 =?us-ascii?Q?oyWeIIkGig1OKNnCh6g61xTW6SntXJONcM9rUOGXli4fSwPbEt2+iqqOKO9f?=
 =?us-ascii?Q?Pt1PtXG13JcfvQ1JmgDJ2RAB3mgPwJylyIlzJSoLgXH02ej28nlaAE0nVRId?=
 =?us-ascii?Q?FHC3/M94knU6iriNkI9GWrBVdo5U6aDN3vIMJKCgHXfnl6KMldPT2BO8AJxZ?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AaZp3wuiuiYCE8neWJj2UTVmFuKjnYwvYfOc2GKzyUwfFVgPUptK4LB28oqR1n5l1lSwfoeA9UHZLBhcbJzJQqquLgmIZcMs2uCk1BlnJimUPWaceOOF/vJ7KjCatxtzycxRr28w2h5EqScD6uoMqhKQprDzws+h1WV2W89mMLwV44gUApR4Y7Be1ItmkALlNlPbYemyMj+l18YfWrZQtB05J0xfz1cTHFfNJ5MMuZOwcytlTAhFNcDyZ3oV5Qdd3ReX5dsXS6If+fg/gy7opCiadffHraBFNcTEHWkaWzKT8eDz7whWQ+XV+7T6NnfSPgyHjOJkLPt8nxrKvavX/E2jbm2EofOjUFGr9sUmM4ruAw/5L2KI21Kc6A4jpvmNinlhoGPQBYmPY2sbdu3Af3MQwMh5dTg98iPEUrOa5IbFClR0qe9SEpVzbyV3Uu98aWN5ixfNleuU156ZrAYurepSJF7E6GnN3UFMt0ZS2GmLXWpfNGovv4YiHxaxJ7UPSM2LoJTIWNINksfUw5PKe9WCSYCR5+/ULNiilsRlaWaivYofIXqizancaptqg6ZSmL21JoltMj434dmBeOgPDGIH4VAtei8LciaIpIfcuTk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051d3e6d-b3ff-4996-2831-08ddbf6cb5a5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 04:46:18.2825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgCW89Jb4F7J2rCJEjGFt6vXsVY64SkvVxckR/gFEuNNmKmRmRUKJLEHHkNzmZznSmACXE4YDXXrQZcST+V7CeRJyEG5iKkLhNkUvvan9IY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1A1B8C819
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507100038
X-Proofpoint-GUID: 7x15wYc3jf8okjngz5P06RiGhpfdzUpU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDAzOSBTYWx0ZWRfX+Bewt9zbCz2s w7amozR3oyyXOxrwXAeRpf+Vm8o+hnZMMJ2T1GmdoEZd2TqnWzhamQtpq2zHoPRVGUQeG5Ph1sp N5raGmSaAhqAkTZRLL5ESupbBK0x/zy3FSLbLjoAWVYNFUCkjiK5NxTsRzchy2523tdfDRUYEBD
 yDYY9Htd1+AC/aWXfr/iRe10TUHaR17KQdOj/VhpyFbCSCOk7mEfvkxsfSct9GhrMK6JEfqZDnh DZqp2hwLUHo+ISVllZyQX/07aDoCRWqlL2dKu2HoV8mfE5c7JUyCnr6NitLPhrok1mTHQJDaAFX PJ/mRMLUGn87Cv90CQurJDHVIRwgCHYupHbccPo3Wgz5JwXPrngX2urek9y73e9UCvMmvd+O9T8
 AGvW6XDrkibc+g+CkN9dHkMukElhB2SykJuQ9GzqIYO6QxHD0bbM6DXwH13Y1AUZqBi++hqt
X-Authority-Analysis: v=2.4 cv=KrZN2XWN c=1 sm=1 tr=0 ts=686f45a4 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=LKC1t1k47gFYpeKN6JcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 7x15wYc3jf8okjngz5P06RiGhpfdzUpU

Stay tuned for a patch I will post tomorrow (Thursday) with an optimization
for the ternary operator for strings that will reduce the use of tstrings
quite a bit.  With that optimization, the test you added for nested ternaries
still won't use more than 4 slots.

In the future though we should change the tstring handling to dynamically
determine the max number of slots needed for the compiled code, and allocate
based on that rather than having a hard limit.

On Wed, Jul 09, 2025 at 03:46:55PM +0100, Alan Maguire via DTrace-devel wrote:
> Because of the ternary operations using inet_ntoa*() in the
> TCP translators more temporary string slots are needed.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_impl.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 2adc1252..a47b6d40 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -203,14 +203,16 @@ typedef struct dt_kern_path {
>  #define DT_DM_KERN_UNLOADED	0x8	/* module not loaded into the kernel */
>  
>  /*
> - * Why do we need (only) 4 slots?  The maximum amount of string arguments to
> + * Why do we need 6 slots?  The maximum amount of string arguments to
>   * any function is 2, and if the result is a string as well, that means we may
>   * need 3 temporary strings during code generation for that function.
> + * However if operations like inet_ntoa6 are used in ternary operations we need 
> + * 2x the number of slots for left and right.
>   *
>   * Since string functions can be nested, we can (at most) end up with 1 tstring
>   * (from a nested function for which we already generated code) along with a
>   * nested function being processed which needs 3 temporary strings as mentioned
> - * above.  That brings us to a total of 4.
> + * above.
>   *
>   * Each tstring needs to be large enough to hold the largest possible string
>   * and accomodate the largest known need for tstring space in subroutines.
> @@ -222,7 +224,7 @@ typedef struct dt_kern_path {
>   * - cleanpath() holds a prepended '/' char, a string, an appended '/' char,
>   *   and a terminating NUL char, or STRSZ + 3 chars altogether
>   */
> -#define DT_TSTRING_SLOTS	4
> +#define DT_TSTRING_SLOTS	6
>  #define DT_TSTRING_SIZE(dtp)	\
>  		MAX(P2ROUNDUP((dtp)->dt_options[DTRACEOPT_STRSIZE] + 3, 8), \
>  		    72)
> -- 
> 2.39.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel

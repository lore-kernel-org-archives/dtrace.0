Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1481A073F
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 03:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753240503; cv=fail; b=gvxgssePZP/agYhBH5Zwoqa7o0b+lZ9N2viuEVTX4RGLQKn8JNsO411bN3wpcfdRfTdWdtzf4ahfVl5LTupIn+qDIaM4q/o/m4Il+vDLLv6Cx0XqWCc2153T9ur5UrzJIxXZbt84Ze0xO0S1RUoeC6ieuIj239o5zXPzgeks95M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753240503; c=relaxed/simple;
	bh=pS6MwQ4KX5Ewc3sETtnjEkOVXumz0vM2WZxnJ3FKSCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ok7POHbZgf1kLeZ6amTMRqbaSgUiBCvDknyGW6PYrfhV2cRo6sdS9LCHZodk/Z/8NGtfKJ0eJZlhmTgNtkYwKZYXOYkqdPoQfqAY/45oLEraF/KyFEImBKttqo5kCYcMHFLJWoL/gwR+FTJXqqMlB+D4fSPdkgVvT2IZJ6jRP8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gucn1m2V; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JOGaKfv6 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gucn1m2V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JOGaKfv6"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMR4Vo004768
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 03:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=tmq0QAnbnlDXHeukcikrGPPWdAv6ZCr/5ZLwK/XF054=; b=
	gucn1m2VNmdqnXUpQLOmQaHdqsgAJ4AuCL1ZW5Fh/ZQKMux/DfqqTebjY+Rz/67M
	Kh+UPnqs1rv0TO0zLdYU/7vk+g/EtpNBZm2q2dRVYLsI1Q2spiPmNB7vViQuMHcM
	QxTI5DxeDZQZlRgD9P1NjAtvQIs7WImaXZsooDkyjHe/anYR0/mbxaZ7yCRnbpbn
	Cz4pq86Wx5tMYWu/2nV41ZFjpvZrWt5Epkof2o8XGhCCdKXeEhu+XttOvQDzumlr
	Y/9aOCx31pX0P/umgkRDesRidSGIVd4nskuJp7rZB9im6uENIsIjkjtqFhGYq7+p
	oiwa7M5RN0AI5mHkwhseBA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48056eemk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 03:14:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56N35JFF011317
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 03:14:53 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801ta21a6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 03:14:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ui64Ag0GSygcvkfb8lOTp8fXi/nyhTJNx/XMhi7xu+Cj+hzHgCVbaNgFzFOndMc+IYdyUCmycaifFcovieTiNmpdfOiG6viZiShZlZ9LD0YBM7asc7G54bIPKqBEefnAKse3LvQ4JdvuJhwju89oorQ6dQLrYSMrFd5sVytUJq9t4Zauj4yI+GlIK20NKXo4UCIutnoDikO0YP+q3LPUCbVKzkGfVL/pkwG2DwFEyGc0OiFXRaz3DaC9EBVhjfJkwk5B/HdNYdTP/4r6l4mxeESuF96Eb8BRIxKzXKjvSPfjTRnkUUDBxhiAiE3u12JLBkWR5BGujKSoUZazQjUQow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W476nOF32yUTLk5UFDiwizct1Rszee2aJP5dDu0bK1o=;
 b=pmEWQUbu+Lx/N4ZlrQdfGcRRR9iPqge6Jujok5LFCvxETmMktJbCraJupKNF3FD4fEgHn+395bMWdfGzEw1KY7ToizmHX7EWIykUGxTp31dSAynqgZVbwHd0f2H30GRIUZsxZu7Dy+IIx8gjKeL6diPPiWVfPRYReC7rbMOCxVIqXUAP/GevaGxbGrUVrpoy+/Of9kUBzsuGd2BZS7pkh40uqOWFJDtEKsXVIuCyiHk5sSq5JFB6hisEnYOsCkjCWrxtjb52nE00RAwaHJP4jb6zk4tVYoXvjxzoqtJ1HLvt4ToYdNZH+K7jbUdqRw3eR/NZIW6lGqsPjYBll+DQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W476nOF32yUTLk5UFDiwizct1Rszee2aJP5dDu0bK1o=;
 b=JOGaKfv67EIWoxPuOEiRlYu3wBT1xnrd1ofrTAIYz4VOarY925oZ0nGWCi4PJfjSth20GAUfOC7TFvQlleyDzzoM/nt1Gnjh/h401J0c1R4ywk30Y8M6SZ1k2BMjLvmzDfWIz2iubB830TQR7naRmrZKGDSsP9FfByfFONO7iZ8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS7PR10MB5040.namprd10.prod.outlook.com (2603:10b6:5:3b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 23 Jul
 2025 03:14:50 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Wed, 23 Jul 2025
 03:14:50 +0000
Date: Tue, 22 Jul 2025 23:14:47 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] lexer: support // comments
Message-ID: <aIBTpwDzRyutOjl9@oracle.com>
References: <SJ0PR10MB56728D6097EC38EDA2B06306C25CA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <d1113b7b-0ace-d350-40d8-58ecf4ec2ab8@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1113b7b-0ace-d350-40d8-58ecf4ec2ab8@oracle.com>
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS7PR10MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: 39240e4f-4d62-4080-c97f-08ddc99715f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Sid/4PB/dUvjz9EIDS+WzkWavtHzTRT9hQiE91YfwoNPMtsl4kPnKET/bm?=
 =?iso-8859-1?Q?4RVm1uklkkdvcMTQjOuIk/5dzXP7m2Xp+MdGBb/bb2N2rST1TggVo1gOup?=
 =?iso-8859-1?Q?SxaaTwp9N10CKnBpt3rwQJaOvMVEdlVbNilfQLwLZZXokeVeFsA65+cpOb?=
 =?iso-8859-1?Q?LXEZ9qy4mzhxxQGgxDuxXbjPyxPTkSzR7HBTQ0ulDSbW2M25HmuG3tqhSD?=
 =?iso-8859-1?Q?7QT+92UHnYP9uWI6qv7PW8eq0RPwLdt5ic7HAJVGnnCFf1K5xYqMVHxhI8?=
 =?iso-8859-1?Q?gXo9XMN1TRLIq1bAUx47FQbuGxX8lUmZBNXA1gnMOvnvkJHlxo93EY4utm?=
 =?iso-8859-1?Q?sPbKioVENO/uH7euZmytbmSwAl9RuQkVwOGrdKT9eJUo/gCoZJq5RxB3PP?=
 =?iso-8859-1?Q?7OArJ1BJqEYEkfz3rHQD65wyGvkFd9hpKFfYVqYSpYZUD391kdPHIwS8WU?=
 =?iso-8859-1?Q?uPbNo57/1x467PTt/njsadepS1ZORvdOaBRCTFREae88rFisUFHq0XsTNQ?=
 =?iso-8859-1?Q?RbQcM3jXpVhzUBybDs66obYjfOblPzOst+CIHmaCqeqX2wXfffCJsqVVRJ?=
 =?iso-8859-1?Q?0yNYOmR4S94YmgNKRpeDwfVWru1ZkExSKkGWSkLyhjbzoCtaIYBYCurhaP?=
 =?iso-8859-1?Q?jkcjisFQ8qcy87sqiAVzfYsqbbKSNveE0dOrKLuX2ClwGUVr6vCnBvKXI8?=
 =?iso-8859-1?Q?NBPtn10MQnaRlMz9+oZP2m2J0kXymoJ94B3yrWmITR0PpdRp5HYSCxJdjX?=
 =?iso-8859-1?Q?HK4bAqkAzNtVQvTQjf27YqdCsaopwFzFRxwzNPOumBWo/RZcou1jfUvfzP?=
 =?iso-8859-1?Q?YkDqskMkR+9LUM3GpHD+hmO+lBfTZ35NkRJMnrlgS9DAiQPcjK5f7yOT4A?=
 =?iso-8859-1?Q?yrUvN70MzvECoHmx/vPxTf5RHqBxwwP2HAn6uCyXOG1+qfGl+xeoWKa7cO?=
 =?iso-8859-1?Q?0kFHcPaJvoWGOYskZ5pPV/m+iFFyV8FAtcroCYX6rwEDiPmBbj4GZx0lWe?=
 =?iso-8859-1?Q?RF/jxHDv8EFljRbTCFja56Smr7fuU9vODP83XdmKTOg1yxyBHzBiPVTleU?=
 =?iso-8859-1?Q?7hwUbbmPQjE3cHRBr9Cd8Br4Eo9IIUZ3mSGiLn05hXOl2ilDajklcM0QnD?=
 =?iso-8859-1?Q?TksZeMaC4r9EZMHqrZTdmgzHTaAKsqiH+ar/dH4sJgnhy/4kTgg+srGgWR?=
 =?iso-8859-1?Q?FodRj6F0HrV7B881xsOdOSf5izjGTl+6MRn5xGX2CrCmcbjIKtgDKBLSU0?=
 =?iso-8859-1?Q?4PkBEki9Ts8itwDNVuBmv0AfffPcu6hCp/B9ikUDwF0ZZrp+GsBoJkD8D/?=
 =?iso-8859-1?Q?h6e4s1hddaPQ2AQ4HdKRltorPbTokh5/NRzI02NyTFw99P8Bl1e0hEAFB5?=
 =?iso-8859-1?Q?orSjTDprBIl8R/q0EJtGXFyLNJ/0D5eg2mtwHxvcqgMvtSAdALKpFc1Y35?=
 =?iso-8859-1?Q?US6cqVzyS43iBGO2aGgAmYBXVQ6yFb+NiPORMVXdvnmjSgCJ04LUnJ6pgg?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?QLbAZZZV+GnAv1aHPwBgJAPDFY+wP3A/8paU+RvcAttt5BqnwmHiqCb/me?=
 =?iso-8859-1?Q?aQ2DIQOo62PwNKFAmDHqcgmCgHWoMYtngxCr0vefK0CFmHqeIXP+bS+CUe?=
 =?iso-8859-1?Q?4RUP9UmIVE3FPefuyhYqgSNo3mjaXCwFhXjM+T4IA8/bNuwmpj4LhNwCTK?=
 =?iso-8859-1?Q?fJzQ9PBBSiEc4bMMcMHyijLaE7VByXLGajvHgbwjHL2iz8L0W+INXEScFg?=
 =?iso-8859-1?Q?BJf+dITjuOArddadUW8DDROER5gbVzWniqifXEqbMkR9elYucBBa+JLLAP?=
 =?iso-8859-1?Q?WC5OsFsgqdbVc2xTVAuBzC0K7Zs8S4usvBanDNgmDc0jw+Zs1TXTjK8L5S?=
 =?iso-8859-1?Q?10tYa9cSn1DHia7I2Hivvm4VchjTDpRS4RDNM/DHFU2r1c6BJCpHMuZ+7P?=
 =?iso-8859-1?Q?3+mJNdQsa8ew+hffIbWkiRTHfWPYlgEiTeVm74uKWoS2kY1Mfdw+y/TqT1?=
 =?iso-8859-1?Q?9v1GO8+IrmX2Q4NnPnzSI6TQd0P0l+wEpW354AzKkFuGuJ1GkZWMuh4xBe?=
 =?iso-8859-1?Q?JeLHDeFsQGQI9ll9GM7qu8Y0scRKGtWsswuB7GAOCZJRcAYcClNzDruIGu?=
 =?iso-8859-1?Q?x2DJc9Q514k6bqaMjL4VDFhtBjK8i8f/A7OXbWMMSK01jbOI8dv6wUvJSr?=
 =?iso-8859-1?Q?YowRrBK9dTi0ZbD6uduGUscmMletYJi4AK626PpnQ/m46RIo5v3sP7JAuw?=
 =?iso-8859-1?Q?swtAr6TcadCX+Je6ExMHv5ICjMP4m8hDGF1P6GaLDIH0afdH11vM0M7vmq?=
 =?iso-8859-1?Q?y+W884WpREQgTIFsApsSEc9vHZxdpD7k2nX1ARIGFkcTg52Ad5NIoaHB0N?=
 =?iso-8859-1?Q?ML4MOltsP9bCMHXvtTuAigGz6ESElb5oRSVkQP6m9xAx9YB6krt7WTLd+/?=
 =?iso-8859-1?Q?zGhh/kmCPIeZkdfxUGbQJh2afnq33fX7U3tITWJLzHQu5Ln7cHnatLfDo6?=
 =?iso-8859-1?Q?MqgR8U1drAKfZF9NVrGT6VJ5JY2vJMr6F/TVZsPD+PgxnY5ZscIUJuJj2L?=
 =?iso-8859-1?Q?f3ojM3za3ObGd9PgaV3Cuoht49QxElNNjoCbWRKCOLh+5NSH1nkTU4f+aq?=
 =?iso-8859-1?Q?CRxE1zmCkHmFzlofps/oDyR6LESfERxHhFj11l1MSKDPkZ/sTtZdn4wtr6?=
 =?iso-8859-1?Q?8VgFvLQZYq8ar0/xU3/k/xHAW7PCa9d5RgplHH8xAk0pW54/x4EIvQstWC?=
 =?iso-8859-1?Q?ExNCg7LSOCPiNY/RO2b/ybOOxZJ6RK/WOr9wNewbVNdCTrl5XjAHtqx5Fe?=
 =?iso-8859-1?Q?TwCLC1eeGU4A7pt/L2XKhTuZa+SgJ/7ne3aR0Gfdodx/f/1SfqsKUBgiTb?=
 =?iso-8859-1?Q?YdvvEn0AEvpYVkVKzNoIYPrhHCyZ13TEfaQ2ZTO+KVkuf99y7xmhkpYNwj?=
 =?iso-8859-1?Q?XepvXDBEBlrWO+X8b2ltSeJ+EOi2nZMJ8wHO5+x2d7qmEZVXn7AEuHocQU?=
 =?iso-8859-1?Q?dFyjGSD/gog99ime9jY02tkSuYOyzNA5b/hZoKnDw4ErEO9S3EVaRvrsej?=
 =?iso-8859-1?Q?6tytNNfD7heSqffQEiwLY6RLHjj+z8qgQjQvmhywHRvIQFKf5pXxTuS6co?=
 =?iso-8859-1?Q?LBbIdKnMUen5aaIySr44U7El8lykq3ZgKWD+a1wzR48SMKF3COSwB94EQR?=
 =?iso-8859-1?Q?MmBnRGrLDGlI/Cul4TgbjVm+XN0fz8AsbBNYQgmVgKyDom5UfSGX6ykw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zCXzlUNrpLnnGbllJABMv4TJLTW8ImKLuWFZvM9Ly0h+kViOOC+BPaLUXH1m3p67No6UwpWevS5RslO2XK5v5dpNcFs+5wzn8w+2+q+txpqw6A81aEPDN0YptnF6MKz+PAMPzFajpvCPvN2BkQ+8HdoOCUZuZbqAMlgSu98tCMpJNw59p03e1UwJvaoM3o6FzpZTwBQEwF3H1ZQV1uM7Nfn282kLc3UhTS+OQV0NZMb/pk9Ss4G9vSucXPqEqnxbHiwqr6USK3qva4y3+PGZEw9rglJ5cXHHBg2Tpc6ps+eLuv75Mte3l0eYhdHoxnOingbv+muSC+OFbGljgahWWDE581H8cnSOkXll8yvZnOnSR7XP7Idg+YnI10hJP1njOrjzy9SAPEpqmlP3U2fEbmOwM+LTCz1D+8u4uVX6pdSv7AmC0pmhPly9+FzD9BR/t50IdztZoo3st1wMCsdkezDXgeoBKXJy0d8A6t/bVJgxh9G4cRGmFucrJqSMDm7lBBxUUNHbw5ReHgpK1r7vXhREPariibDJcsaQe8wtQ+lR1xPew0H22lpgxfvJOrJTUmh7GkVUmyZTDnOxswF5S48B7v6Jp9W3kr/jVPizh6U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39240e4f-4d62-4080-c97f-08ddc99715f0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 03:14:50.5800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySusyl1CQj04aaS39SOs+SYqSNEe0Ju9JshZsMeXgClDBfR+Rv4QCsbb8hhkxmyTXHWyNW6sIj+s1SP4pkhpAtHMhTt3t1wr3b/pFa3fNdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5040
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507230025
X-Proofpoint-ORIG-GUID: uODyX-40EqX7Nro0stBV6qbZ79Q-FNsA
X-Proofpoint-GUID: uODyX-40EqX7Nro0stBV6qbZ79Q-FNsA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAyNSBTYWx0ZWRfX+t+vD4d5MArk
 kY3H/LWx8QqntZZt6CWDn/T38eNaQOLfqTJxwtjsejastQpAtIXnzkfmLQiUOMFhlOV9sCHxFWu
 j8U3TaU8SnyBaIc3TQ+jOeulwC+11ANO3aXh9sp95dEMSsjgLjTeCy1nnQaXwjCJEUpdAuaYhgr
 NdyGDZu48j0+yKvH0B2AwIQcLewJvP7bWsZsrpQuG+DmM+yGZXscCqSvlQK2+J1QsgyNFHoU5of
 bz+iAuT1ZxtT8VvKBUuXNAlDQKZB09Tvb7Mcd2gd8p08AnUB+0d344brOMMRv2SpwVdwOKUkXgy
 Tsv36sM6uFQzRRRPnM1N9eb4DYC9e1RlvbsKs1Vk+v9eaQ3h8AIYvDfYhA7zmnei9VqBAKHJx6n
 P04cGGlquWilZC/sSDHLbq7hYGRyyHdVcoUvxoByjhdu1cUNXfeLXxAJU0QBekPnRpVq06Vm
X-Authority-Analysis: v=2.4 cv=Ef3IQOmC c=1 sm=1 tr=0 ts=688053ae b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=ubYQZuvvKhIn5RLntkkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Tue, Jul 22, 2025 at 09:18:16PM -0400, Eugene Loh wrote:
> 1)  s/commens/comment/

Thanks.

> 2)  Am I doing something wrong with this patch?
> 
> $ cat x.d
> /*
>  *  // is this okay?
>  */
> BEGIN {
>   exit(0);
> }
> 
> I get stuff like:
>         /*/encountered inside a line comment
> 
> Frankly, I don't get as far as this script;  I first hit such problems with
> all the copyright notices we have in D files -- that "http://oss...." stuff:
> 
> /*
>  * Oracle Linux DTrace.
>  * Copyright (c) 2012, 2023, Oracle and/or its affiliates. All rights
> reserved.
>  * Licensed under the Universal Permissive License v 1.0 as shown at
>  * http://oss.oracle.com/licenses/upl.
>  */

My mistake - I sent out the patch before I re-dumped the patch in its final
version, and in the version I sent out some rules are still marked as state
<S1> rather than state <S5> due to copy'n'paste.  That causes this strange
behaviour.

> 3)  Where do all the rules in this patch (tested by err.*) come from?  E.g.,
> C seems more lenient:
> 
> $ cat x.c
> // /* hello */
> // comment /*
> // comment //
> int main(int c, char **v) {
>   /*
>    * //
>    */
>   return 0;
> }
> $ gcc x.c
> $ echo $?
> 0

Yes, C is more lenient.  I based the implementation on the behaviour of other
DTrace implementations that added //-comments.  I'd be open to making it more
lenient as well - I hoestly didn't check out C's behaviour because the rules
I observed for other DTrace implementations seemed to be quite consistent with
what DTrace is doing with block comments (/* ... */).

> On 7/22/25 18:12, Kris Van Hees via DTrace-devel wrote:
> > Suggested-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> > Suggested-by: Alan Maguire <alan.maguire@oracle.com>
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_lex.l                               | 14 +++++++++++++-
> >   .../lexer/err.D_SYNTAX.boc-in-line-comment.d     | 16 ++++++++++++++++
> >   .../lexer/err.D_SYNTAX.boc-in-line-comment.r     |  2 ++
> >   .../lexer/err.D_SYNTAX.eoc-in-line-comment.d     | 16 ++++++++++++++++
> >   .../lexer/err.D_SYNTAX.eoc-in-line-comment.r     |  2 ++
> >   .../lexer/err.D_SYNTAX.eof-in-line-comment.d     | 16 ++++++++++++++++
> >   .../lexer/err.D_SYNTAX.eof-in-line-comment.r     |  2 ++
> >   .../lexer/err.D_SYNTAX.lc-in-line-comment.d      | 16 ++++++++++++++++
> >   .../lexer/err.D_SYNTAX.lc-in-line-comment.r      |  2 ++
> >   test/unittest/lexer/tst.line-comment.d           | 16 ++++++++++++++++
> >   test/unittest/lexer/tst.line-comment.r           |  5 +++++
> >   11 files changed, 106 insertions(+), 1 deletion(-)
> >   create mode 100644 test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d
> >   create mode 100644 test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.r
> >   create mode 100644 test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d
> >   create mode 100644 test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.r
> >   create mode 100644 test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d
> >   create mode 100644 test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.r
> >   create mode 100644 test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d
> >   create mode 100644 test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.r
> >   create mode 100644 test/unittest/lexer/tst.line-comment.d
> >   create mode 100644 test/unittest/lexer/tst.line-comment.r
> > 
> > diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
> > index 9d502912..a7234800 100644
> > --- a/libdtrace/dt_lex.l
> > +++ b/libdtrace/dt_lex.l
> > @@ -35,6 +35,7 @@ int yydebug;
> >    * S2 - D program outer scope (probe specifiers and declarations)
> >    * S3 - D control line parsing (i.e. after ^# is seen but before \n)
> >    * S4 - D control line scan (locate control directives only and invoke S3)
> > + * S5 - D line comments (i.e. skip everything until end of line)
> >    * SIDENT - identifiers and comments only (after -> and .).  (We switch to
> >    *          SIDENT only from state S0: changing this would require new code
> >    *          to track the state to switch back to.)
> > @@ -46,7 +47,7 @@ int yydebug;
> >   %n 600		/* maximum states */
> >   %option yylineno
> > -%s S0 S1 S2 S3 S4 SIDENT
> > +%s S0 S1 S2 S3 S4 S5 SIDENT
> >   RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
> >   RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
> > @@ -408,6 +409,11 @@ if (yypcb->pcb_token != 0) {
> >   			BEGIN(S1);
> >   		}
> > +<S0,S2,SIDENT>"//"	{
> > +			yypcb->pcb_cstate = (YYSTATE);
> > +			BEGIN(S5);
> > +		}
> > +
> >   <S0>^{RGX_INTERP} |
> >   <S2>^{RGX_INTERP} ;	/* discard any #! lines */
> > @@ -548,6 +554,12 @@ if (yypcb->pcb_token != 0) {
> >   <S1>.|\n	; /* discard */
> >   <S1><<EOF>>	yyerror("end-of-file encountered before matching */\n");
> > +<S1>"/*"	yyerror("/* encountered inside a line comment\n");
> > +<S1>"*/"	yyerror("*/ encountered inside a line comment\n");
> > +<S1>"//"	yyerror("/*/encountered inside a line comment\n");
> > +<S5>\n		BEGIN(yypcb->pcb_cstate);
> > +<S5>.		; /* discard */
> > +
> >   <S2>{RGX_PSPEC}	{
> >   			/*
> >   			 * S2 has an ambiguity because RGX_PSPEC includes '*'
> > diff --git a/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d b/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d
> > new file mode 100644
> > index 00000000..61f5961f
> > --- /dev/null
> > +++ b/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: Line comments cannot contain begin-of-comment markers.
> > + */
> > +
> > +// Comment /*
> > +BEGIN
> > +{
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.r b/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.r
> > new file mode 100644
> > index 00000000..74d1d0ef
> > --- /dev/null
> > +++ b/test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.r
> > @@ -0,0 +1,2 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.boc-in-line-comment.d: [D_SYNTAX] line 12: /* encountered inside a line comment
> > diff --git a/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d b/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d
> > new file mode 100644
> > index 00000000..8fe2ff04
> > --- /dev/null
> > +++ b/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: Line comments cannot contain end-of-comment markers.
> > + */
> > +
> > +// Comment */
> > +BEGIN
> > +{
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.r b/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.r
> > new file mode 100644
> > index 00000000..64d5ae63
> > --- /dev/null
> > +++ b/test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.r
> > @@ -0,0 +1,2 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.eoc-in-line-comment.d: [D_SYNTAX] line 12: */ encountered inside a line comment
> > diff --git a/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d b/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d
> > new file mode 100644
> > index 00000000..a9207693
> > --- /dev/null
> > +++ b/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: End-of-file in a line comment is an error.
> > + */
> > +
> > +BEGIN
> > +{
> > +	exit(0);
> > +}
> > +// Comment
> > \ No newline at end of file
> > diff --git a/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.r b/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.r
> > new file mode 100644
> > index 00000000..f46fce3e
> > --- /dev/null
> > +++ b/test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.r
> > @@ -0,0 +1,2 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.eof-in-line-comment.d: [D_SYNTAX] line 16: end-of-file encountered in line comment
> > diff --git a/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d b/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d
> > new file mode 100644
> > index 00000000..0332e1ae
> > --- /dev/null
> > +++ b/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: Line comments cannot contain a line commens marker.
> > + */
> > +
> > +// Comment //
> > +BEGIN
> > +{
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.r b/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.r
> > new file mode 100644
> > index 00000000..d1152afc
> > --- /dev/null
> > +++ b/test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.r
> > @@ -0,0 +1,2 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.lc-in-line-comment.d: [D_SYNTAX] line 12: // encountered inside a line comment
> > diff --git a/test/unittest/lexer/tst.line-comment.d b/test/unittest/lexer/tst.line-comment.d
> > new file mode 100644
> > index 00000000..4deb66f4
> > --- /dev/null
> > +++ b/test/unittest/lexer/tst.line-comment.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: // comments are supported.
> > + */
> > +
> > +// exit(1);
> > +BEGIN // exit(1);
> > +{ // exit(1);
> > +	exit(0); // exit(1);
> > +} // exit(1);
> > diff --git a/test/unittest/lexer/tst.line-comment.r b/test/unittest/lexer/tst.line-comment.r
> > new file mode 100644
> > index 00000000..d4e4c325
> > --- /dev/null
> > +++ b/test/unittest/lexer/tst.line-comment.r
> > @@ -0,0 +1,5 @@
> > +                   FUNCTION:NAME
> > +                          :BEGIN
> > +
> > +-- @@stderr --
> > +dtrace: script 'test/unittest/lexer/tst.line-comment.d' matched 1 probe

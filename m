Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB178B66E
	for <dtrace@lists.linux.dev>; Sat,  1 Feb 2025 02:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738375470; cv=fail; b=Drw/lSkayiVaE1PTwIzKOV6gRHoqadQMIWerVy6sO+DXNiT1fWc/WoxVPfsdYpbaG3lGJQcOrv91WQxf0FpXKqIrWf88r4vYSrGFCKBint7yj31Ue6KhP9XH6IUh92fN4s0WJ6/OCwdhDfSff0x6F+bxHGsA1idI0rCtr2K8s+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738375470; c=relaxed/simple;
	bh=q3NojZfwmcCYK2SzWfeg+nWujoLm1y2tnLz/NjTU6hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C78evZS2duKDBYUQuQQpj7UMQG3PG0L+5wFRTAEEb2dBB2ALv8kgEP3SvoKyq3G8/9F65oS7QhiL7dlRHu9Rv2MEuihyftZ7iiSNL7aZSJppvJBkuOEzDFdzy+eqcBrP/QQaYTIog+K77zMFtV1JmRop1QQ8fck6lRb+fi6VHBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a8qkixmT; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UPVxvrRj reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a8qkixmT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UPVxvrRj"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5111iq23014973
	for <dtrace@lists.linux.dev>; Sat, 1 Feb 2025 02:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=jqeAy0cS74roMdufgqhiOHR/EIhKnqjJjOocdd7JGzQ=; b=
	a8qkixmTRODeMdnmk6c/0UT6kWZa61QR8w19OVM+htQcMK0spx/ZGQ/n9rxtJesw
	ZfDmIT3QXi+S1/UraZFjbHQv4nIq9mXyKXnsqayUh2LdJJK2N/TagKRiY6YxDt/t
	D+ybRxe7riSIKTR09GzM4uwcW9d2x3Cz4EsO7SVAof0HD5bd8IVY8NAQxQ2YGVyH
	W/oOzL3PwXw1fdCXtlYc9zUdPxhAhDw1jM4zERjgcrTUqtTB9Yos8MOXb0mZCfOP
	pD0qf6kBDF/8TdvZVVgmxknvoSEuYdFw3nxvb9ekJYJpf3lLMFN4ZYA7I+sEs5+g
	lMor4NnLfWvWC7Bpxa1aeA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44ha7e80h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 01 Feb 2025 02:04:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5111YEPr028306
	for <dtrace@lists.linux.dev>; Sat, 1 Feb 2025 02:04:27 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44ha258fc9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 01 Feb 2025 02:04:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNUVe0pCj+I5zq8ST3x8ntI0pW9ClkB6YNgZXWXqJfz1FVWGsYlYFe9/+AUkTCr0eE8XdWo2tn27HLYK+DEbWiVyoUpD4eyy/dH5xL2+jJF19AX82fhzwNJ2A71HeSTHTNuJLjscqk0H99vz+tgb2hq5yaw1Fof5TEnjQHikVKV2icm00ZMcvbygaKeRezBU0qsB1CYKtoUoY0EN11vr+Vk0FEWQ+USLaUhIQu9kIqDa44KHuHgmDFCHh9a3LhmudqY5s6iVZ2u24TgolYBMv0tf++i6qe99QU6xW3fkLY4I79Ui2+fAAyDd5yPWzZoLhCL2w3V4RX48ZT7BxK12TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhwtOtJ6zbZsGk5XPsGFrHrFSIvHs9mLntWvK9MOai0=;
 b=mYXJVz5dSN7SmE45/D4XA18J4+qta0XFBNNPHxlrjzUAor6+oSW6FWeKfESHnpGUaxttJEY6lNJbsZgNY1W5pT9qfKHCSvjGTkYUGculHqK4YGuuuzmNLNlK1ljOvJLJGAiFxUyMkaNHCDTP6vJ5xP1lwvEgtQtOniKD5TG/Yk1Q7QP0a+8eyEcrc4D42MDdyR9k3XHdXJSU0aohzN1n9pqSQVw7eNYNlT6dgmhrBrNgTUYW7UFL0Tm2ePgPAu8gcl+cQ76JvgR+O7xfWB+3yJV8D2YUd/D2MfjDu5CN1w4sZo31v5LbDp0UwN3i4JCrV6dMy1R6MZSgDgvdzOe6LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhwtOtJ6zbZsGk5XPsGFrHrFSIvHs9mLntWvK9MOai0=;
 b=UPVxvrRjVfvdG2jhrmV6H9hIWeKvBAVbg5BcgWNNKw9y1imoxjR0XJBmtZ+o/2HT6daIavEahQCGckBVYFpeaRlZZtOQTQAox47HMSB6TsQRMvgYoq9+N4/+D3a+hPJqF9L3djcWmU4ueQMs4FMWWfBpBIYZSNhkFYpn6Jmi1DQ=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA2PR10MB4748.namprd10.prod.outlook.com (2603:10b6:806:112::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Sat, 1 Feb
 2025 02:04:24 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.018; Sat, 1 Feb 2025
 02:04:24 +0000
Date: Fri, 31 Jan 2025 21:04:21 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 4/6] procfs: implement d_execargs() for
 pr_psargs translator support
Message-ID: <Z52BJVoO+xxz5k/+@oracle.com>
References: <PH8PR10MB6337029F91AD9127B9013409C2EE2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <b5896523-3248-fea2-3a02-ba13353c52f0@oracle.com>
 <Z5z8TG9TsewzE5dI@kvh-deb-bpf.us.oracle.com>
 <b42108ba-e583-9204-71b3-859b9a46873a@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b42108ba-e583-9204-71b3-859b9a46873a@oracle.com>
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA2PR10MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: c31de7db-13da-4ba4-3f83-08dd4264bfe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?rxOkgMlBvOLKfGeIkUEbNELmxMYcIiKovhJB9PNppdW8DgOcLrsGSbjImQ?=
 =?iso-8859-1?Q?Y+usHYz2oeuTJwQKfeIUya8PXWOqLD79kIFUSFOlUvOv3RUkrp42Xuvy4U?=
 =?iso-8859-1?Q?dcA3xVfWh024ySxeAw8q/WCa0GbUInML/6uDtV3P6DvZeS83sG8CZcCHHk?=
 =?iso-8859-1?Q?Vow6yAYYFrs11x322f+gq19+mFHWmbZYN1bDafzXyMI8AN1B8oamd1h6VR?=
 =?iso-8859-1?Q?hWf7PcRM8aO6r9nB78U7BM3Kck8ii0oXOU0ZVCcG1eD64PcLdVvU5fiVXw?=
 =?iso-8859-1?Q?Ccd/8AqkKrMkyeHLi4rAxGDrk1hJutUYzZoeZS4zb4BGDMkMfeHJAaikVP?=
 =?iso-8859-1?Q?8jy91kIaNjjykQL+QxHrniOsiFhMBH524JmU+sdr+FeVKLetCIKmf/zcsR?=
 =?iso-8859-1?Q?9rnwWStbvxP7RRrQ1j6GBbhQnO/ztIryXIhRgXYlH+KLWzOaycfzETNGwh?=
 =?iso-8859-1?Q?m0O7L0rzPABhUOoegBIgApWV0/QjcuotLKLHpOQyTeU2Y4emOrn6P/iOuy?=
 =?iso-8859-1?Q?ALCJFJjl/94eWt0672vA5TYYkS+GcPHBRA/wCW67jS+nO8lGy7h5zMTx7j?=
 =?iso-8859-1?Q?w8vBUVQ6gmvjjvW/iYmIDxCCMCb6LssegBKKWolDBzXJQUgJzPHhaXpCQI?=
 =?iso-8859-1?Q?Tr7rbWP5A3ryQeSNT3ZyM+U4jCnGuYIyaqhwpzD5MWuci3Bz4fb5UJQNle?=
 =?iso-8859-1?Q?03FUr21VTt942xegrNLyizN5zw/fq2nFwAM+q3YpNXTSVsqTGEkDk5IEOD?=
 =?iso-8859-1?Q?1MZ0UOy7r/EX5QduVnHw0WIQo8p7g0JYsJSjwzv3xgCTgJ/HNQ1xj0Xm1L?=
 =?iso-8859-1?Q?NNqNo0r+30wc9KOCOX7qeC3Uylvp/Rp6h34FtbqUzBdnVHzLeBkqAB4SP1?=
 =?iso-8859-1?Q?/dV0q69nM0RC3kMws7ORbGPkPgCZsK52UikbCD26V+lPLMQzvo+o0vdpbK?=
 =?iso-8859-1?Q?42AXF92bmQMpVCC2MQ+K3PiXKFRUytWPvIAgjoF4rmPAQpmA6LX/kjxqyS?=
 =?iso-8859-1?Q?LcSUk8r4Z2oHFHFUI4aqF6nfaS9s8W2DlJaWs7GFhsDtSnpsUsoFKtROl0?=
 =?iso-8859-1?Q?X3qjiJQYXMWQDCUllcaehmvRRE/0xEMkWeMXjwU1q6Ky8+R3joEVlFa1vS?=
 =?iso-8859-1?Q?F9guaEEDjmtztUGbXn/Y38WS4vR86STiZZdrAa+HSOLHhxji4BGO9C04WO?=
 =?iso-8859-1?Q?JDI084L24Uv3zCWeQPHIe6GY5i1W2WHQesxroviejrQFbK6E8uKnAOoy+2?=
 =?iso-8859-1?Q?dBD5K1oUKgtsMpd8J4A+RVBBSlf2S8bTyjeiw33hXZh5x5QwAMaPQ3qsIs?=
 =?iso-8859-1?Q?uYxiyxZ0lfI+D4HtsdmbUifK6NtBogmrPUKvxJl1hCSlh7HaK8kDyB7uDW?=
 =?iso-8859-1?Q?OoERCUPPxa9vQJTEbNH25PC5pwmv5UmqA0nUzIWTHrm6L8jCZrc+p+Xii9?=
 =?iso-8859-1?Q?QjfJah3DBoWJYKj4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?LMVuiiTUge0xMnzozys5KFJeWVVK2K7RxEePrmjW/3OzZL40em17RtcW0X?=
 =?iso-8859-1?Q?4ypvBu8Nt4IUE/gQakyeB1EW2Iont8cDCwiYj4H17dSCW/pcXmAVicY1x6?=
 =?iso-8859-1?Q?k+gXNQO88Vp+E9PUQ8yoYuoLX43qVFvuQQQkXPaZ11euq2P8iaTGqj+x1T?=
 =?iso-8859-1?Q?hCqclsxi479L+xF3qSQVCdwrYVe7tH5cvi+oSRzXpIM4Fzerh2wfQFfGL8?=
 =?iso-8859-1?Q?px1DJhge6mu3cWQatG9x35++p2subtwz443vrpEq+MupuMAh8SbAKUTBvu?=
 =?iso-8859-1?Q?DnHq0ipVGwAeYSSo/Adxd3ogAgigGfgIdE485Q5A5jgcBsIemxx1lv4JTV?=
 =?iso-8859-1?Q?bDKmRveVBlwE3KxqQ+OQci3ymwta5S+X4FrupM0bqcEp9blItxhoufbFx3?=
 =?iso-8859-1?Q?wxdA8+pbOKYUnFViLpVOC/XXbL9XRYru7hrlqQlgJC+wODCNRotV73Mk3L?=
 =?iso-8859-1?Q?JtlmiWkfSJi/7E/iRWMv16Fr/1i9ezvveSnSFOTVj/Ql525rCUEKXTcKc8?=
 =?iso-8859-1?Q?S9IApoXuC1gxABIEYUhUrksryfQyK9yPSwJ+5r/m2HMiUCqviuT8Hnu6v+?=
 =?iso-8859-1?Q?Zu6vK8hWqPq/ER2+Yc0QCWuZdNDajNV72VRdjv0OtCV6VdbzU5xRXq/jsp?=
 =?iso-8859-1?Q?k8JqscLGiZenrFFenrlbvPCsvvZVRMvFEGqh1Pl8bkz/TX7Bi3l265PoE+?=
 =?iso-8859-1?Q?muRlQ8XQjvoTk+jQGakP3XeQG8tjiapV3BNhFCzheDjJIRoMYKB75Qi8iC?=
 =?iso-8859-1?Q?uGsSzdXyd28b7yxAp36ZeedI7j+IM7K31pRnGqk5ygNa3SftKx3eRjvXi9?=
 =?iso-8859-1?Q?4g0f1zDyJOzcqG6xTIe7/Tg5wW3eMTnXTY1fccS2Y1iISJgK15cqfJjXcd?=
 =?iso-8859-1?Q?yzA1SHYXQJUkQreLBSOyNukGLke+O1hG8NkL9LIYHhISORGnLwVinwXDvs?=
 =?iso-8859-1?Q?Pq+xC+yjak4X4qotxZuv/aipFaVAsfc4QySFdRmyTZSWwGdPwcOOJDTxFE?=
 =?iso-8859-1?Q?LpGm1ZqF8suRBftTy5roRn3G57vmNpteNjHoyPxF+78wNMfp+ioe8enGl2?=
 =?iso-8859-1?Q?0r4DsUO5fKf+xgHUbSHdUecTaNyKVD6jHCUFoiWXQUgRJPWqQh7yLsV7Ru?=
 =?iso-8859-1?Q?ab0entiPMt0NxB/hNXkTbOOIgf7ARqsoZaQ1mXdKf+MdQVzT1I/+AlLHD6?=
 =?iso-8859-1?Q?A7USxaFsqyJ4GkxVe6h0bywml92rq01N6Dg8yZ5bJFQofwU8tkMwiUp7U0?=
 =?iso-8859-1?Q?7SZy+0uf5oKT2f+9UKykyIUnInjYp9WlGcehY2AMIz6V0paxQRgS03bT8B?=
 =?iso-8859-1?Q?nNSQrSOt9CvhDmxt0a6bWVFwI9+eepdHorBr1tviR+MZXjdAK+21l8pqd6?=
 =?iso-8859-1?Q?f2d26I987XJYguQgU9KEd0d0xDaWLahdxGyQsvs/W89j1bFb3P7+jxgA1k?=
 =?iso-8859-1?Q?d5O0Nam5o6P8xOGXRa3ccsyWTcTbE7hQX8D3IAYyKuVeXq6N7VzPWpkn/S?=
 =?iso-8859-1?Q?brOSs6m/wFaJ8HDT6n59o7iGQYMH0HGbP2RIsSqJWgNkoQJyZfnrDiGQv5?=
 =?iso-8859-1?Q?a58Tdf76Ox/4eGiUuIKqwKPqXGDUZJhn3jSaaKF304P82LAIj2+2x5KGTp?=
 =?iso-8859-1?Q?aukboE9RzZR50gZCd+hT3YxGblMIYLHE2xqDCVuPrpp5+9fwCMM8MrtQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GHYbepLl609BbmDkNnVpqipXo88fy2+dkkFGS+HDdLGGRyo9JyJRY/V/ppR4PpJcb9ZFxiltnMgSMiRUPh7XzhQum+AkSVQnuy3xHxzW8z3VGMDbOtf8C3+HmVCkG1U+z0SR5gQdvSPJzDseCn9DoEIs28feJJAwjXAiIIPxM8RLYskEHk13NFg+pnDB61/jf3Od+6gApVKWRnTZAK31lOFDWvoWBUdZC/21TsBOzCgaKi/OOFwPsbDWUGSjozXK162u06UDCh4W/XAMCZyQlznWzWlKneLCUxx8cSpzW520GDGYjPHDEtK7Mn9MSrUWoiCGlT28sIvBoiNLpAyy8dakLxb3J90IOoPc5nahQjzf3VdrwtQICqwbwKKb7fjTua1f4mefAYtxQgxr+mce33n9kolkixr4FKQggogDp8Ss+WyYTRXFe7WUOnWqHY01vxg8PodVOxLSCrBioY68vY+3cWXCxq/Nw9B7oSZlLUi7m0M2IN9BJOkc4s6FX7NBRd9/oFi90nWp/rg3W9MWP3x6msu+jPSrVI88hPKLRChEK5MocT5sWPmEetn+SnCGKPel9dDZMgPy9FYWzShgYiDj61ZNfbizb5XxNG+G0Q0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31de7db-13da-4ba4-3f83-08dd4264bfe2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 02:04:24.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZg4DnZdD+QAD07D+04HDpVYezfYjvDKja6w8HalT52FwNR5uRJxqoZaRC6JRORllTMF5mLve7dPMYFkdbVd9Y6DSaQKe/jpCx66q4IINtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4748
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502010015
X-Proofpoint-ORIG-GUID: A0SoNfbN8Si9FzZ0i-MNFFsCf43dPS5V
X-Proofpoint-GUID: A0SoNfbN8Si9FzZ0i-MNFFsCf43dPS5V

On Fri, Jan 31, 2025 at 03:29:50PM -0500, Eugene Loh wrote:
> On 1/31/25 11:37, Kris Van Hees wrote:
> 
> > On Thu, Jan 30, 2025 at 02:22:44PM -0500, Eugene Loh wrote:
> > > For
> > > test/unittest/funcs/d_execargs/tst.d_execargs.d
> > > test/unittest/proc/tst.pr_psargs.d
> > > how about a few more arguments?  E.g.,
> > > system("/bin/echo TEST abcde fghijkl");
> > > (I don't have anything particular in mind that this might catch. Just trying
> > > to poke a little harder.)
> > Sure, although it does not really improve the testing because we are looping
> > over all characters, changing '\0' into ' ', except for the last one.  If it
> > works for one it works for all, but I also do not mind adding a few extra
> > arguments.
> 
> Cool.  Again, I have nothing particular in mind that this would stress -- if
> it catches something, it would be something unforeseen.
> 
> Incidentally, I hadn't run proc/tst.pr_args.d.  I just tried:
> 
> *)  On ARM UEK6 (OL7 and OL8), I got
> dtrace: error in dt_clause_1 for probe ID 98979
> (proc:vmlinux::exec-success): invalid address (0xfffff895fa9f) at BPF pc 934
> dtrace: error in dt_clause_1 for probe ID 98979
> (proc:vmlinux::exec-success): invalid address (0xffffcb24faa0) at BPF pc 934
> Maybe UEK6 is not of interest, but there you have it.  Some copyin thing?  I
> don't know.

Hm, yes, come to think of it - arg_start and arg_end seem to indeed point to
the userspace stack so they might very well be userspace addresses.  I am not
sure, so I will investigate and if necessary will adjust the patch to handle
that.

> *)  On most platforms, I got
>              0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f 0123456789abcdef
>          0: 2f 62 69 6e 2f 65 63 68 6f 20 54 45 53 54 00 20 /bin/echo TEST.
>         10: 54 45 53 54 00 00 00 00 00 00 00 00 00 00 00 00 TEST............
>         20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
>         30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
>         40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
> I do not know where those extra chars are coming from, but the test is
> exposing itself to printing out garbage in any case.  Maybe use printf()
> instead of trace so that we do not print out the buffer past the NUL char
> (and get more compact and readable output to boot)?

Aha, that is a bug.  Well, the output is not (and should remain as-is precisely
for catching things like this)...  pr_psargs[] is defined as a char array of
length 80.  So, the output is accurate but we need to ensure we clear the
remainder of the string data.

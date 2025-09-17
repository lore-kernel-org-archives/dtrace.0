Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFC32FC03B
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758130190; cv=fail; b=fyeyxKFJEjM5/XLsuqt1MlLbFVQZIakMDu5wuGU2SKjwiYcEqERIDE5hwcGsvMBDeoFev/EuX2dmJ0j6mXWlcBvut14OGiDs44mc7U8Pu00SIVjslXFIpr+6Cbg7bXEaj46K9ys43sMslVNAdH9DvkW6oxscaLQVl5sMNKaWM0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758130190; c=relaxed/simple;
	bh=IxRYKqVgm8q5kpvJNit1kJJGy7fEVHnNFZ8ojPZ0FYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QPQVHd+xT18kcOrlEo3T5JT5etO7XG99TKfshQUVK1OR0vuz86hcQy9GxgXWDU9Y12Pakhc75DQFnlgUEOaZvZI7DhyZUH0y/7irmlZaxps0a1bvUOC263UwvvruCPnwPnVIklIVpw7BVVKcRi2EftqYcgquEKSMSmCouiIIXtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JSVmTbL6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vrA3hQsG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JSVmTbL6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vrA3hQsG"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HEIUxd008330
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 17:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=piF3sExypD9cK/h7qw
	1XVtgHye1bsVxm8CVW46PNMOU=; b=JSVmTbL6X/gyF5r9TasM/e/jbtyW2rrdXy
	FWVPD9RNbW1QdU20ai2TxDKpK0pTQRfaDR8uIsLIxg9c13EbAP8iWHNg8nSGqW+R
	pKWhYl1A09U6RDei9ljZ1ovFEaEC6g6/8UpI7xvIETinnYAHDW0/GuY4PYMjnLyJ
	/UdLD3u/9Lh21oQX+XjJimTvcLMe9kVCxEtGn9b+8OsK/ew+3bSR6cJW2YiUNXzk
	86TGOXpvJb55wMNvtRgKmCQiY9lh8xF4Emjig1uuifxA/Cen6wFfeTFrCWG+bfyV
	c4RS7eeCJZsFXsoPS75DIcYgiBA2y7ow4+Qp2cv6OQ4Mjss09e9w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx8hrey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 17:29:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58HH4wT8001596
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 17:29:46 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011025.outbound.protection.outlook.com [52.101.62.25])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2ea8qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 17:29:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKtXqw+ZdhqIE9qhxtSdYjV1VxZuQxYUI4I2M2enxQOLJu6n5eUogtUQADQ3M6k1HUx2Bg2Linjmm1zS6axDVNCsXfU9AhFhh36h6yq6sNAY9kX4lPrL9nuoZePeznWtRGXqfdAzFrPwQLbz3hfsjmclS2cdwf3vWhoPnEu0IAgJI9KcyjpPhvPv2EsAl3xTVen+iRBzY/kMSQYV3aBDDlK45gVZcpFW/z/3sICTYnF6Jk+2WBh6JsLnY8GJq5B1KEtEcg7knVGSSqyi3UAY4ECYIAA3Pjrcw8vnOfi88TB2gUzb4cE6Hta2ZN1HSfE/ZYTSwB2r4/TiC8S2euCHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piF3sExypD9cK/h7qw1XVtgHye1bsVxm8CVW46PNMOU=;
 b=kbNrKBidsQPwCIakHObRYZKEixj93trqjBRiFhvuAKbRhN/iy7f94gkI6BfW4Dg6nhFItA5QSECKwsZPZZ7PlvQ+SHKduFLYKMpCkkPJVCzupuBKAfCPhVgXW0maISVWO1aL6lD/YlLm/q9a6zQk/zPT0aHp+kXP0q99gFExTzlz6a4L+ouAurea5n/CSxwUvTl2+KC/A8+mW+udBjp2Z6S4Ca9GszUAnR0Fc0fKsffG5i+15HxZzS3xYsrjz724ncAXN3DzVoJdhSOEVZ5Eqnvjoy7k9XAB7fSEnbYNPbx9rh+TJQPKdF6meyj5PFP14EqvOfDzdeDGHjrD7fjFQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piF3sExypD9cK/h7qw1XVtgHye1bsVxm8CVW46PNMOU=;
 b=vrA3hQsGR5IPpkxmDdXtnmOTVscL/4rtznwR/rrMWi/FbeReeL+hFWVMBsbwnGX5+y6jhoDGiY2uK0vA4RE3Hqpki/4ag/gsa94cuxUoTaVNX+wSgFZ5l8CGLH/F+DmbHczryouEdwffOe6E0lXlmoRppPmUEzQApOZ/hDoIrpo=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM3PPFEC98198CD.namprd10.prod.outlook.com (2603:10b6:f:fc00::c55) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 17 Sep
 2025 17:29:43 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 17:29:43 +0000
Date: Wed, 17 Sep 2025 13:29:40 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Elena Zannoni <elena.zannoni@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [PATCH] Add the userguide to the install step
Message-ID: <aMrwBMvmM22lYi+r@oracle.com>
References: <20250915201616.1364605-1-elena.zannoni@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915201616.1364605-1-elena.zannoni@oracle.com>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM3PPFEC98198CD:EE_
X-MS-Office365-Filtering-Correlation-Id: a2030d72-49c6-4ffd-d913-08ddf60fc9f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KiMsNCcB++wzmgGGtFaO05LdFwty+TTwAE3oL8eTOlJstUKbXbHxZISbyi1M?=
 =?us-ascii?Q?RHZRVGL7EHTmF5SFq4YSgI99Y8aPBB84utx72NAew785sKBDx2xSIiXhHubX?=
 =?us-ascii?Q?V/3y+QrxR7n1vpa17h3mAm2FuTtErl4y0p1e/i8Qm6dUbqzx4tWmDhdb1yVR?=
 =?us-ascii?Q?hmr5MoAvn7y1gLLLtmemCjtfRkOZ5o6xpinepqJNtk4ov5RqpXQsHgsQY6w7?=
 =?us-ascii?Q?DWNn5Nyd6Ojqomql31DHGnsyEvB9csy8PacDsS4MsZJsN6siPMFUSs4rZAu0?=
 =?us-ascii?Q?ImjBrMo/GoqY/YCb9slIRVs5HRaODTnH5on03vMGd12ABhxIJau0i+SQqyr7?=
 =?us-ascii?Q?jVlAFM4YEz4R9i01P/ycQQm4FwP8lUTTPluk/uvRteaN+/hfOA1/2uw2Q+fu?=
 =?us-ascii?Q?ZiTh7DS3+z9Dcf2o2rf6qGURBGyscAzNZGA2xlNBorg8d/l6GL+9krgew907?=
 =?us-ascii?Q?t8AWvfz+EAMTcsggTRO5P6YWcvbwlZaUSeB/uU8zr04TRf0wnapgzVZbqsti?=
 =?us-ascii?Q?Qdx18jkaLbdL3mRtq0mPrTnmjf5/Fyl5RELfaqaAPvgOupvKaUEyL3ait8tn?=
 =?us-ascii?Q?m1bivtCnMQdMIDAWYbM2JMCurHUtVKKZt1Q9HSwI3gbU7wvrj+NY8We+8Iwv?=
 =?us-ascii?Q?fPRQ//Ar1tWhQcKxRwlhYwqxLayJucAVXdWM0MjDnyw8Hng1rTLBRGy1owP5?=
 =?us-ascii?Q?8muZ2jTOBrfiA23828XBzi8N1POCX+QPeFwAR/5Evhkcjg0eI04HHKMyTTu6?=
 =?us-ascii?Q?GHX2b/5lF2ppxcrfhCurG8G4aBnHYpd6Aq923tDmoF7JFToikP9HKgx7D1/B?=
 =?us-ascii?Q?ypuhgcgbx2ta2h7M0u8ABOOymuc6JfvMRUIDAW/8SmZAYmIp8Zp/Ol3hddXk?=
 =?us-ascii?Q?pj+ds7/j64zHdrTQrlYzdJHDyogdoRxH50HNwikaAF5YFzuO/4ljk34BWiEe?=
 =?us-ascii?Q?6bV2/2VRHKxtEcr4WNhx9Nw8QMGzh5vr791dnKT4wAHp9jpjLR6Jo2bTqfG+?=
 =?us-ascii?Q?YE0avqh5NKAGGAyRYs+GHVCyOkaHOjWvLSoiOyfY4xzzLvkmXJPx05HoABuf?=
 =?us-ascii?Q?ochizLlClhqmuKwQKCgv7QYkhDU6RMNrPCBtfhLw2rCFMoQbr3vYavcyOEOV?=
 =?us-ascii?Q?214QOGjSLxR7AXe2iUNd9M/zV+xKUtDo6067yU/8zJRqtUWoeabGWAO+bGsM?=
 =?us-ascii?Q?AJH+YjuVXgDJXgYGeD+1mYUg837MIWqQE8h2OTevwdnQGmAhIctvGADUfZ+d?=
 =?us-ascii?Q?DmKq48/SoXm602mNr+5VAqHN5T8FU98XOxtmqD3ewBXuaJLTMt7sDSxZeRvH?=
 =?us-ascii?Q?DQYP6DBdPS1O+2MfHDkoeTeJPZmhZjQ9p/i1aKPH3+vcKTMjDg7FJYOBNqM5?=
 =?us-ascii?Q?PNUSkV3DLG714y6p+uLtqz9pX3sByA7fU8Z10SBnOQtx8esNWtgznlQ5Q5uw?=
 =?us-ascii?Q?OlrHSi2CvPE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q6vT9JMaf6i/FzJcyrZ0iMbLYuFyEZ8DXsn2DWLxArHoZf/nCzglcqkj3hgx?=
 =?us-ascii?Q?M80d84O3YP2T3zOBQ7jccH0TwclsValU4imIJM+d5rJzylAhu1D3dm09YutP?=
 =?us-ascii?Q?iIQsblAjRTmhfCT7tLT5khp9K/Iv78ioZS0EIOzAiWdUSLX1MvBFKzlp/wq3?=
 =?us-ascii?Q?FUwABOY62NXBA5G+N3EvMqMbGsKrTRnv0QR+T97xcXdkfnVwHN/fni4O5/6+?=
 =?us-ascii?Q?giqS8fBFYZAopsUxI4c8otNLU5yOg1HH/FHW599m22GL1ymwTHLgwZ5+u1xF?=
 =?us-ascii?Q?a6Z/UkdyWlmeE08IiAfp1PqR1RFKtxzmUu02/nqBsYlCpKY3dFSN2WIl4l2+?=
 =?us-ascii?Q?0h9HTKoHEuVCECfeB8DuiQ0dZFkDGUVQUAVTiNfYv+CM0Qb1lTMErybsq6oN?=
 =?us-ascii?Q?7scHyuj/pP4CFPv94Dvj9Pud05xYiAFki1rVY+LfuoH40/10CnMGwbDsK3Mm?=
 =?us-ascii?Q?uqRsnnUb2pCcJg4YdoDJDG95dPJ5hA0VuGsaJQmKffFkbwd0LOqTn3nohsqi?=
 =?us-ascii?Q?2gSCi/AE2Qjh5deQ9vDJXeh5RTy0VPqdXNgXtngSwwkhnrJZbLC0dxGwYj56?=
 =?us-ascii?Q?ka/MnB1xSUGYD7MDVGVvWvLCzdD0rz9G33A2/71xUyR8SF+kN7q97/5e014m?=
 =?us-ascii?Q?cLETUmmwFfgS8qV32y9T6Jhe0a4C0JlgqRgwx5ZvipBVPKRW8dyPKDevhJ8Z?=
 =?us-ascii?Q?bwvC+BA6UCgq5DfAG370S0pcf4tm2Gaffdxz3DWykyVlxmXcQvvsc6fLzH3/?=
 =?us-ascii?Q?sCYTwaIx+tfFkK7zp51RUxFv4Qx6+oK5Lk+3ZpcbKyRK2/wjFZl5qG+dAA3K?=
 =?us-ascii?Q?0us3kLCxSzO34SAyvgWaoM+NzgSf/3KlJsvFO8lWofx3ape1PxHAE/io06TK?=
 =?us-ascii?Q?GQtRRvyACT3uJUimdGGVVzb8fw9XYS58DwpBRyjgiiaGD6QdwD2+OvZcKwJx?=
 =?us-ascii?Q?uGub4Km5sCipfzCd8MsYkEV8mcWkHiQCCYWh78J5qPz2X+YMlUstl4Df2FqI?=
 =?us-ascii?Q?ix20M1ccxNV3wc5rgw5ZnOxJ6ip62XYdtueIjALJ/vpTD7KWZS6YidDzf25F?=
 =?us-ascii?Q?wqFsR/ZxQRc4GnCPBdpZZ1Y0Shr4FPq6ZggQpl1J46a9EfTltlXbJnu85XXt?=
 =?us-ascii?Q?DcKsCTpXIbBItoxvTLX4g82q/0Las612zyM0hAJ/nNAPuE1Nmd9b2lvsrOd3?=
 =?us-ascii?Q?rFl53OSNfzG2yh3gvLFQe30n1WF71fIxNcZkpFgQ81ztfVsZBNMo2EMjldZh?=
 =?us-ascii?Q?BO6ZvJG41BRaPoN2B92k4s9yGSi9xJuUyadFfsVM5Ua4QaXgrRwSpP1da5lT?=
 =?us-ascii?Q?UnCuxzENwJ3zow0oltrEfYrmjnYF4qdi58pjLxZEQJ/I6J4/c2Sm5MjC/Piv?=
 =?us-ascii?Q?2Gs0QHN1AOuzr6BZnvViGJUksLVS7pD7oyAlxhzZ0Zxo02qnqmvofKzuDTzy?=
 =?us-ascii?Q?cAzjOdpUNfOWnyOORQg1PhYizg4bL40ArK0mqYBRTaNxVEISOyILfbo/VW3S?=
 =?us-ascii?Q?k9ctAT+sEJx8f/Cx4OxUZ7LOTHYrWevbHGf7QEn7J/sI49P6Yky0L9gkGsv0?=
 =?us-ascii?Q?EupRRESgW/CbcRxF2TCM2wyHVo8wLhoyKKrcY2J5WOFx+JwdfdsZPZDkjP7a?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gGqezoMQwZ3g8B3r+43U0FpPm+01BZN8moI1gJ1CQARyFDAqvxP0vDM7g5M1JQN5iSHuFpIz2hkbwMY4VmzAO2zWOQo3ypD9oDNK9HG6px3xmbZfoIcLBv4d7DM04qLVIVWDmhbs5neB+/by6TMWo3SvSPpetUz0FiAV5SjxVPOyDApMDKbapmnCm+KJXJHaYBty+6eidn/eiX6PNABZCyVRinQDmzzuoaMOmwh/ijfIcS/7DpEVrWNfpIjI+8bsUhA9Ols1SY/uGdX0cmHyWsUkOK+lW8jgBDJP38srqm/qsSNnMzmiD6VMD8PuEoDyqh8IejvArvcjdDgfB9Q2rBA8fD0NgF4Su5TRW7cPu6ZyoS5Jq+kqxByscMEX4C677excWkQnU5lhl1m3i4zMWkYQOfJvp+8Y0hi8Y2zYiizbc0/hWqDQPRNWwUD1GriwK1/DFujYWRKuWYtYl/8wxEabcUypgvT5I4+h2WGWJPsONSLcOrjGugnEBUYfhTwjMI0FJ4oxe50lTE+HeefJ99lwsQRYMx0heDDESLyBoiS+3FssR18GKWEzx4xDqYABkKeqvUdxxA310wwEZHLenpbEyZgfzoIhBV25YOF6yLk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2030d72-49c6-4ffd-d913-08ddf60fc9f2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 17:29:43.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGkwOjZsZcScGRe9pggw3geuKuXx4EZkFM+ceiUrPjHGWr7waS0MUFxkAdcDW2UZ03wGN9Ss6vom1dmzUR8KidrHO6wFg5VDBOi0aGT/lpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEC98198CD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509170171
X-Authority-Analysis: v=2.4 cv=JNU7s9Kb c=1 sm=1 tr=0 ts=68caf00b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=cFXsPt0mfjtH3JL9kW0A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: V9rLNBB6G_nAXbEv88SOIrFdohKraLLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyajU7jeGIUEg
 TiMyZiKihOHeXDzURK1hNgW8c1chW3DOqRbsqv9LG4OEdcvjiE3WNm6+b9aKc8hHd6sQ6mZaOSy
 /kz+L2QAVrSH60HXGYt990YddtPGGHxRUUB8xobTKaU82QdfOZuQ/6F+bCysdTejvtPu4An+3QE
 MryZC1yH1G410dtm8QfAIB9MBRR5goKnM4WI5/xW+6fgRCh2l2JPfwkhDqSEYgw+30/IJfyvmVx
 8mPpk52BnsNNBTmABFTq6J7C04KLnrf6AWni2fGJSF5ZnLvvogMy3YU+b1kHOuL4+Biszw6dcL+
 oezx7AB473WW4PlhH8awERNayKLzeRpq1O9/Hn0//XEe+Vhh9g3NpZYtJuloUdTf+yKIBhDz54j
 gnWxOIm3
X-Proofpoint-GUID: V9rLNBB6G_nAXbEv88SOIrFdohKraLLL

Missing signed-off-by but I can add it as I merge.

Signed-off-by: Elena Zannoni <elena.zannoni@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

On Mon, Sep 15, 2025 at 02:15:42PM -0600, Elena Zannoni wrote:
> ---
>  Build | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Build b/Build
> index 485e75d6..1a66a824 100644
> --- a/Build
> +++ b/Build
> @@ -3,8 +3,16 @@
>  
>  install::
>  	mkdir -p $(INSTDOCDIR)
> -	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS)
> +	mkdir -p $(INSTDOCDIR)/userguide
> +	mkdir -p $(INSTDOCDIR)/userguide/explanation
> +	mkdir -p $(INSTDOCDIR)/userguide/how-to
> +	mkdir -p $(INSTDOCDIR)/userguide/reference
> +	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS doc/userguide)
>  	install -m 644 README INCOMPATIBILITIES NEWS $(INSTDOCDIR)
> +	install -m 644 doc/userguide/index.md $(INSTDOCDIR)/userguide
> +	install -m 644 doc/userguide/explanation/* $(INSTDOCDIR)/userguide/explanation
> +	install -m 644 doc/userguide/how-to/* $(INSTDOCDIR)/userguide/how-to
> +	install -m 644 doc/userguide/reference/* $(INSTDOCDIR)/userguide/reference
>  
>  install-test::
>  	mkdir -p $(INSTTESTDIR)
> -- 
> 2.51.0
> 

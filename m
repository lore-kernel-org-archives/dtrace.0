Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEEC2D7DF6
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759767302; cv=fail; b=ZwpA6IG70RwqA35yb0TJAes4W6e6lyu4965OcsnyO/YvbG7OL0ALS36shNcPomppS7/2ws9GcNIW9pCd9xL3QeBWJKu8d+4adA8V/OP4jkFmGvcpht9Z4W4gw6XTxcOsoSsqJaczWKvkmZoWK6FVtxLfqohVJ4Ys7VcxR3NjX6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759767302; c=relaxed/simple;
	bh=7Y8O4TBYdj2CHcPYxK9RXh+2hgJTzu7db+ol27//9IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nyn31lMOHkD93WW1M0XD9a897W97eETvKXubg8FNvb8u2p3axAUggLU5p41D3VcrSe1aZ1kBKjUY+QwJsKtDQgocFO3AkvxW8qqdZrO8Ts0ic+MAQY104sZHBMQ0iFABDwTyDM4kezwI2RAPzHMmifAqKiJUhCs0fn/xYK9dMBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OqcuCrAT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CP27n28X; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OqcuCrAT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CP27n28X"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596G9L00007376
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 16:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=tf1dZhoC7S3V9rtYjG
	hRI1sN7pWw0bKimClEICsp0DY=; b=OqcuCrAT+4zosA5DIjqldYKnED6EYIJ0sh
	smiF1IrIk2XjFhuvhmu+M1uhi+cEOJM7+m8wscgPxTcFyiJ28iInZPavkPINpVmF
	9Bgw0tB3nEEDseSiZ6m0A3mNt2gyVO21JzXpX0BKeIiQhwuytqHSJFeL9Lp711fu
	u1Cy2Jribb9fcITqQeNxuLp0SlarCoiwaVF4XjK+7uSLx2cpudlxg6UM8pCBzMjs
	2awDjdTjb+735Ogoy9UafCF5ztgX9rq+xBywZMX+wjPFyx7uQ4SUdw+2dnxayBfj
	st8Lfv+YChbFv1yYLKjTGSbn7QYad7iacVc842R2SdWX1Lu+pHcg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mh1u00kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 16:15:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596FtT7o035909
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 16:14:58 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49kdp3q3ht-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 16:14:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jt8bxx25+qO7SRWL5mYe9h2M4s4/mMw10Rf35eTiFozTGuz1r0T+ilHtLzW9J1Tu+FD3M5mr3YVwQ7RnxI5ADi/OSZ5XnBf3/Ssv+0+pJR+mLz5iX7b+WdgY1zDlP2ioltr8Zz3Cj9w0OOIarSl1Ujb8zm9VLAwFcYs9q29O8i71XdOC1hOCFTxKiKzBUQ/KoZS+UiX7j4SuLCscpO7Dp9WupC03AEFCAdiLgBwBzNAu90jfnvINDamdHFUJzk5Iq/pZ6JDQDmXN5+OGkRsbL5mMN9infMX+eTFGwdplhlcjI10Ybi7CIin2s60KzstUWpcjsUjqzYmz5KYzY/1FNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tf1dZhoC7S3V9rtYjGhRI1sN7pWw0bKimClEICsp0DY=;
 b=uldsjTPF/920GiLAgQM+MMC5T72YwHZvJrsjeP7CEaJtiUb5GeWDT7Za+77rb5M3G8+cZZl6DEE3qKI811IFXWLZqqZwAEAKSZahbdC8w4cLE506J4FdtusKyNnMjdmwJaS1w+hDG80XjKSQ+xDxw61DbPtMdS4KmAXGahluS8A0tJzN/AODmNZLva15jBmX2xA2L/b4ZYALN8rYzNPA8OecaT1yVrXm3T2K03PypIKTMibgk0yPqDA44iZ+QRqZWBBoUXOQvG66/UaTDn2ylq8+FJTZQYTjbtva00vc3ZB7vIKRhnmghjJg1ai6UsU0LcbQL1R7OjdyKvuyEiDksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tf1dZhoC7S3V9rtYjGhRI1sN7pWw0bKimClEICsp0DY=;
 b=CP27n28XQuhomYBBszwmogTwGvBYJXiSzn8+rY8cskK2JPIry0gKbi1/7wRFEiydvD9RTg2Wn7FfilvxicWjloiG+vQDfqkxC4x1tWVOcq7wK8r/ZN6kGz5bJvaze6FR0W6CsSXSQZy4QIMWINonaLeKjW3V/Iiit4v4Gh9Egio=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MW4PR10MB5839.namprd10.prod.outlook.com (2603:10b6:303:18f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 16:14:51 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 16:14:51 +0000
Date: Mon, 6 Oct 2025 12:14:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 5/5] test: dupstruct: fix extra duplicate identifier case
Message-ID: <aOPq+B2nt8lyfFsU@oracle.com>
References: <20251006152829.239100-1-nick.alcock@oracle.com>
 <20251006152829.239100-5-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006152829.239100-5-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MW4PR10MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d898009-b11d-4a90-8880-08de04f37a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wdzDEwoBC+rrMqf5yisLWGHAspvHvRypnt1yUDq4P3K/9R3kc9hsvWc8SKR+?=
 =?us-ascii?Q?pw7NMpEDkMsWJ0mwOIkWUzc7stMxyqDjKUFWQNi34OSZOAwBPUm15I3/ImFG?=
 =?us-ascii?Q?VRNPaIhzqdB6YhdPkkeKaNvrc4bd7gJkbo2M3W9XFxtwsPuWZR9IXaYYjxSm?=
 =?us-ascii?Q?OPANjnzTSgd60S73dcCS0fiBnLgqjghfhO0S88b417xbQsIGSu3UBQSKIBO5?=
 =?us-ascii?Q?HfZY3Q8Sem+W1J6qkiR16PKhBRa91L+dPJfwvUmRY9Unwl3T8zbhvdfmyttA?=
 =?us-ascii?Q?WmvMyiRtrxJXxXn9sdhKYKtWEwYYWyc8Wen4SJEECXzfwbgIQ2fo3rj1sBJc?=
 =?us-ascii?Q?zEY3mF/j2VkQ7E5eAeLkd7bjYLB9zixbQSHwCaN06WqeEN0cufeB9B8hcHYL?=
 =?us-ascii?Q?/4biEDHsoxKt4LK0SrtDqsZMcXiu9bf1RuFjNX0SvWH7SRSHEcPIEXXKcwGd?=
 =?us-ascii?Q?APbDq48FTAElhZ5gmcMRYQu7y3jApbSI+p+pKZh9ict5gixJmsdxD1tgboEF?=
 =?us-ascii?Q?2hr5rvJI6FXn718CPIY7EuW9mabAuqWKZrVVNZbY2Iq94OtRS0TewbQ9bhCY?=
 =?us-ascii?Q?tBLni9v9xAjvGeDAK286kS96JcyUhc2Y7hawMw++xi9TV5+v2jTSQIVy8uXO?=
 =?us-ascii?Q?z75mmlDUGoFAHOzDKyiTixJ4e3DWTOMatDA5/7ypTtInuLYwVKBxqOYWeQZo?=
 =?us-ascii?Q?0/CbznsOXnDagLjGbtGo+VvWFi7dyFbGod7K31fn8AH1m1ycbehiRCRkO7aY?=
 =?us-ascii?Q?FuA+31VKq97N3DjuUi1OxwTWzd00H2Cxl3mNufH2RlbcvW8UDLOlTx8wbHH6?=
 =?us-ascii?Q?xzu5C0W+2lNapE0L+uOR7KRmvBjLt1hxph8lgZopAkPaL5M9MLYcL3K3oyqH?=
 =?us-ascii?Q?yFomHtF1dInFpn8+8fwQbS4K38UBLBFj0JR+ku3kX6rDHDa9Ai3FJZNYDfB3?=
 =?us-ascii?Q?dMLnYRRfL4bz/ubUSIB3Ay5ZYd43o+3OhXoE+ut1DoA74oPlu0fk4jb8AsLj?=
 =?us-ascii?Q?yBkDcvI3A3wUSVjdGPZDqpjcKxnbj/3FPbdb3WEGEFYjHB00HXFEwu0iHaXp?=
 =?us-ascii?Q?JZWHpL2VzXjgt9YrkZYcoFgwGoekT+Vuw1q8K/IemG9QLiJJx0ehnOX7v2YH?=
 =?us-ascii?Q?WOR5kdaDbHEWBdri8etwTt7OZW/jsfAl/3OKq7g702MXoXY2ts7pC6wlATRk?=
 =?us-ascii?Q?ZBwjHHaCkMoLbJE04qZGkOwXIOmqAnNBafQp0TR8nWSZUQk2x9ErYP408g/Z?=
 =?us-ascii?Q?R5ZBjOTexAOalCDEUQ4JLz7wabDoKk59dZnpAO6yD2AoTPD7g5u98hX+kV8n?=
 =?us-ascii?Q?2HkQF4RsFgRj1xTDUPg6SVEgW4N7VpVFE6kMLDDgYhxBgs9Tn1A7nhsIM28v?=
 =?us-ascii?Q?/txe7xSxkJ66yiY/PwyIF3vkjG4VYsS/757pPqJPSYDvFUSzVM9nwPSxpEp6?=
 =?us-ascii?Q?FVnbI66rpOg8DoVviZaP5Fjl51B79v9SuS+0I/GolbXVMp0Xb9C/Mg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M5UGsX3CHPuHNnapT6xLwhVQLhpg+eNvk9iIBwKxe8KMvPJ+os9QbaTTxZJ4?=
 =?us-ascii?Q?yOfNIUthR3fWWfT32cUIYKh0CFPgubRU59/Fgeh8Zs5BLmoP4rShFXgAStL2?=
 =?us-ascii?Q?+jcf2MjAkkFjEw3wnWe6GK97fBEbMjpHubQMtctyC7BkEuu2SwBBclhlo0p0?=
 =?us-ascii?Q?W7xZIcZfZ05wQvESh1TzLRZva8kxZezjYmLy2N7AgimW7dwcSwIC5eaynira?=
 =?us-ascii?Q?ioAriupNhBkdpUoL2eBGd/e5f7KGjmjggRonrA2E5sfbOn5yry7ZRPrfTExl?=
 =?us-ascii?Q?8aFhsRShcKXydedMwgi/PbX9FXWc/phrLt7MQZGO8heZHqlKNHdArCCIUEEu?=
 =?us-ascii?Q?VjFMGYf1xgRUrQQREkHPrswHYTRzZ+GdXGAqCImljUvc/OFAM4LtchYIkJFY?=
 =?us-ascii?Q?Q4pQBJ1iu695qkjU1R9C/wURVTWKE9kI2O+nMhuinjiCtcRSL9YypqgQhgjv?=
 =?us-ascii?Q?xIVbwRVY8cJm/hvncDo9URs+cWLjaa/v3EZE6lj5EZAYBTj1QY7b982i4pZF?=
 =?us-ascii?Q?DtdzjnyBHsYtugVQYdQOmkrYWuA+6WFDFe6YNlvZLD1OeVJqYj4Av3/qndTk?=
 =?us-ascii?Q?WcoqFFkMbVMp+KvLC6uchOrwI5ovs9kdFIq98mtrVZjzvzrbB9ZOGQs8hOsf?=
 =?us-ascii?Q?bt9+bB5/8IlPDiUe6nN7hC/LACwtNyF0JUm30zIfUNoL5ui7xN5Q5adxQDyY?=
 =?us-ascii?Q?wLVCUbia0tmYhcV1TspCo55gCV11LZ4TwV3dj3u09bsPlvhwpKQtATS/h3r0?=
 =?us-ascii?Q?K9PFYsbZ6PCwYEx9QhikiPKKY2h6QESAfDobJo8yssfLZXiO6XZeaV+UzBmz?=
 =?us-ascii?Q?u39iKFITvPqXEVpjRdSo5yPn5SBSMOx8KesjIzur8qHIS4FwMg2bMBBmCuV0?=
 =?us-ascii?Q?HYXHVFJjgT/NGdodhVK4IOuKm4Azz2LafaWIHcR6ih8T2w70GAGvFLMbpfBa?=
 =?us-ascii?Q?kWe6TQhlv9H8G2XrjP23fZSR149bW/KwrbrMYRI4NmpfJLGO7ECKVc/YPJXn?=
 =?us-ascii?Q?RpZyLswpHeK4KrPA/fqP3vLIvl+m07E7/yDHD/PNRXVi3bbSrKlXuh0QODJV?=
 =?us-ascii?Q?zsN6vqeyrEYuYpGfcj8VokSpoxw2epJUpNE4WKZAE66zv0GDIlmB8ixYU0sr?=
 =?us-ascii?Q?nrNXWBP/uDBBKd5QPTXGQJpkbA+btPWGYCh1DwZxpyHiqi1M24mHfb4r0hbZ?=
 =?us-ascii?Q?Lx6rR2dTBfAXFxCO791ff6j2ZBhlI1cUYR7lxlGQoUAfjLgbylQJ5nopV0Rb?=
 =?us-ascii?Q?rb45Pjv1cxj1ZDAQ2QMUBk7pZjZ7n2udYqeBWdk7q0c5anV4ykxSTWXAUAro?=
 =?us-ascii?Q?wN57Jv1CNx/BVSnHDTSYdNlnmZ7+kL+EzYA60ypfdNZ9HIlLzCFd82/9GW2L?=
 =?us-ascii?Q?YhssZHdCG5JCPvmIiZAQUnWSYwkTBMajnYcugXI60VX6d73kMkdMA5dkqK6P?=
 =?us-ascii?Q?9xn+My3KKWAMRg4EYen9fyHsaDcVkv8p4MX8tjNGkOyOjyMh47t4dkY1Ka5I?=
 =?us-ascii?Q?2ZmrwexUBOaRd4DZZtuHIbD38GmIAWzjhqmF4hsyY/i34OBu6kxfvlmEhpvz?=
 =?us-ascii?Q?Lt9goz9oOBKk4zeEqkW63+BjDyr16LuTtGyYmHjuwOiSUGe0q2nV74SqHfBj?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	plALQBV/oj9DjF3ALwCR1CqSgmXVlJ/vujkmXl5i5J7qG0GFYfyZYrKbG+hooZKIf7NKUNwKSNLalP+bWhuDu9glB3v1rQkLvgbiaCZcDw8CIcZwVWgYwqD1jNtks7WOXR8TMBUAsyoMPKiyA835ALvw8zi8AcTmKupFSU6gBvtoeiTxMEeQG5UYUXOA77W2ZQdl0ti5mbVyZ9OikkQDV7C24CM9E6zPkGCH/7EppNBbYzyrxqlBDRJMhG5+V0+64AlDtCgCay6s0dDtc4LdODDS/KfGcCH8IM8wH31D5L0HgAhMhOqZ+y6wmnyKvaz7bsftz2vyp1WE9lPCqinKSTBNc0DsiyqpsEuDgAqRgDKmcz1TrmBU3WiFfIbunm6/ixaznkUyiqej/Ik599sPkxkrunSqLRcafrsdVMxWDUStvdoDiQETUiT/dZx+vM+ss3Sk26TcxNMiEt5QhlhhOM4567fQdLBQnQuNOLfr7PILFy4aUKDgJXTslKp8mz/gaIlpe6rKPW1lLCjCGYhCr0HWpKcrSGqpL4d2yEj1tnGWVJ2GoN21R8fe5IUsxa6UPodi7EjgAJdtj4ltB/WwVuc2+1ZdZFSUj44jOrZCXwo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d898009-b11d-4a90-8880-08de04f37a78
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 16:14:51.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fN+wLhtZNpmbC5MWkOOAJus9IvD9BA7PaWTT+y9lEe7bjarLeJmEbedQBPliLHOGYOvF435dlt5t0kE6cH9Ek/pS/3EcKRN6GnKW50Gpe7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5839
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510060128
X-Proofpoint-GUID: 9vDo7E6f12yt924jTn9HGJfMPJjYuk0V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyNyBTYWx0ZWRfX6uUzXYbQf9Kn
 0R9kH70xw+ofyrPpxpKuVIRov1pUEay/dF6SY3ceTSxXuw3QNurFYsXlIRLpUxAqcQhG8t4reN8
 GHPQnhS2EW/jEm36l78Lt2Hji0ZYzNi+Lvkcj21K+n7cmUqYORh/7PTe98wIoByTj04g2GfTtqZ
 m8y2EYdyijv8R3qbcTFLsOEPlRFu/tbXSkbEnu3XnhBRnZUtK2wVAOKl94Vsdr0yK2VffMiP1so
 dVgjRxOIDOsCMGr1PGp0ubVvSLuEfX2gm+UncljYlEVt3/u6XxlhA3FDsHarD2JDnUglOPG2/yB
 I7K0OuHCisWwEl5uVIHu4x2wQyEZObcCYxBeWCLMzeV5Dhbsv14kQyd1C/DysD0SeEvPmQR+we9
 Rf+OZPJL/JAhZ50EmQasYcSNwMFr8H4+9GGtjsKG3QyptpoUrYg=
X-Proofpoint-ORIG-GUID: 9vDo7E6f12yt924jTn9HGJfMPJjYuk0V
X-Authority-Analysis: v=2.4 cv=WuQm8Nfv c=1 sm=1 tr=0 ts=68e3eb04 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=wI0BT-AHudYE2s8Lm8MA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12092

On Mon, Oct 06, 2025 at 04:28:28PM +0100, Nick Alcock wrote:
> We were failing to handle one case where duplicate members or variables
> are now reported as duplicate members, enumerators, or variables.
> (It was concealed inside an .r.p.)
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/types/err.D_UNKNOWN.dupstruct.r | 2 +-
>  test/utils/libctf.r.p                         | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/test/unittest/types/err.D_UNKNOWN.dupstruct.r b/test/unittest/types/err.D_UNKNOWN.dupstruct.r
> index 7afa74aa7f6d7..762b24f4c5901 100644
> --- a/test/unittest/types/err.D_UNKNOWN.dupstruct.r
> +++ b/test/unittest/types/err.D_UNKNOWN.dupstruct.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: failed to compile script test/unittest/types/err.D_UNKNOWN.dupstruct.d: [D_UNKNOWN] line 17: failed to define member 'x': Duplicate member or variable name
> +dtrace: failed to compile script test/unittest/types/err.D_UNKNOWN.dupstruct.d: [D_UNKNOWN] line 17: failed to define member 'x': Duplicate member, enumerator, or variable name
> diff --git a/test/utils/libctf.r.p b/test/utils/libctf.r.p
> index a2b4602cf713b..774eda7f57e1f 100755
> --- a/test/utils/libctf.r.p
> +++ b/test/utils/libctf.r.p
> @@ -1,7 +1,8 @@
>  #!/usr/bin/gawk -f
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
> -/Duplicate member or variable name\.$/ { sub(/\.$/, ""); }
> +/Duplicate member or variable name/ { sub(/Duplicate member/, "&, enumerator,"); }
> +/Duplicate member, enumerator, or variable name\.$/ { sub(/\.$/, ""); }
>  /Member name not found\.$/ { sub(/\.$/, ""); }
>  /enum union pirate:/ { sub(/enum union pirate/, "enum struct pirate"); }
>  { print; }
> -- 
> 2.51.0.284.g117bcb8de7
> 

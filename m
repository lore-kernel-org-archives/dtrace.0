Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC123155C97
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753468680; cv=fail; b=t9kE/Wcl8Px2TlJM4Yp/mEr++4Kt+1gkr2ItCfZOzmeVa/1wsQoK0d1kdwZE5F5elmC2fNsuL1OJ0BUguLANbB6AXv2alotHt9mSwV3vnUras1HBimaA0RMA2l8zfZIrivlRYIoysavvRHt145IXdpJ0Mjz/uPKEGx39JBIbpvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753468680; c=relaxed/simple;
	bh=pUB3U9MOY8mU72BIxK9mCHcmouAF+m4F6TNiIB8ufgk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=pw16fk6nqceIji1IROAYkpHbAtKLCgLUviOah+DUnLP5sr9zPLy0Zb6HLUNlJ1hnnRuv2Cc6WHXuaZlrijbnvwo2RWFRkr8QfjwQWdyflpp+KSWRJBuuzev+d+Saz1smiMHtvvNTqLHkPZ+6+h0tUKICS2DtTUvypi98V2gl7SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SvRBSjAx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TJ9fqYje; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SvRBSjAx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TJ9fqYje"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PGCDa6026471
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Fisv349iPiIEiIFzNe
	e5b+cZdfIq7Jz0A8YmoLj30GU=; b=SvRBSjAxCcGGTEDReyOsgWpH1Dmks1IgcB
	bzVWieKMvM0au7CLUbFfcSh8XMASP/jyJ7pKbkbT+vImk5oyDkTCmk8zfWK+lfBG
	HMyd/+y30Bd4RHJnXNiE/qL+J4nVNfd8L2pXLExtp3egbG6AIlomz7kpyaV4Kmwo
	1vOIYx6yvObKiqjpKsidKdOyzXt6LQz+dIULDcH6GbMxVRuy5XKGukyzIIRcey6K
	rRPGnYvWYFb0pCM5YiuCdOr5pYC9w6OyP81A+MiZLuxGC9pg4X8syNImuNtZbGKo
	rTYKuTaCPCJhI2hjj+/loW3ITXrMW+EPO9lPYcbBMM7IJdD6pOHw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w1jhmgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:37:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56PIatnN006731
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:37:57 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2040.outbound.protection.outlook.com [40.107.212.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tdd17m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:37:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sgnt6pf2OqeiET7WgY7MorlroaeG1JouEJjqBCu/+XdH3RiHaLO6Q9hmlWeDXubPt+PIzezOtZ9UmYXlJUkQsj6dbQKGvecpxv4Cc3m5jm3XNPndLp1Fxf7bGyy1pEgLS57hxMoxOPWmky9mC5nhVwQZsaEViwd61MAoUWNtE/3CQzAjO9LZvXjNuQ/jGZhRlLwb90PnVN25eAWXD2annWUfB6KxfRqj1iZJSDxBibuDVE40Mw82KFMapLUrHBCRxwNum9TaXOfbzWl682jysjgxGHDVuxzrnvhudFSATJJgCOZUPcDM52SgZ4Bd2iNL9TNLq8DoMMTGGjBNXMXpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fisv349iPiIEiIFzNee5b+cZdfIq7Jz0A8YmoLj30GU=;
 b=jwQWaLnPzVNKFcAJ9K2BrJjOoTEDjOyLqVZdrESr9KmiWqBlmEvq+Weoe/LhdyIhBDyACZqWROI5vzgxWZ8J9v4WAOCU1HrDWMqt0Fgi02wkaGmrrP/ObVk7jAEQVuhzRp1Dy4inKfmakZ3R5XHpoxUG7VqZkoLKYzMoyDDd8Q1M/EMl+SmNVBliUP5Qpaq7NQpo9DD4FKhk+QHF+bLWYBJZc9aT4Pg1FkA7JVPBeBOVYn7meS/xdrSHZS07LObdhJwtZri5HZBg98Wtzn/CVL8K1HHSzZeQcjgOdkLe9aaj89PtK2o3Dx3B3u4hBV95qGSFk7O6HAod/yRlLr4uXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fisv349iPiIEiIFzNee5b+cZdfIq7Jz0A8YmoLj30GU=;
 b=TJ9fqYjeSKihDkN7kbdSE3+z54EFgLuL+7yUkqDeB/UYuEk6DHQ37QewlavVLRfpATWjsh0GfmgNiD54PcIYQ3soYDPU2HMs/nGg1W31OVbHY02CFV+qSiDXSTehmWI75IyxO6yG5ZHUJj6bHeMbKTt+8WUBz5ifkljgeq/L00E=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by CO1PR10MB4594.namprd10.prod.outlook.com
 (2603:10b6:303:9a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Fri, 25 Jul
 2025 18:37:52 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::eedc:3845:77ea:c7a0]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::eedc:3845:77ea:c7a0%4]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 18:37:51 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] btf: fix symbol BTF ID lookup
References: <SJ0PR10MB56726C5DD50A9020370699DAC25EA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: a real time environment for simulating molasses-based life forms.
Date: Fri, 25 Jul 2025 19:37:45 +0100
In-Reply-To: <SJ0PR10MB56726C5DD50A9020370699DAC25EA@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Thu, 24 Jul 2025 14:56:20 -0400")
Message-ID: <87seik3yme.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0237.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::20) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|CO1PR10MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 24326e2a-e30a-400f-6f9d-08ddcbaa5c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aKZhbaw5iLLPmwn72hZOs9H9FJYYfWyAB5xlrhbJVfsfAjcwAmJg3CqzNbMv?=
 =?us-ascii?Q?xExzdCempGoiWYnkBXxRopmWug46Hb+E0RTQhSm4ifu2llwFI/h1yI+boQwc?=
 =?us-ascii?Q?p+yiZeR6qaA9PwArCYDF7bfUkpxs7JBUdlbhOKd2pLBCNxRwON6WjG5BVIld?=
 =?us-ascii?Q?3MkvFJyfRcDmwczfFIEKtcyFl7eWkJ2PE/b2SvNidZgUQZjom5rKVV1zLhon?=
 =?us-ascii?Q?pD3rrGiZoqHNOKF9VSMe5ESW27a+cHaWvGyaaV+pd2jk6P+zQ3b9VLhp7nHj?=
 =?us-ascii?Q?+9Xin6dxR4Y59BAjBouDhTu4jgwC/L3ORoh2a55pOQv3YcsF9bAJIlN0F9LO?=
 =?us-ascii?Q?qx1uN0KINP4LXygC08fBW7lR1ncTg3Ik2oC9/XgOAJ0K0Y60BoXYseJf6C1J?=
 =?us-ascii?Q?qlOhb7yNFXwKlCRbiZTJvC+/PUH/qHmKqSizmqVckOyAIUu5Lvg1gIURo1Iw?=
 =?us-ascii?Q?Gg0jwNvhpGyJghEqHBxxiuFmcNmz0q+3ArHfdEgmvVwlXoDPHwjovEbLwPO0?=
 =?us-ascii?Q?Yw+NoWPOehipE8YwkllUyzaUmMVVXe/HalWAsjIH+oHPYiJ4WWTySaCHLPog?=
 =?us-ascii?Q?WyIRftRVZh9DRZcW0emt05983RNkWo+nGMXRQHXHCAh5xuFqtA8xhY0SNWGo?=
 =?us-ascii?Q?JndijRvJfOgnsZ+gRdymS2Ai3EhkFA2l8FxE/iJvb2xFi8gyIFIexhnzYEwC?=
 =?us-ascii?Q?8nUyhY5orWVZ2/nZWZGCQFfV1hVWE1drOz0iRaDop7wLXQv8tWtcPOxbSdsz?=
 =?us-ascii?Q?LQIo2hyOpxI+uIi9J4IC4V7mDqoXLC7eKiXYt9auSwi48lwKr9CqO7QZmTFq?=
 =?us-ascii?Q?tTBJaSnZNVfKtUPmFh5NUr+Hyz/pBrM+U/a7l8KnyPRHx3GzZIwtE7FEpAy+?=
 =?us-ascii?Q?TdafKT1bK6yLeSeGu2EWCMbVbWW+cmK2kuy8oXnDmaFPr3Pixy9dtIx6UNqf?=
 =?us-ascii?Q?TWroxBGrHEcPWoKeOoHYy2hUbLzwM1tua1sI+YYovuKEkHqpZiL2yfo4aSMI?=
 =?us-ascii?Q?8cr+cSzqza500tZkDpgqyyQUs+Ou3CF4RFyuDDcg2Po28fetZaC7Zel7VkRA?=
 =?us-ascii?Q?uJmQk0Qf90PjD+xtEdMSsTXSeiNCnY/xl26zvffQpcgbOBYukXeXLSM1zuoI?=
 =?us-ascii?Q?m4jpusUWxStDrNlGR0QLQZag8TbVhEZl2h7Np0KqfKx0kHWZ1K1KOCJ0K/GF?=
 =?us-ascii?Q?mk5M/KqVtiLr1TDk3eHtoXApOgMQ+b9bTktqymWla0O855vJYZEngXbXn54/?=
 =?us-ascii?Q?O7cvfy/L2g74QNDhVBUqHoOd3SCzHW3gpqgOFL+NtAd9aniez2jdNppxdQjr?=
 =?us-ascii?Q?PFd65vRl/6Kdo9cO6nj+8fAHETeuHYlRkJbIAK2SaB3pYwXCP7pM7svDkfX6?=
 =?us-ascii?Q?fffEac4p6x72sFsnVu6y0IqG0layoooThWbd7oKUDHeBP/26f3+NuURLnPgq?=
 =?us-ascii?Q?S5NsyhirBY4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T9dmAwxBy/QL1wL13yyNIIOnAnMIuWIKbWj9Xdth9aGGJLalEt71JxtLW8CT?=
 =?us-ascii?Q?/UiFyvoIvdiGhwYhMKvzDT46+XbBsZtBzwavM/2k0JGEZHWp7MJGXivXXvKT?=
 =?us-ascii?Q?jfhmFNu5Il15SPJHSeXUpuLpF2Hyr4syAbVSV51W2GjbqvXgUWr0bdc8CHUI?=
 =?us-ascii?Q?MJmsu0c+nk5j+THZs0FbyyWWJdHV/9id3JRVvDNofIool5MRv15WpBJLfvfO?=
 =?us-ascii?Q?aIm+vmydCcoPllJyIMDaNwffPQp67Hz10vEW2NjruUvw+lYIpiwUu7K2j+VE?=
 =?us-ascii?Q?QrfOAdnBjrjxIj7iQvSivWC9jKHu4WxlVRjamKbIU9j0lRg9oA9N3l5qBSVn?=
 =?us-ascii?Q?K3pDIqGR8CDoE8tO7DOvgQI7VVk3bA6gfkOgEb8Ko182YOnFxcUGer3ZlE5A?=
 =?us-ascii?Q?OKSUPQEPovfOgnJJbMu9TuMq6UYJ8oi02obVHiD6dQbprdFJTyx6vyM4kZR1?=
 =?us-ascii?Q?UGRM9lbeqCFVgOqEjzS8HBdBo5j/zhaqLSGVSqey7Hmm0ko6K1Oud8X9Hjyr?=
 =?us-ascii?Q?xlXUziW1pAPXeKVyHaHyRAY8rL+oVIkMe0d3BYys1C6UYdWDiFLFSC3iuVfy?=
 =?us-ascii?Q?hXOaDrjafM+5PoFQFrwT4ZRc+NRhM+6nPMZFtPVe9nMsyT3aWW2LAIwUHqo+?=
 =?us-ascii?Q?YJt3RzKh4x/8ZztAM+w5bf2ZaOwzE4EHfy9M0DXuCa3iNBoxFM9Dm8SkXcUm?=
 =?us-ascii?Q?Bc09tAsObJ8cwqGh/9EfueZXcrUBDuQZTzucnnThhsv8wR65ormdUgzqcPuO?=
 =?us-ascii?Q?8oRf0/kJUDTA6jliKD6owm5rUffGx7YBJzmmC8QSBUoG8BF7dRTIq/ycx/K0?=
 =?us-ascii?Q?76ZsFEfeC7mggZ1i31Le5udkZR/FMMy9VyxbMHn5EIiacB9QE+sVOuxgj48Y?=
 =?us-ascii?Q?cRpf6T+UL4rxgjIgPvp0H07s2N7p3L2bEP4dLwcuROJ29xJCJpGb62sco8fv?=
 =?us-ascii?Q?iweN+j2NSj/AF/l7tThUxQnqJouYSaVjYDJmcjM2gmtyWHJxHi2vU3DHRmob?=
 =?us-ascii?Q?h0Rb8eKiddgum385jHYS1y+N2R8QwzDRDDOK8M7qJX8fGtggZpYAgti0c8kV?=
 =?us-ascii?Q?OPYIFtqujYwubFqBjFFDWOCIDjBvScit3SwLbvt34hfZM/Qcq4lqoN/FzWXv?=
 =?us-ascii?Q?LW6ReTSwXb9HXDLjBQ2VLRD6cIHJcv6ZM1ceZcjLPLonrN42N0IUc9QfRDkE?=
 =?us-ascii?Q?qBxMWOrQT4GooR4zsDE8emSWxUjWk0GTskZQ0gM3sgpL/+OPdb8TvHhrTkUn?=
 =?us-ascii?Q?XrFJcW7S2gujqtNoKmT615sU09TXtAMYfeHfiDHvr7KO9WyoWs3kCfcnVY6N?=
 =?us-ascii?Q?nEZQCBB3j9sM9zT+Cc8aqc/+cu3xy8nRFTjNRDTDl6oXCJuawyLN6Rvinyht?=
 =?us-ascii?Q?Ff0MLPzFLoDxlAOl4xZ8Qp5WNtnIo/3KI3Fs/zSABGKrs2oqMl6LOdItFJBH?=
 =?us-ascii?Q?njeEUgLGO0IlJimMH7W0mEQKlvV/FZO4gnz4cpDHsEY59vyEYezm8zjNH+9X?=
 =?us-ascii?Q?7i9aLiqnyEhHBAYfDABjoraiOXGjh/rch39S7rRavOF6Y4eW6K+n46TkXeT4?=
 =?us-ascii?Q?KoBMso2+edbCQ+IThVtExO5GXEv6BS3AFDuXIYqrksAzP6pTCv0nwT3qnXEo?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	454kUOT5ff/MJ2xV/4y47N4x03k2lTW5KTgFchZTtaxeNLmisGZY3LBAd+5X7cdFKMKji3kXWp4LaN9FEj0bNdOLUF/F2JydFbzfGbnfaPR/Nr3GlpKRID6euJeuXRhqAHJFCEG2i2nXtk66NMa5s5KK5eaftwAlZCrmBhLgY2qJ9GmmXv9xcOxP+4tp+XbzzfUZ/U3qZSUu0fXvKPzbAbaOf+PNtbVV+5IsXqIOCAuwLleVTTw3kFaY1lymjL19hUJ7D/IHXg3kOsO8jSTCdFr7UI2Zi8zI/Efyglae5rp8jYI2OKMiass785l9q5sEgf0fIAEZX+NGOhWzaZZRZQJUqkF2vyVgrjZzUzQPI9NIb6CITzokCo5SNisfN/hjTKLifKqgcmGb0xL2pqLhCoRzzTfugKPHhlnEV8iJC0EDAgYMf9VhalXJFevhEazX95/rc4m1R1Xi73m3hMXDfbrWpYJo6YSveXM6wgVzl0wP9w1/wapIgvWL0WlMV4Q04A7Ce8l7Q2/aeW36GujCAclGgWdjuiNC/DhX3Yd9/zfgYskam508iJm6jZEdxb4ZlvKSFnWDwWC43Zy1i1v18jL75lQpYJkGhgjAPmoPfqs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24326e2a-e30a-400f-6f9d-08ddcbaa5c92
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 18:37:51.7938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhOmQcK3FyS84Etgn4t8D7sjZ/brHvFS1L+qHFkiLpPfFY+1BpYYqcbQip9lhe6xdiKfhas6mZyYq/LgPfFe9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4594
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507250159
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE1OSBTYWx0ZWRfX4bZtKDFrKXAq
 y/iDl2jwu6r2Dkl4lqDXoy22gAxyENdg8dFzKG3/ZOwCkKStq0xAZlpA3rSHrUSImIDBE5lcSRL
 cYpaA7pe/GclV/pJoCfkjXXWLVqjOuiMHY4FjCLNNzPgABoCOAxRa+te0Y28jQsviV5S5fxtxtL
 29eNFtTgAfCFMgEAq4HSGFVCs04XGXx4KvUmpfOVnHsi7Nrh/nOHleqn8tPL238AFTxYwOEkMXg
 C59L/MrPbJSbAH75owvLcE3ebx5Ma0ZKFXMdYCRuLhI159Oo1vH53+Fv6IMm+6Xc05PNlUcy4qe
 FWw9yvgndS5KxQlYbwJBo1oME8nGVkulDfFfwYuwCFtFi67oPA6dD6RndOLgRvcNcHbe9RZSLY3
 oQvoKELhOfOjc/YYDHat9MUhRyev5DERJ7MBMQihFuHbGY5/1MbnURs9uVQH5I7TMdUkIVVy
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=6883cf05 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=WSlMeqUyeZUimX9sISUA:9
X-Proofpoint-ORIG-GUID: hObYed43z0_2zSkMwllc4i6R2IRwAj5t
X-Proofpoint-GUID: hObYed43z0_2zSkMwllc4i6R2IRwAj5t

On 24 Jul 2025, Kris Van Hees said:

> The logic to perform a BTF ID lookup for a symbol did not guard against
> BTF data not having been loaded for the module that contains the symbol.

Oops!

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

This seems not to do what it says on the tin (though what it does
doesn't look bad).

It's not guarding against a module not being loaded: it's doing all
lookups in vmlinux rather than the shared repo if the module isn't
found. I guess this is desirable (it does increase the set of available
types), but it might be worth mentioning that we're doing this
somewhere, given that at no point does what is actually implemented
guard against BTF not having been loaded for the module that contains
the symbol :) maybe "push the code that decides which BTF to use down
next to the code that loads it" or something?

There are a few rather odd hunks in here, notably:

> -	/*
> -	 * Ensure the shared BTF is loaded, and if no BTF is given, use the
> -	 * shared one.
> -	 */
> -	 if (!dtp->dt_shared_btf) {
> -		  dt_btf_load_module(dtp, dtp->dt_exec);
> +	/* Ensure the shared BTF is loaded. */
> +	if (!dtp->dt_shared_btf)
> +		dt_btf_load_module(dtp, dtp->dt_exec);


If we don't have the dt_shared_btf... load the dt_exec? I mean yes this
will probably load dt_shared_btf as a side-effect, but why not check
dtp->dt_exec? (Hell, why not check both?)

> +	/* If the module does not have BTF data yet, try to load it. */
> +	if (!btf) {
> +		btf = dt_btf_load_module(dtp, dmp);

That looks good though.

> +		/* If no BTF momdule data was found, use the shared BTF. */
> +		if (!btf)
> +			btf = dtp->dt_shared_btf;

s/momdule/module/

>  	if (base > 0)
> -		return dt_btf_lookup_name_kind(dtp, dtp->dt_shared_btf,
> -					       name, kind);
> +		return dt_btf_lookup_name_kind(dtp, dtp->dt_exec, name, kind);

This definitely looks wrong. The intent here is seemingly to climb to
the parent (the shared BTF) if a lookup in the child fails, since you
don't have anything like libctf here to do that for you. Replacing it
with a lookup of dt_exec isn't going to do the same thing at all!

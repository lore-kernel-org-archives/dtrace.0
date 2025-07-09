Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED592144CF
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752078510; cv=fail; b=rOzXT3emoW9IAOhHohxUx9CNgxKgTQ9YGVDQmXl6RQM81114SafbcRBV69G0gEcAbzXtKYv+rigcjj6oncep1cOR5frL1vOMrn735fVUR9LPqyYVlbwxrin7c5hd0dC+SYbdSMOp90x3Iz7mhkgM0XoUCP5Q3o4C9pS0IrIR52U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752078510; c=relaxed/simple;
	bh=/8TY2V94IVJ1qeFhCdi45m80dFL7UIuzhiYpJJzacf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ev3FjZG1VezlWF7K8lS7/J4P8j/djaRsAktNKDvmLtqc8TjQ6vMldGIKW7p44d0bqmYXPOo/Di/a6u7RdemAmStLWLxnoQGdCCujyKH3MxzkIMuBJlRx3JIJp1WzK93/+UYXdWPygRxTxL80oxx+Xg7dFLHsX2KX9WwQhNjCD24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YhSKR4E4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gEhW9avW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YhSKR4E4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gEhW9avW"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569G7EFV003000
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 16:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=eer8cM5VIiDrdhCzwJ
	0Rg/AKiz4p9N6acD1zxkqeXv0=; b=YhSKR4E4HoGVrDCwOz+gabrsOm9A802X1t
	5HRVvlDakzd2cRD1No987LjfSDoNhG7lm2i2k+5OZ1SejZjtTQNREQ2uyRPxDB7N
	JSoJLzbkM0zaKOIzEKvKOs8x4fcgn5JiefgTd+xchD0+xZckphMM9r82irj3mGmC
	6/zry2wdFpP+uxAO04lJmCTNb46mBUeKga8LaqoXL/j4u671kLBZ03UpnF/fI0gK
	0EOvOk009RW8cJLzFugpNxG6JA5zcA8czkKfNQuiLDOs7tBBih0PJMk9oqlqWI30
	HLJ6hviU1vgngJsH2TsBmIFoTHG8dkVfm8g43ZCVAqjS8mfD8uqg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47sunm817r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 16:28:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569EoNRr040504
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 16:28:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbe52x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 16:28:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=su22oIRWPaLWKPD5mNceAsgtxbpdWSgwxVwV9RNqSWUJmpnIB0O9A58aN4k3VquR9Xr9gNK1QLUKtmebWyQonjTsog3sqyn03e+reP8unScSbS/86Kwy45qGEt8N58B+DTYGDw4ACUwAdyBB2BgEgja9TNfth+UN+JJSJmHrlbZbLJYhQL0ZbqTLqlzBYAA4ewMIRzaFU/969aYPxXUExTP3rsxBwCU8hB3t4Pl/t1hcxcA3DgNGwawNpt7gHoq1KNix8S0ioBClcg5LjOlb0qifVP+1G6vjs86IB4t3zvj8LPqF8eUm6UTtcWM1es3rldLy/HNBNcszn1ZLhZt0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eer8cM5VIiDrdhCzwJ0Rg/AKiz4p9N6acD1zxkqeXv0=;
 b=IMZF0r+txIV0JgFUvvqIeX8Wc2MTKWtR+9PX/an4uObBeLSznfn62sDGu8dos0u8AIjYRvblGbTxhpJesZbP+sNse46sguX717db2DjkH9yKkbTNf1B+x6d7BprAoMgUpXBravoAh+DeuHNfY2pKqlb5JnJySrZi5I6y3/CR65mARljNR2tQqjvPefw7LfywUWR4gof1eUbOVOGywrjQi/09iMrqG4OSG6TfHJC056kVtov2+tKeGAjuSI+233sUlHXBjiz3EDyRcGaeGOJfZBmtOV9RxCd1+KwgFFk2WsKz++wkwiR9Xpalj8d+h4/ekgEtI/32p/4+gbCOrm9gUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eer8cM5VIiDrdhCzwJ0Rg/AKiz4p9N6acD1zxkqeXv0=;
 b=gEhW9avWCHpAQbRnpI95ryB4YphjmVENn6H3xTZAzlqctc+LY83Rkj0VbCNsrNeVgQM7T+FLKpPVkHe4+asSSGE84YMAGhw/ts6+rz1BzdWFVqoqS2ri8TJPv7ymrrZQKSFbqpKfm3l3L1VjQSAIoPvuNBSZnL25wHjZK4fOD5Y=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM4PR10MB6256.namprd10.prod.outlook.com (2603:10b6:8:b5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Wed, 9 Jul 2025 16:28:18 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Wed, 9 Jul 2025
 16:28:18 +0000
Date: Wed, 9 Jul 2025 12:28:15 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 1/7] cg: move get_member() to dt_cg.c
Message-ID: <aG6Yn53shYZn9gVI@oracle.com>
References: <20250709144700.20591-1-alan.maguire@oracle.com>
 <20250709144700.20591-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709144700.20591-2-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM4PR10MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee13a2d-46fa-482a-d708-08ddbf059cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b1s2xw4aVm1o3PjMHnUc/0Pgi6rFx0iqwRZRoCFkQhTcWJIqKspA4wxAedCz?=
 =?us-ascii?Q?OYAaKO7FQ5g3jtxtpd0fuc7Hym5F8bk30jzZEV7aWakFUV9jH2XT5KcpODOF?=
 =?us-ascii?Q?j8raOEie+rkdvqcMaXbBgWBSYkAoT7w2C2x7B8LJGtQyiQnL4PExAnKkaubp?=
 =?us-ascii?Q?B/JNL8/ut78239btetu2iCoTr3ejyjt7m5dd5OlrXedcbBmsW3PGHwCRKe+n?=
 =?us-ascii?Q?T3trlTAzt40IhZYmuZ0Sshw+F6/pWcNUOCTdiHvM81Mq0gphBclQ8LAxvO/M?=
 =?us-ascii?Q?Hb10JFs6QGqTe+jZc4ZEpX9cEl3y6QqvvLEA3kcdJq/yGqD7xs/FHFO7n/1K?=
 =?us-ascii?Q?NsBZN1nc8EIHmU+mNjAq8w0zh0qOoZSXZvgX1W1zM6njNnJmwkj55vl/wSng?=
 =?us-ascii?Q?RemS7MHi/v5bRwlA72duYeQFFWkM6rz/k5DaCvlD19LcxiIdvZjtvOfzqhvn?=
 =?us-ascii?Q?L7o5jyPOjjvu9HTtltDKXdvp2K8LqbbxGGOjjrKq+AxwVJuz7x4aiONm0F5M?=
 =?us-ascii?Q?vANhLmSyMJVXMJfPpQNHVtKs1gY5w+W+XBjha7HnNJ9XpcqqlcMmBEctoIeT?=
 =?us-ascii?Q?xx+IX4b9zou3iF3KJx8kxV4iyUq/OCCNulqaVyOb/wuShABu7a/+NWJ6rL2b?=
 =?us-ascii?Q?rjm2eqbyaN3BYe8TvVOx7X7VWfPI0S+NLs8T6U8yRziT4RA1wuFrRo5nmQJH?=
 =?us-ascii?Q?ntZFvCU86pd/WMazDnSNKZP1wFMuJZF3/APfPHQHkXULj3q5yJLvLJ08Zlbk?=
 =?us-ascii?Q?h2iV7mBAkEJjBBMnBfmNbyo7gD8e5o3HSdHbPQU9cxb1BpNBvShIpv2zZZiF?=
 =?us-ascii?Q?HoxbkDCRifnWaQwTphoGWMeTrM6X/iF3BHq+Y2ZtqQnxlMW7WpPWz86tOTEq?=
 =?us-ascii?Q?U+B8MiI/zXiXawcknQP5ldm6giknpvW8zz8R+6gkKzAqNHOg9vCsTN6KYJjp?=
 =?us-ascii?Q?rXPpcpIR8O5maKlZoS7iNvHB99Wk17927igsFDD+uG5ZBN5IxT6G5bB/LfpG?=
 =?us-ascii?Q?DAgwWQIn4D0XPrB9J8O6VRkJEeiXsQce4Qnd2P22PFED+v60HwoKF64buo8o?=
 =?us-ascii?Q?8OHNhW9baBzy3IfUhmcfLyyuKpngIbUIGJ1bAixhsJ4iwrlOG/3A1n2bwnTk?=
 =?us-ascii?Q?5kUSpayes/3YlBfUDLUomQIw4iP5gRCLtCoeP4j3uhLFFKcelJDjxFvyGhsW?=
 =?us-ascii?Q?GwzmuNzUQGratSukWpmV1j79zshLyDeSbsI+MsCNMJ+5NuKRZGXr4k0jbF2G?=
 =?us-ascii?Q?+Ce3dD5y8HWYWPyFR6moR+i6tcXR1wF8Qkj6e7Ut6+Mqvp5MCMqysNf7tkKK?=
 =?us-ascii?Q?T5isgFeew6Fnx5xBsjVfYxcPThTA894b4lWwhn/+rOvaYScKi+4Y/Js/EmUs?=
 =?us-ascii?Q?x8B3xW9QDaMn3mc0iEkrNPgBu8H8p0TxFb+l1/E9QYFIs22Np8qlbw9A/ZDq?=
 =?us-ascii?Q?J/Qoo6zU+98=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cI5TOcwr+P7+vvzdPjfBynzyCIK28ccJqSaclWdyZiYFwPtEGgGaI1HxKq5s?=
 =?us-ascii?Q?91eWto4wajRr/aPcaSetkk4SoEU3bCXZJ4PaX1Em39EVe7xcphiOMkbCQchA?=
 =?us-ascii?Q?N32jDzvbU3sMyW8mU6L7986t64OU+VPCu2uNu23WF04NEqYCghCcqW9q/LDS?=
 =?us-ascii?Q?uK9sLtr2W8WteAqDlIAq7lOFMR2CUG3o9dWQxsK0HuCi7c65rYBTgk9kfBrW?=
 =?us-ascii?Q?WhmeV0Eik7Xcu5EVPDlsRJBntDgpeAChOZFt0Y9CD5pgUXxzqGU6oS58n86l?=
 =?us-ascii?Q?JleP4ybgmd8q9y3nFz2MUgIXucX0iAwIB3TeerCLu+pCwNYT5cqmqQWroEMX?=
 =?us-ascii?Q?Ma7flA3VYzS5yYtGrXkkVtWXUxItcKXz10Au94j/Ze6yL42eVjHbzbQuZdq6?=
 =?us-ascii?Q?189S+BPpvXRC5T0blT5lORPWikThv0ejWph3aECSLvf4+Oilh4fBK82vSYcf?=
 =?us-ascii?Q?WIl3E5EipiklPcdfrbgqdCmriLxExvsHGQ4bBUhOMlyhFhOrJ6CJpQo+pgh9?=
 =?us-ascii?Q?GiWMXiO+gd1achpLHgkXLcZto3xoUPQWVM3lpB38xeNXvePD0LZfKLy9vcQo?=
 =?us-ascii?Q?3iEpwAWJzxrsdUmCq3Rg1Guw+6wvOzdigamIbu2dro0D8V+nMldU/pM9tw3h?=
 =?us-ascii?Q?RbDSYbIhwOSICNXxH3ZcwXafu1A5lWDYMjx7Zw+y33AgmuvDW3iSXJbOxZLu?=
 =?us-ascii?Q?TJCyk/Z6W3yNTtjgCTbUjZNwb30VB2zyKZcletly7UkqyFzpLvQ1G3UcM75i?=
 =?us-ascii?Q?4gndBXa0Qijys4Rhv+z2154SWpDDIG2XNhRte1WUMGEDbk4KqwITSa8R1DhZ?=
 =?us-ascii?Q?sRvApfscixWJ7vK/ySAg4BfSCk43xxtghg9fUa6xS16QcXGePitFFswUqjLG?=
 =?us-ascii?Q?c81X3YbN/3sdXhUzMFY8oJqpmjMuw/FJiSQFJLck+/6zNR21iK1X+/WIYq2U?=
 =?us-ascii?Q?fM+FPPtcXkaTGum3xHqsJVF3rn6BWjy/IiREkYcyi1/tqwSzNv23PH8i5L/A?=
 =?us-ascii?Q?4bGCsAkwou3axcHz2xSzJD8hlHqRwsgLovDncKf3sdNptzZn7us7snHBwvzh?=
 =?us-ascii?Q?8AemJJM7J0aTYI+K7dkzzomO4RsMJSR9BWV6zuepOfKQwkv53Fnbp47eIHWi?=
 =?us-ascii?Q?xRvw4kWk+eiiEMsLxeOSY+S5U2+br9eQDr8Hq0lPd7VShFU9355lfjptEEkq?=
 =?us-ascii?Q?X+lI8mc8oB9nVUyaNoHlPoItWuqj5tBmkgR4GEhPKbHa8rHC9lQZ8qih1Vlb?=
 =?us-ascii?Q?/ynOlWKrxLyJXnyYhwJD+NBJIO2QyZEiJ8t+NkkaGFzzZhxqvhOCL9Kk6tOs?=
 =?us-ascii?Q?vbwBwyAUnPfSzvc3Jw1YyLYuEiaaRpG4qcyU/4F9Y3DSpLsIzdMBp0l2yO+0?=
 =?us-ascii?Q?q1IH/GPcTY6IeQvhyp/IGcpJDatwWJAMuhIThYiP0LdYpbAXer5fq0oZDVGD?=
 =?us-ascii?Q?3FDI8pTOjckIS7jviDcy+L7+6dFwP/PqBV1Ri8MHIrayG9RAoxjiLfT7fF0H?=
 =?us-ascii?Q?W4X9XjtYyVAUAP3pem87ZTxjwyNmG9XxZLEXVO66A4t6HGcyDn1FRPQ5qq26?=
 =?us-ascii?Q?5KlVUV84q9lVFVfnF0AGYLcld49fYVnBZ2Ff8FP2KI+8YvY4YuaVA8CF1Qg0?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L+FCVcev3lrhKdndABNbf86/eYRTeWZqzfdseYnYjvWYocrFgk6eh6LYls+JjfI6jmnFQ374dS5RontxQzfSDxqb6UOYqF53Y4QlIVv3j+ICmkItcp52BNwBGWV8JMD5dUVFs6gSf73ykbicIqS2KnySdm/Ac2Gl/UHNuEZjbujjJLyBUdhTe+IzSqwwAV4is3k6uf7Ni1zXzt+0FlwMkjUvpxqAaaYiwzsMjjfuWX0Yhy2IHPqmXOVrQFVzKffez9UHmNCAmeTjnd5XbSizGYoKxL24zBzd61Wz463rcc+cM2U7hoXnzbzr1u0ibXlequx/K2DLF6eXYBj3/f9ldPmST8aiAHiLaDizpIzNP31OrPOvVOqjCj3ISkUDTen1A05ADIHikgFu+k1oyVqZdyCL++QPpmMsCW0YJ7u14hv5YbVpk+N6xv6mZyRqvR30jEil9oDFJFUoO55NO7C62PC4K7y97vdNGerEZq2ifN2rTOKhcmNLoo3tt187Gc2tI5lja7L19bRggFQkmSK9+L+2pCegpx8QeMvi0AMlJftmX55NY9fDWINOIHOg6IpapAX2kW1zAnFirt8+mWEepVOERyOmUEr1CcXOTC27Zek=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee13a2d-46fa-482a-d708-08ddbf059cce
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 16:28:18.4755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OYVtr5Clk8rJEYhT0xI5lJBXyUxUDyFJGCj0mDJ/r8TEJ7OqMPl+pV7Bf2qUHpxousIGUl78fuKalGrEESZ2Ewqt+smn6j9D+HslrbyiMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6256
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_03,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507090148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE0OCBTYWx0ZWRfX0mTDb+E2HMce 7RRUVrpd3vQM6j0M4GVxbwP648ceBgmmsRHcJEZHyTHNcQRRk3tHlROpEC4GG0ggOK6aZgll1Ul d6U6wWHGreYB7Bf/VGXt5W+xI6+X1l7ynRdgjZs2PuIGUckkHp1yI9SJ/Pl+EfP0MHYd6yvo3bZ
 2O9vktuCa5FqukrxTsdcB9nRpyHD+V3NWfLLlO4UpZ/gVdYkaEQ65CG44xHwkr9HclDPaVa8XUK lIyeExl5x+QmzBf5QDbHMNZxvAHCt4rQyqSAYRUdzRDA6Uji30gihNFcsW3atDOZKS3QDGuTJxs NO/pwiNR/D+Cu+C29WD5ZHHfttkWBAr4xTRHueAR8BqVSVldzmoWJYz+gs9GiHFVJ81y5bgVBca
 ahko2mxsdmahQ0xjFLX9M9YDeTORlRG3EvX2gVnyPNt8iRimFmq1Y+0vUe08kq77KKY8gvZd
X-Authority-Analysis: v=2.4 cv=YN+fyQGx c=1 sm=1 tr=0 ts=686e98ab cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=fYTK-zj-QH8inAFsP6gA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: RWqtYqfCMJUOMapCDfRLN3fLsOLWk3E4
X-Proofpoint-ORIG-GUID: RWqtYqfCMJUOMapCDfRLN3fLsOLWk3E4

Some comments below...  Sorry - I got distracted by the other patches and
failed to give this one attention.

On Wed, Jul 09, 2025 at 03:46:54PM +0100, Alan Maguire via DTrace-devel wrote:
> It will be used by both dt_prov_ip.c and dt_prov_tcp.c.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_cg.c      | 39 ++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_cg.h      |  2 ++
>  libdtrace/dt_prov_ip.c | 45 ++++--------------------------------------
>  3 files changed, 45 insertions(+), 41 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index bd0763d6..d6fc8259 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1901,6 +1901,45 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
>  	return (ctm.ctm_offset / NBBY);
>  }
>  
> +/*
> + * Retrieve the value of a member in a given struct.
> + *
> + * Entry:
> + *	reg = TYPE *ptr
> + *
> + * Return:
> + *	%r0 = ptr->member
> + * Clobbers:
> + *	%r1 .. %r5
> + */
> +int
> +dt_cg_get_member(dt_pcb_t *pcb, const char *name, int reg,
> +		 const char *member)

Given that this is meant to be used from trampoline code (where we currently
do not do register tracking - i.e. we expect the code writer to make sure that
no collisions of register use occur), it probably should be named dt_cg_tramp_*
rather than dt_cg_*.  That also signals people looking at this that register
allocation is done manually, and with care, so we can expect things like %r0
getting assigned a value here, and that we expect that the passed in reg is NOT
%r0.

> +{
> +	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
> +	dt_irlist_t		*dlp = &pcb->pcb_ir;
> +	dtrace_typeinfo_t	tt;
> +	ctf_membinfo_t		ctm;
> +	size_t			size;
> +	uint_t			ldop;
> +
> +	if (dtrace_lookup_by_type(dtp, DTRACE_OBJ_KMODS, name, &tt) == -1 ||
> +	    ctf_member_info(tt.dtt_ctfp, tt.dtt_type, member, &ctm) == CTF_ERR)
> +		return -1;

The dt_cg_tramp_get_member name would have me assume that this can get me the
member of any struct, not just those defined in kernel modules (or the kernel
proper - which in DTrace terms is a module).  So, if the intent is that it can
only use structs defined at the kernel level, then the function name should
probably reflect that.  If not (and that is what I would prefer), then this
should do a lookup for DTRACE_OBJ_EVERY, like e.g. dt_cg_ctf_offsetof does.

On that note, perhaps it would be easier to extend dt_cg_ctf_offsetof() to
take another (optional) arg to put the ldop in, populate that one if a ptr
is passed to store it in, and then use that here?  Because you are essentially
doing the same lookup, you need the offset, and the size, and so the only
extra think needed (that dt_cg_ctf_offsetof() could provide easily) is the
ldop.

So, I think dt_cg_ctf_offsetof() could become:

dt_cg_ctf_offsetof(const char *structname, const char *membername,
                   size_t *sizep, uint_t *ldopp, int relaxed)

and instead of:

        if (sizep)
                *sizep = ctf_type_size(ctfp, ctm.ctm_type);

it could use:

	if (sizep || ldopp) {
		uint_t	ldop;

		ldop = dt_cg_ldsize(NULL, tt.dtt_ctfp, ctm.ctm_type, sizep);
		if (ldopp)
			*ldopp = ldop;
	}

and then the dt_cg_tramp_get_member can just use:

	offset = dt_cg_ctf_offsetof(name, member, &size, &ldop, 0);

instead of the lookup above, and the dt_cg_ldsize() call below.

> +
> +	ldop = dt_cg_ldsize(NULL, tt.dtt_ctfp, ctm.ctm_type, &size);
> +
> +	emit(dlp, BPF_MOV_REG(BPF_REG_3, reg));
> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));

This would use offset.

> +	emit(dlp, BPF_MOV_IMM(BPF_REG_2, size));
> +	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_BASE));
> +	emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
> +	emit(dlp, BPF_LOAD(ldop, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_BASE));
> +
> +	return 0;
> +}
> +
>  static void
>  dt_cg_act_breakpoint(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>  {
> diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
> index 81b79399..36f587d3 100644
> --- a/libdtrace/dt_cg.h
> +++ b/libdtrace/dt_cg.h
> @@ -44,6 +44,8 @@ extern void dt_cg_tramp_epilogue_advance(dt_pcb_t *pcb, dt_activity_t act);
>  extern void dt_cg_tramp_error(dt_pcb_t *pcb);
>  extern int dt_cg_ctf_offsetof(const char *structname, const char *membername,
>  			      size_t *sizep, int relaxed);
> +extern int dt_cg_get_member(dt_pcb_t *pcb, const char *name, int reg,
> +			    const char *member);
>  extern uint_t dt_cg_ldsize(dt_node_t *dnp, ctf_file_t *ctfp, ctf_id_t type,
>  			 ssize_t *ret_size);
>  extern uint_t bpf_ldst_size(ssize_t size, int store);
> diff --git a/libdtrace/dt_prov_ip.c b/libdtrace/dt_prov_ip.c
> index c4a3a6e2..37f91e3d 100644
> --- a/libdtrace/dt_prov_ip.c
> +++ b/libdtrace/dt_prov_ip.c
> @@ -62,43 +62,6 @@ static int populate(dtrace_hdl_t *dtp)
>  			       probe_args, probes);
>  }
>  
> -/*
> - * Retrieve the value of a member in a given struct.
> - *
> - * Entry:
> - *	reg = TYPE *ptr
> - *
> - * Return:
> - *	%r0 = ptr->member
> - * Clobbers:
> - *	%r1 .. %r5
> - */
> -static int get_member(dt_pcb_t *pcb, const char *name, int reg,
> -		      const char *member) {
> -	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
> -	dt_irlist_t		*dlp = &pcb->pcb_ir;
> -	dtrace_typeinfo_t	tt;
> -	ctf_membinfo_t		ctm;
> -	size_t			size;
> -	uint_t			ldop;
> -
> -	if (dtrace_lookup_by_type(dtp, DTRACE_OBJ_KMODS, name, &tt) == -1 ||
> -	    ctf_member_info(tt.dtt_ctfp, tt.dtt_type, member, &ctm) == CTF_ERR)
> -		return -1;
> -
> -	ldop = dt_cg_ldsize(NULL, tt.dtt_ctfp, ctm.ctm_type, &size);
> -
> -	emit(dlp, BPF_MOV_REG(BPF_REG_3, reg));
> -	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));
> -	emit(dlp, BPF_MOV_IMM(BPF_REG_2, size));
> -	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> -	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_BASE));
> -	emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
> -	emit(dlp, BPF_LOAD(ldop, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_BASE));
> -
> -	return 0;
> -}
> -
>  /*
>   * Generate a BPF trampoline for a SDT probe.
>   *
> @@ -142,7 +105,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  
>  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
>  
> -	get_member(pcb, "struct sk_buff", BPF_REG_6, "sk");
> +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "sk");
>  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
>  
>  	/*
> @@ -150,11 +113,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	 *	skb_network_header(skb)	=	(include/linux/ip.h)
>  	 *	skb->head + skb->network_header	(include/linux/skbuff.h)
>  	 */
> -	get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
> +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
>  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
>  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
>  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
> -	get_member(pcb, "struct sk_buff", BPF_REG_6, "network_header");
> +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "network_header");
>  	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
>  	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
>  	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
> @@ -168,7 +131,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	else
>  		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(5), 0));
>  
> -	get_member(pcb, "struct sk_buff", BPF_REG_6, "dev");
> +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "dev");
>  	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_0));
>  
>  	return 0;
> -- 
> 2.39.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel

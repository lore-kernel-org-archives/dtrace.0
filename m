Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2026F15749A
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877473; cv=fail; b=R/iRDC07ybU4VCb62xMUf+LQe03cwU5f/JewSeiFpulC6zAc9EJ9uBcTz2cWeSfbjG+uYdTzSOQG0LGmueqJVb6y8Evk911v7ZNZlRnXB4F5P/gDImpAXColBOFoEd9znQFx20ZXRFcUzzE/TcRgydjfdOXFHxbwaHUnw7NHfac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877473; c=relaxed/simple;
	bh=tDZflfrchLh6EBH2lrUC9hOLD0o2wxsxx9IEz0+/nvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hmDc99qOpIP0V9CkFo6p2B7lPFZub+y76DOqMScqGmEz3KxmOM1FjegR8j/5YSetOwDy43HKQyJH3jzlEorxfn8hZDMSHF8rJO+QdmxUa9TStxedYCn8tGrA7ExzaNXiJ56kFBNylQ4TO0+BNUuxPmOL6SmKeWhMOAQmPt/tPnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fhF9UO2f; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T6ueMv0A reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fhF9UO2f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T6ueMv0A"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJXXte011943
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=Mxg7QsXm+VTk5FoJSuUor/HOWTramGeQmuu5wz53xPs=; b=
	fhF9UO2f2YltLOeMhjKZ0kSUMsB08QEO1rfiS4jbuO96rL0i+3uKkUZKAzrRDW8p
	Dvn1G7ynm7bIrh7BYWM19lK2nNi7fDM1S5KGkVMYiJNcb/9q/YgaHbN8HEfZyoq9
	Y05QYZGjTZ7ub138LvEUbmcnyg3gj7VWN5nyf1mMmL0aaa04+YMUTUOz5WRmPMPn
	hxcEyP+bTbJcL5KHTzlo7pJz2yda1eELAgZavA6Vk991rH8H1jbDQDc2HOFp+x76
	UIS/3gANthulQjQLtmsNK81G+LZhzsLrbnv92Nwstn3XfMvP7oqmuRgy3Ds4oldp
	K/pqMwCqSTeAE1qYfObfxg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pus28ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:37:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47SK1gbi034678
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:37:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189sv1yh3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:37:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtRYihQ2D/ah4nK8Y5MKt/CjTO/v/52AN+ASYs53IgtLEO+x9Yn5JQbhdTbdeukQlFUruqTkqjUlip3dPxf2KfPNDOyzUh2VVbqCAx5i6o7lxA9Rh6tK26jHgqixhu1BrYy0NTikZjTHEY/OqsO2+2J9MTWBlw8Bd9tgZBVLDPx/vN6oZtNwSmuhktVRjHlNEtop6FRyVHx0JriBeZQahgsyvaLxWPl3eIDADh5vjZknG8HSDJ1Ok+TycAsKwVBdtHT50wHiBYknMjMkkRZzB8ZX8nBFpCgnBmpYbBftsjjw4U+oLxZwzNzHG+Ld9hH6soeSKLgI3N/h4rgQ2L46zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFbfDc+69Bt83wLzYQveCT3rdCnt2SKIWPKKOw/eKhU=;
 b=xKXoIqr9Ozn5cAc1jciGZxRj3O8/rvIOfhFelToGUOuW+IDzK+9oTYnYzI/6qiHwyou7q8ZWfeanm9JvuFHdAKly1meULu5hb+iwamT3A1lI0TvpBusKml+o37mnTU9eKAbv7DQJm3YT9qf0hHaZnO5y+YNsDY4SwTVc1LLuUjvD4z9UpsiXveGGqTJ+ucDmP/gouHPv3g2YLxYd+0uzNhdBgjrhaARm6cI4v8N1DR6pyvK4L9fqHgUSD7dmZYXegPh9cKjYx4cFyHm5sGIwHTeDM6IZJYzWICdpTZ2dBRm3qRrteSBCORzYXD9EZGHzNb/7xeGzocRT33PLqXYgTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFbfDc+69Bt83wLzYQveCT3rdCnt2SKIWPKKOw/eKhU=;
 b=T6ueMv0As/fX9AX+CJibOk9PMyoUbvts+gfuvS5y1zw2yzAydiTFpVf4oAno0Lkv0/jccMpVnt/ThO2s0CJtzhU/4sBs0JxHuhpOjvfQfRRHKV4YuN/gUy3adFT0KQi+PvQJjUJfFxdGJXEEGiyRdRzJ1/a9tsJktomg+RmyVuw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB6400.namprd10.prod.outlook.com (2603:10b6:a03:44c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Wed, 28 Aug
 2024 20:37:43 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 20:37:43 +0000
Date: Wed, 28 Aug 2024 16:37:39 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/8] Reduce stack depth if kernel returns
 NULL frames
Message-ID: <Zs+Kk3/VUrNnxSNs@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
 <20240604180008.11331-2-eugene.loh@oracle.com>
 <ZsPVqitlZpZp2lcA@oracle.com>
 <4098cfc6-ce97-e8e4-28c6-b5306c23e51f@oracle.com>
 <Zs+FzkKIbqs6HSA6@oracle.com>
 <7223b095-bc2d-108c-7738-584673676e6e@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7223b095-bc2d-108c-7738-584673676e6e@oracle.com>
X-ClientProxiedBy: LO4P265CA0219.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::17) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6fd77b-a892-411f-d52c-08dcc7a144a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?MqFldpE3ovZEbFJaJdV8lLQ/fkLTR7HjAtBBDVYK24MuGIzsJYW15pNccr?=
 =?iso-8859-1?Q?/jrlVHwVZOBYoNkIwk1M+TYUIweBlhQsAAsjjJ+50Yh7y0pAoYBHEZaxlO?=
 =?iso-8859-1?Q?uCwhWiyiBT/er52iCtkMOtNZxyg9MARzOTclSqVnG9pKxcdlfcupQJwYSF?=
 =?iso-8859-1?Q?dZITf3DmYQTC79asHVVqEbat1NwZzzKcw3gXoSQDGrlIOFk6/Hb3LDksDV?=
 =?iso-8859-1?Q?AXsiyBhAvi8QVgFS+EcVU677jabAamhzDDHOnIY+1vC1+B2NTPLKL+bqWr?=
 =?iso-8859-1?Q?4VGC5CZ1LBc47u468/8sDXpHq/hSaRaas4TDxf9MBywCfPiYAG+gP9Oxox?=
 =?iso-8859-1?Q?MCn3UTFiHYB6zi98tylv20eqxVr+Axf7tQQMBGE8ixA9LVZ5SfgLRxqwtM?=
 =?iso-8859-1?Q?WpElDY3pcCH3Bmn7tBmyOSFM+QOD7ISeUBRFYfjyw/ZtYPXCVnypSCm/tX?=
 =?iso-8859-1?Q?AgYx3wzXeNk6bTBjxPm7Ok48NrLdo9a1wwx6XSPwNYOy2lbYlxcjttNobP?=
 =?iso-8859-1?Q?FiqxiphwWzDTMrb+lYBZGfyQqwyGAnXboBBrg2xzMFJKSDPypZT3XZ9m0V?=
 =?iso-8859-1?Q?WQvcD9IO0uJjzyt61Y2Sv4jCUGkbcdFjvitaNWBGdZBE3uQa2sN27gYall?=
 =?iso-8859-1?Q?CDz+FZdfq6T2fDX7Iu8MEtN1zfx9e78eXDJITR/nEGJrQ4edtJTvUMKKI4?=
 =?iso-8859-1?Q?bc4v/QHLuJH0guPZ7IZ9H9Gz0Op6hzbhJIeFbUfLwEgGQ/KLtE0RahiX4x?=
 =?iso-8859-1?Q?3cNpSeNSStkaYTf4x5DXs18lQsuK6B/B9UqI0qUyd85oiN2vEf1IwLNcZ2?=
 =?iso-8859-1?Q?2zLVBt0BFzeZan3/AUITZB2eEMIrDrTpFoRkTIkfqQup4VKCZZAQDkpRHb?=
 =?iso-8859-1?Q?PULX5lkLwiLGYwU31DUNvXnImVDCS91DsyvoIbareSY4Hz4eGTN0GgYRxq?=
 =?iso-8859-1?Q?NdR2YD8nXKlEn+sqD8vO8nxPF4JMeA5e7DFlLLlV9XoMajMMwashA3IJkI?=
 =?iso-8859-1?Q?0EKOUz2ysHk9vHTjUghswsBfvbmmxs3nVc7EDm063dnh1i8F4HZ02px1V2?=
 =?iso-8859-1?Q?hImRumjeOumpk7L4FOxXdIbZkCVZJfksyn+U7QKwT3YZ2FUkCzcr/tM5Vs?=
 =?iso-8859-1?Q?tTZdEPLGli+6TSuHkNvUcTqoVYmS3THFQr0L1sNmvCNLdCeR46pb4GWPLY?=
 =?iso-8859-1?Q?kyGQmuLq0OpR/NlSnSmi1ROYoHZ6c4lh9enbdZRgAcR/Ytmg++quhCPZte?=
 =?iso-8859-1?Q?7CVQVy/rWGvZT3cpTuxYZQNYYa8Ej0qIaqTKsqeQh88YmokOuEo9WuWuMI?=
 =?iso-8859-1?Q?rcRlboZqDLkVE7GXBtgPfTlXSGbQH6Icc1WWAcRF/OmKvFXGQkzmi+k/ak?=
 =?iso-8859-1?Q?5slDFFkD7R76QWkNkU5TPYsQG4dpB46w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?HxA8jjkCCJoMjx0uAFgSGNkmR7wayCN+enuTIi/WnreePstnsPLJN21vFW?=
 =?iso-8859-1?Q?a3IgjTPWL/+zQDJ3hKl1EexziFQHm/0R9IP2YPV8vPXTmJsBO3MbGWsvf9?=
 =?iso-8859-1?Q?pzVc/7IcCnhhNH/OQEZ2dLL4ZEGOFTj23ombXmUfnJKEINu/NbbzDGObyf?=
 =?iso-8859-1?Q?NkibVd71Lw9gAbp3ga6kO3ADIMe5F2I5vuHgjO9LIvsJHmzO6+GHsqfGqS?=
 =?iso-8859-1?Q?1g767z0hvnbg9JVuRbSHMGwLsBvtWFlFrWITGHb1yosEw+3+4JREhCK3GU?=
 =?iso-8859-1?Q?qlc90tSAv0tRrpnb9OjyeKSgDHXaEn0VKsE4Jof27TagiWqA3xWXEY06pQ?=
 =?iso-8859-1?Q?9fOWvffyFeVG1CUyTT/b2Xh18Pe1wzPzsETpX4W6kXjnQIbK/ZHgeoOgGX?=
 =?iso-8859-1?Q?/+cdZNT4cfMH1lnZUAEO0H0Fob2dTCm/Nss4eOepkhyffTuoEhJIptuY8r?=
 =?iso-8859-1?Q?7SPZYhgbvYeiKU/qN46gGxsDTeV/4EEcnkAVTfV6vHZ5As7Adm/bCY6H9o?=
 =?iso-8859-1?Q?gH5dJGsNoOhOUcq+fsK67vtCPU5q9RV6ugia5hE2a91wWr5ahQ/llzQeWH?=
 =?iso-8859-1?Q?hbGSczAsHWE2QD8HDH+kFxdZe+/q2hVDqdP6otTzam/ZjDangteaoL+nIX?=
 =?iso-8859-1?Q?0zLPQY96FIQHa/F1Nm6z8t1Roqu1n/WYHe77R9WF3+UjNGdlwUyzXQWv5l?=
 =?iso-8859-1?Q?WZk8t8jMJxu5GIcE05PTDqlSX9+8D77kXQA/KQCPCzpYVT8AIWTynV8/Ou?=
 =?iso-8859-1?Q?ZWK5jvfPQjqMwdCHGyWyzkUopW17fcAHM0HMZBxazmZ2OAey/y8DW+zV0J?=
 =?iso-8859-1?Q?sC2P2yKOWOXPNWYzN3MexBY1m0Oa5YxfjTQVAotFy9/GRW8kDNMdQNlPx6?=
 =?iso-8859-1?Q?YFd43n3jcge895CNDOj7pZfvdWWo8Jp1EBvscTJDtNTzc3Uce/wH2idtYa?=
 =?iso-8859-1?Q?49e8IyDoadglMY5TplnT3kic88oz47I0dgm+0Ihd7EB1TUQZ+pbiHM+9B6?=
 =?iso-8859-1?Q?8Si1U3cglyhc+CMTJNIX6cH+d3J3sdi9cRgBfP3KgD/lRjCSGktqIWFhH/?=
 =?iso-8859-1?Q?7PpJ8J45KRoM3tczxQUw5wm9T8MtKNb1wj1y+w2a6g/HK3JT4iC1L7M18j?=
 =?iso-8859-1?Q?9EbT8DRGxXJlI7EZuBGlngkzwg8gMCeE+DjJxs0r7Kf4breUjuyzA8PZMM?=
 =?iso-8859-1?Q?u4Ieqoe3N9HzlfFFbKkY7AquzQLbmcEOcrZW5y25xURNlakbD6ash5ZdCY?=
 =?iso-8859-1?Q?NOVZUzfufq1XfcpBjsdoYqllHp8iqF2iiRkbrhDmU0uucAPq2j5WnYpVcq?=
 =?iso-8859-1?Q?s4zA2cM41usBk00MUfZuDwEBEDsX0borrbHs1wxOMF9IJQQNzadFA4ETHJ?=
 =?iso-8859-1?Q?IgVdNdsXXqiY6wlU3bi2iYimwjo4+8RK3gTBOwYSuD5qDp+wQfXMGMGfmn?=
 =?iso-8859-1?Q?stUjnR7mFirQ67pCSg5OdEhE29iiI/BFWZ1szJf2W+fZPRx3w5kHUxRqaq?=
 =?iso-8859-1?Q?cqeaz6ojSARM+GJAERTCxePtl3h2q8HG5Vk8KbTJkdq0N1Lw7VXROpDcwV?=
 =?iso-8859-1?Q?kJKabU85zJ3l5sVCeBKlu4f/E6FY2i+tsplJHMln5HIRkbPDALD30j+RKN?=
 =?iso-8859-1?Q?PKVoNx6dqj+oHNK0MUJohp3v8GJpC0eQ9wbWGX3QOPAIyfeyKOLeGWlQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YGbdhN3eW9YZVmnBLDO2oUIO+4ehAyuMsaKSsWT2skKEaWKv9QbO1BHVgys8pXXr/CrEHFAatzDbPe7ScF1UB+B9vu1bYuAYDqwYSGYcgiLmSjy2O9BBODLwDowczu7e4iXXJeYvkpiEFsIucXaHBjPHD97pabMvSu29kMg9gAZo9K5Xie/CqIHiId++DTMeQ42ZxLaeWPMF6kpJm8cdY0rwUa8gIxE5Fw30PECZ9luu3vVFZuRe7TST4fr3A2r1gLu4jKWvb33ELylCu+L/qpx1pJ4GlfbHhIxO1sSxHkYNbkq9eDq6CaMG4OylC6wE7bcGfUhltmXS1xmCDao1SEZ99Vaylhp2OLiBoHepucQZa1Ig+OXpzOmvw+Mhzl6mPuHZq+Vc+3YX3t3L8wBZhiPx/BbYK8c/GsEMsrYNqVBzCHqWr42twEyWQ0o8+WL4WvTcK6igP1PXnt8XVWmEvN2mt8rEob54v/HfEPV/+5EvlMPyRXnwKiSAXHQjK8AMG4wgCQJNAi4k3gSwi+4hXnjFSk02Jb2XBwc5gwTsVxL6o8usmGTMDHkQzkgtzVzbX64ijimQZ/7T/Yi++QQsvyG2+s9vtgv7Gfpr0L9KIrU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6fd77b-a892-411f-d52c-08dcc7a144a9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 20:37:43.7109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZA+mAd5Mbqt4cuR7hWrM4JAdBeG/XggycWyYfhBNlGkj/Advy6QinZ9tGreLNhrydLScguf5QK8aSkx4jAW56lUXjH9odXCMpsqMv9pixY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408280149
X-Proofpoint-GUID: yAQxQSQ5y9oUrfCj-URVeU7YDRqSZrB8
X-Proofpoint-ORIG-GUID: yAQxQSQ5y9oUrfCj-URVeU7YDRqSZrB8

On Wed, Aug 28, 2024 at 04:23:09PM -0400, Eugene Loh via DTrace-devel wrote:
> On 8/28/24 16:17, Kris Van Hees wrote:
> 
> > On Wed, Aug 28, 2024 at 04:11:29PM -0400, Eugene Loh wrote:
> > > It's been a while, but if I remember correctly it's actually just the other
> > > way around.  That is, to make stack and depth consistent, we're forced into
> > > this "depth reduction" patch.  Put another way, the stack simply does not
> > > include NULL pointers -- there is no way to remove them.
> > > 
> > > E.g., let's say we have a buffer of 8 pointers and we ask for the stack and
> > > get back:
> > > 
> > >      0xdead 0xbeef 0xfeed 0xface NULL NULL NULL NULL
> > > 
> > > Looks like 4 pointers.  But we don't count them.  We just use the return
> > > value from the helper function.  If it tells us "4", then everything is
> > > consistent.  But for some reason (I haven't looked at the code to figure out
> > > why), it can be 5 or even 6.  So this patch bumps that value down -- to
> > > attain the consistency I think you're asking about.
> > So you are saying that the number of values that is actually filled in is not
> > consistent with the return value of the bpf_get_stack() helper?  That would
> > sound like a kernel bug.
> 
> I think there might be a kernel bug.  For a variety of practical reasons, I went with a DTrace workaround (and haven't looked at the kernel code).

I'll look around to see if I can figure out what is going on and whether it is
a kernel bug (which of course may already have been fixed in some kernel
version).  In general, we should mention in patches like this that it seems to
be a kernel bug (or first determine if it is) because otherwise we're going
to implement workarounds without ever making sure the kernel bug gets fixed.
Or if it is not a kernel bug, we need to look elsewhere why this goes wrong.

Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E1817
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729281520; cv=fail; b=In+CkMz2Y8dtLBCMJDvWRunvHPy9Dh/pUNwsuSxBYvP8Ug6Xjd+DK0Zh5fzNlBidYj1LX35ohpoj1w2MHqvsPXHZXwVh43ZmeZV+dyNw26bUrcSOYc/0W/isY+nNchZPZ9kp+piHd05lhtFLItzkjlVPNb/9SW32+xGWEOvcD7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729281520; c=relaxed/simple;
	bh=RDA26DkTGGJfOZzuQjrR5Hu74ZRyDKIOjJoTmhvf5GM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KDqQfgnDfGBIadLGdRnudZ8vCbgHyyTof8YOXVPSx59wjBOuuAmHOyA+FFvh2ABHWFy6QlPJ/FvvfdVJddbQy2xTtBQbg5If6WiM//oDZpGMx8Vzsl2WYKHb4LwRk4u+MmiVq1QFHvzAglqV4lt10ldgm2APV30yrJ8bYZ6qE10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Tpa8gHb0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yn/kDuBa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Tpa8gHb0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yn/kDuBa"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IIfkG4002279
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=uSXK1XAc3+kTJEIohdi14dT0O4M93Oyx7ThVlOTbQZE=; b=
	Tpa8gHb0eBTWG5z/kgLQKd9Kn6mEuL9icSzn0Xu+HeRV5xxpDh7Mr/SunT9W4Mz9
	2nbJm6ljUmb2yyBO/TuAo1DO0mPlj78GuDiWBf1KHpv0nF90KlwsEHuMtDsCkuzg
	VnMCIP15t0pS3mFD0ritpI7LyfhAKBPHgior/JZ5ed6KgmCy2+dNBc5p5QmI7pJy
	Tn1WUexqb+/GsrbppFQ2qYpNZD5y2OeMV2N5pfwKDs1hE2tbp9AWy62HLF9MAIJQ
	PonJY9k2rQ7q7uSGB1JPo5wV0vN4Qh7BxsvXEUjTcJpl7ZP96QPNSYUttROVxBdO
	pp0BL6hrt7jaurRsqG2MrQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427gq7snpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49IIP1w0036038
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:35 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjjk911-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtYr5cLnYmRSc+sdTL7wKvDJ3zH2pQiiVUFxke/zflihkXB3U8hRnZx67tT9JFDR/utVIgiew1l+F/y0ql+pnVn9HD43S07eQeIwC0g8v8yNEi2CkfGGcTW77oeIHhimtBUOsQBuvzjYxBjNAX623ARWycxrYQcqN6ctiw8hL23Od4PIsmdYbrpo8Bg4TsP/GcDqThFkBAj/bdEM6pjobPQ1/BRVY3OpwOjUiOWi6C6o8lnSR6Ozv8Pb1mlRoxqAP0fKcVOpC0hfN6Ir1zkbSv9KGOrcV0gsyVOs2As8vbnXmXvWP3hVxNH4dE2h6maFkFl1tTXQgWlZDumJyWzVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSXK1XAc3+kTJEIohdi14dT0O4M93Oyx7ThVlOTbQZE=;
 b=JzFkR5AOFg8I6EvzDly7oD6ykcB5Z8ZZMmofKg5ZuQr+hxWuwDxyXHY9k5W4Wc9HJ8QkYyGjwIdsZuEVWIHwFsR28xXcJ0y5+0Rq9+gt1Qe54ghGCsAD6ZLI9eR7Z9WMAdyWnmoM/y4ReSqmYH76N6M+JL0KzyLtPdrSIKMhs51tAuKaS2W+DBlGzV0X+KXaXWPdu1M2dPfFizBNyaF2ShEH2qCtvpKH2qQHo4Jo3F8Jm53P/rvO1ZfU6OL+aNJBw4y1yb5Zcu6Rg6wY+T0ilXYGWgQhJLPjdfPw6elKtFO5AEkUo/aq+nlsGyZfpwckyXutv49UV4X7spXESqyCTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSXK1XAc3+kTJEIohdi14dT0O4M93Oyx7ThVlOTbQZE=;
 b=yn/kDuBagtfpdR1L/c8Ce/s/2r/q+Lkzc7wrTlaae7R/sHM1AyXC3XI9X8PBIOVFhofrJmoVVYL83Ie8Z83t/yZXm6Y1UQvWScN7eFkG7Q/gwnatTK4ZZROPI5MO2EGiG/KlkZDmnt/FzPf9cArWZ9zFa82QO/Zx2mKZ+iY+ZF4=
Received: from BN7PR10MB2723.namprd10.prod.outlook.com (2603:10b6:406:c7::26)
 by DS0PR10MB7202.namprd10.prod.outlook.com (2603:10b6:8:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Fri, 18 Oct
 2024 19:58:32 +0000
Received: from BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac]) by BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 19:58:32 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/6] usdt: typed args and arg remapping
Date: Fri, 18 Oct 2024 20:58:07 +0100
Message-ID: <20241018195808.270688-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241018195808.270688-1-nick.alcock@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::11) To BN7PR10MB2723.namprd10.prod.outlook.com
 (2603:10b6:406:c7::26)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR10MB2723:EE_|DS0PR10MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 118fab56-fa7c-49bc-8b07-08dcefaf3e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9VspZQhIAvxk+f1hiN3BZ0zHGmIgPs+BwdJok10E289fz692MNbX6ejJKm6o?=
 =?us-ascii?Q?vTtLegrAq3lp1Weo3+/+kcXBBd5xfdD5K7pTfZkBw7vnIsSvMul+O5UWlj5c?=
 =?us-ascii?Q?YQhsXOnLlkSX3uQeaBKANhy5ozBFRKwIl+oA4uJHr11iF8Ao6J/JaYVNujak?=
 =?us-ascii?Q?kCSDMhG6yfhf7MbpWtDAN2ot17bWaPHwssTdYOqKeqDXaWs4WT4S3P3wKruj?=
 =?us-ascii?Q?P9ORBCOQQFXVGLE7HwEyMiPW/YczBCimF17Nc17TqvkcbSg/A/uK2NGYIW6f?=
 =?us-ascii?Q?+726Nd6aY5ojpi8vEOIGHJ1cuc9RxQ2IhPGyCJW30vSkVuuYCY9z4kT2t6dN?=
 =?us-ascii?Q?+VhTma5y7kCWGbRHHwzUMYgAjyexhR50mgUtVAKliCwSmimNyCkyCJTBsC1x?=
 =?us-ascii?Q?/T5nfevsc67jO+Zla4yk30rVoowQ0eIZNyqITlGraZHSdg6jRVVwajhe29dV?=
 =?us-ascii?Q?85yBx3J/RVa+onEyHdkdSQrqVy5Qe/9P0A6duLRLNdtMX6qRduN56tpI0d+D?=
 =?us-ascii?Q?xigZiYAxU37q/IHYkN1nUDEmG00+UghEgmbsygSrrv26MyJi18jynxLkiyOl?=
 =?us-ascii?Q?ADD2QSfTkp6lyfFxJktca95WDG9fv+TjXeu0UDhzdINoJ+utnlDL1DkE+s/i?=
 =?us-ascii?Q?L3btqAnPX/TEuioEGnx/KmBB7Kf42Wpf15/u0jYdHhHoWtIaCWiyxEODoyBX?=
 =?us-ascii?Q?bUC/Uh0gO7l4LcODl4Dax3rDOTvwh6IKr8nBSNDwEDWynPNsbIWfyLVih82s?=
 =?us-ascii?Q?RTwFo1SaGJpx0yijrbazw8U7e8f7BEzOuMqar+cfrDPaWwpHD4pjd4XF2nmj?=
 =?us-ascii?Q?ZDriFBETRsdAgUZTDWBi7MQaTOZHMZDD3eojvOOl/S/JiOTa+I2WJezE8iTz?=
 =?us-ascii?Q?e7bAhDxcpzUZdI8r+/Ejdq6F5niK/dYyHxgQYvKUfl1LvRHtfy09wnptWiDL?=
 =?us-ascii?Q?90UZj731aj2kqyxmSA0eyhyOcBZ+zR9VsgkBP7NFpfC6ZH8svGBrAksFb35Z?=
 =?us-ascii?Q?6/ob2v20QgEyKISvWmrZixjdCsegoKauGR6RII9MGikdtosQ0TQ/8Ruzru6F?=
 =?us-ascii?Q?lxsnK7a8frX5QNtHKopeUDag136VDqFZFF1A0tD3s25LSoSALnrbSVq9ou2y?=
 =?us-ascii?Q?DHI7NhjERb6GyYNlhPJTSQOzpHVCEcCU1JZufyDt/R1bATXX4igOlVINgUuB?=
 =?us-ascii?Q?TVjOcSYAmX740+o0A8eN5Rm1O8GuYe5UJENiPkDpRS5vHm9obSaAwbnPJQmM?=
 =?us-ascii?Q?fgxtwEnEx8p+7fLI3HGlXqJMQ3mMqxyLxlJrBdnPIRZVYhmRQ0M6PPcM7YX4?=
 =?us-ascii?Q?W//eeihfXJomTDuCG6e9dzXE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR10MB2723.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0qRf2+oETCZPp7JNNiaDH1rCC7l9Fbuvail2irnqlyceJPTZlnLOk47asCbL?=
 =?us-ascii?Q?pZQSzLGncwtNDbmHi47UXpTStihcIY2LkvIQR2KyklEczJosIhiQUex3SR3u?=
 =?us-ascii?Q?reAn2xBPAnbsMP5H9tKFzuu5kkSB5xhJTvvqMxs4rFgYr+XkmOzNnUdRUZEH?=
 =?us-ascii?Q?38ULN+EX4Ozc3yq9HNO4QN9Y22iCt3f3dO3o/s9z3g6eJRLiT1XDWxoCwt65?=
 =?us-ascii?Q?E7WJVp3uu7cdB71u/dN+uz7Vn8ABixSHIXiWRuzAd9u1meQAlWEOYrUvcadi?=
 =?us-ascii?Q?ligq4EvZTDGyW9zxlVmRxi7jjUVqM9ZnRtZVXVVScI7c1W4fDpNjsHB8lOCH?=
 =?us-ascii?Q?x8TDhCJ6rklB8cIz5FOQY3D7ArjSL9G80+VC6DaawESLEOPbHcMjj4Rhm+fk?=
 =?us-ascii?Q?GWPGqDrNHpPwSNrOGKw/ZqETerBke0764XqLMamOE1Ne1FWZJeO343LCflQZ?=
 =?us-ascii?Q?v8qhZbh6mMVRwGGdC7dmPZspeApTuFQzfGRVNFQ8LglQBywJkbXkMZsRd7Ua?=
 =?us-ascii?Q?U/mr8ichx6p485KEkXsDT2C8wnvNNnwJ4bXKftlyctlaIkK5cjfLz+xazC5x?=
 =?us-ascii?Q?MeXbjM+obvQpE5micrmz4+CiQsS4dpHTtfl8kwZS8opP0ITG/Dn6YQ/XSDnn?=
 =?us-ascii?Q?RVRlTFHK+4Zf9De2e6/u4ZeQyhbmfNXzDdccfMG5FZn4uNTuRC2Sg73q1Ena?=
 =?us-ascii?Q?BwFTMrkrZN3K1WPBsaEedVOSF+YBBbjfP/XqOnL4jhQ5Oi5fT1Busuny01rx?=
 =?us-ascii?Q?EWkOG8UISE6knl4Hifx7xTh61NW4E6YkNt72q17KRbhc3M5KPEBwKXYYq/9C?=
 =?us-ascii?Q?sbhkeYuiVzFeG6b+jxdCIt84TL9tGymt8lUb4jlm5Gb3+afDe6G/JDULtSC5?=
 =?us-ascii?Q?GczRbAJsNotABcmgKMWRY/zbcK6hojB4KwgbORjvw8kOVrkhif3xfjcY4DGi?=
 =?us-ascii?Q?Qo1dGVnYngtD7897pE2CuS4OD2qda40xfBHKj6mFlrmkUhYIFULCp5utUal6?=
 =?us-ascii?Q?coU0srt/kMStaeBNS3jRA8LSER9Ej4VEmZIUwgjuUc+NSN6ihLjZNSXEmUHm?=
 =?us-ascii?Q?NdyPo9/mqUsFDz0L8yLzIglhJAWHDyMj1RuDq/IO1f/UEwU0kNk/ViopjZ3N?=
 =?us-ascii?Q?RE1/mHqSzadAGYZEQ5GTwk1awZ1FlpWD1qApTpOg519VcN1ioLeOz9eTDRak?=
 =?us-ascii?Q?llfb+YTGlttoqT9B/BXuPJiUCNVE8a5YbSTP+Gtdsoua3w/v55Y97EdYNT3J?=
 =?us-ascii?Q?amdJ6Tai6llV8OBhruTh0jdqm4z9xJ35wFXJN9Q4XTqyuXV42c7C6pQKMBhp?=
 =?us-ascii?Q?pH0gEsCzPbaP0gWLRoyZWNqIB8m+JB8MCQSd7MwnIur/NC62GH831aCl29WZ?=
 =?us-ascii?Q?qLfxCM4ubx+Vyo5rthHjSbVeZfBt6XKtt3FfWmptQRC0MerOh0Cx8VGETsrp?=
 =?us-ascii?Q?V36fErOYVTe47Gr6QGs///ub326UpLJpawvIaK10afEYsCeMKvLTUgxW0JeI?=
 =?us-ascii?Q?QCVXOjyaUv5tnTUfBb/giZDmSwdX/+/xcsVLLY2GHrTlGz6FOUcfXvlqxS1D?=
 =?us-ascii?Q?bhi/WYFGTko/LeyoPmxEfi7W/PP03D1WQY9aeuXXiQOO5U9FOVBXDNQrCsKi?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YuTx6NJMJ3dJCrrBGNd/XOHif4mpGWe2v1BFNk/ZZ4usM9qEZ+jPFB2c9oFQu1dob7pkRZOFb1JC9Pc8tpHMnhZLzLHq33X70Dh5MV7sLHTihcyhZwch/xh6MKvWtMZWW/ZvH+k+/keiAjeqaNENjDDlTKy4gRUTyNBhI/AEYSzQWLW8UPg8l4JhEkQUrPkQoWnmWqeQmwAvGF610bMKziuONayiarUwTWlCuhpFLOmfflMSn+OR8qdoOgamdwYZrS6bQatzVbfQPqZdzFO4FLt2awuPaiC+0ifcRgbmJrlLgZtFKy2KOHQhHnX2tChEvVQHa2Bmm/6srP3ur8wRximmUqiUQnDHnYVxAB+C7hKdbtW3lnVjGJisYIh9w17aNvrIK2xp/Cr3LUUBmV3K2s+qh2loTGlzhL09XHJ2561VY6nzVGQVVfi/JoWr9b/VTTmPg6v/3OCclfu+KVolOqmWKJ4pY+mPe9cQqZUiJ0m/LMNiQ4ibPYmecVjmQRlcqOvMfSmVLNTSqf63zi8DmJH+sAHwGu+eh+ERlYXagecgiWgdsfi95mtByEylnZDLluqyDiehc++ZVE9BDdPtpX0Bmc0xbAB6AlHPxzaX700=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118fab56-fa7c-49bc-8b07-08dcefaf3e1f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR10MB2723.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 19:58:32.1810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55z52zu7TI9p7dTBZDGZx8TAkgm59m1+KMuRCxrwvHaBeya70lV1PJ8aKLwc8dtRsJ/ottK8QJCkFW/uCVH6Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7202
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_15,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410180127
X-Proofpoint-ORIG-GUID: Clv5O4c9BKPL1iUOuDEw8B21pA7uyYxo
X-Proofpoint-GUID: Clv5O4c9BKPL1iUOuDEw8B21pA7uyYxo

This change propagates the arg type and mapping info we just got into the
pid_probespec_t onward into the underlying dt_uprobe_t, shuffles the native
types before handing off a 1:1 mapping to the dt_probe_t, and calls
dt_cg_tramp_remap_args() to apply the requested remappings.  With this, USDT
probes should now have visible types which obey the :-notation translators
specified in their .d fils (this is now tested).

The probe info has been moved from the underlying probe to the overlying one
as part of this: underlying probes don't have any user-visible args to
get info for, and their probe_info functions are never called.

We make several assumptions for simplicity, all noted by TODOs in the
source:

 - overlying probes all have the same native types and remappings, so we
   don't need to look at more than one underlying probe to figure out what
   they are.  Given the structure of DOF it seems to me this must always be
   true, and even a malicious attacker could not produce DOF which said
   otherwise.

 - any given underlying probe locus is either a PID or a USDT probe, never
   both, so we can just remap the args at the start of the trampoline and
   then never touch them again.  This is obviously wrong, but the both-at
   the-same-locus case is not yet implemented, and significant changes need
   to be made to create_underlying() to fix this.  Right now we can't easily
   even tell if a given locus has both types of probe on it... fixing this
   is literally a matter of shuffling the pid probes after the usdt probes
   and then doing a single dt_cg_tramp_restore_args before all the pid
   probes fire.

   PID args are already broken before this commit (something to do with the
   wildcard USDT work?) so I cannot test if this commit broke them further,
   but it shouldn't have.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_prov_uprobe.c                    | 163 +++++++++++++++++-
 test/triggers/usdt-tst-argmap-prov.d          |   3 +-
 test/triggers/usdt-tst-argmap.c               |   3 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 +++++++++
 test/unittest/usdt/tst.argmap-typed.d         |  40 +++++
 test/unittest/usdt/tst.argmap.d               |   3 +-
 8 files changed, 320 insertions(+), 11 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 481159b01c24..767d9a80b5e1 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -55,7 +55,13 @@ typedef struct dt_uprobe {
 	uint64_t	off;
 	int		flags;
 	tp_probe_t	*tp;
-	dt_list_t	probes;		/* pid/USDT probes triggered by it */
+	int		nargc;		   /* number of native args */
+	int		xargc;		   /* number of xlated args */
+        int		remapargc;	   /* number of remapped args */
+	char		*nargv;		   /* array of native args */
+	char		*xargv;		   /* array of xlated args */
+	int8_t		*remapargs;	   /* remapped arg indexes */
+	dt_list_t	probes;		   /* pid/USDT probes triggered by it */
 } dt_uprobe_t;
 
 typedef struct list_probe {
@@ -112,6 +118,9 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 	dt_tp_destroy(dtp, tpp);
 	free_probe_list(dtp, dt_list_next(&upp->probes));
 	dt_free(dtp, upp->fn);
+	dt_free(dtp, upp->nargv);
+	dt_free(dtp, upp->xargv);
+	dt_free(dtp, upp->remapargs);
 	dt_free(dtp, upp);
 }
 
@@ -138,7 +147,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	char			prb[DTRACE_NAMELEN];
 	dtrace_probedesc_t	pd;
 	dt_probe_t		*uprp;
-	dt_uprobe_t		*upp;
+	dt_uprobe_t		*upp = NULL;
 	int			is_enabled = 0;
 
 	/*
@@ -201,7 +210,48 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		if (upp->tp == NULL)
 			goto fail;
 
-		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
+		/*
+		 * Arg info.  This really relates to the overlying probe (all
+		 * underlying probes associated with a given underlying probe
+		 * must have the same args), but the overlying probe doesn't
+		 * exist at this point so we must put it here and pull it out
+		 * when the overlying probe info is called for.
+		 *
+		 * TODO: is this true? can distinct underlying probes have
+		 * different native args, as long as their xlated types are the
+		 * same?
+		 */
+
+                if (psp->pps_nargv) {
+			upp->nargc = psp->pps_nargc;
+			upp->nargv = dt_alloc(dtp, psp->pps_nargvlen);
+			if(upp->nargv == NULL)
+				goto fail;
+			memcpy(upp->nargv, psp->pps_nargv, psp->pps_nargvlen);
+		}
+
+                if (psp->pps_xargv) {
+			upp->xargc = psp->pps_xargc;
+			upp->xargv = dt_alloc(dtp, psp->pps_xargvlen);
+			if(upp->xargv == NULL)
+				goto fail;
+			memcpy(upp->xargv, psp->pps_xargv, psp->pps_xargvlen);
+		}
+
+                if (psp->pps_remapargs) {
+			upp->remapargc = psp->pps_remapargc;
+			upp->remapargs = dt_alloc(dtp, psp->pps_remapargslen);
+			if(upp->remapargs == NULL)
+				goto fail;
+			memcpy(upp->remapargs, psp->pps_remapargs, psp->pps_remapargslen);
+		}
+
+		/*
+		 * TODO: validate that all underlying probes for a given
+		 * overlying probe have the same args.
+		 */
+
+                uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
 				      upp);
 		if (uprp == NULL)
 			goto fail;
@@ -413,6 +463,9 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
  *
  * The trampoline will first populate a dt_dctx_t struct.  It will then emulate
  * the firing of all dependent pid* probes and their clauses.
+ *
+ * uprobe trampolines will also arrange for argument shuffling if the remapping
+ * array calls for it.
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
@@ -437,6 +490,34 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		dt_cg_tramp_copy_args_from_regs(pcb,
 						!(upp->flags & PP_IS_FUNCALL));
 
+	/*
+	 * Figure out if we need to remap args, and remap them if needed.
+	 */
+	if (upp->remapargc) {
+		int	needs_remapping = 0;
+		size_t	i;
+
+                for (i = 0; i < upp->remapargc; i++) {
+			if (upp->remapargs[i] != i) {
+				needs_remapping = 1;
+				break;
+			}
+		}
+
+		/*
+		 * TODO: pid probes are never remapped, so a remapped set of
+		 * args for UDST probes need saving/restoring to reverse the
+		 * remapping for pid probes at the same locus -- but right now
+		 * pid and usdt probes hitting the same locus simply end up as
+		 * whichever registered first because create_underlying cannot
+		 * handle this case, so we can avoid it here too.
+		 * dt_cg_tramp_remap_args already saves regs: all we need to do
+		 * is restore them before any pid probe is hit.
+		 */
+		if (needs_remapping)
+			dt_cg_tramp_remap_args(pcb, upp->remapargs, upp->remapargc);
+	}
+
 	/*
 	 * Retrieve the PID of the process that caused the probe to fire.
 	 */
@@ -710,8 +791,77 @@ attach_bpf:
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
-	*argcp = 0;			/* no known arguments */
-	*argvp = NULL;
+	size_t		i;
+	list_probe_t	*pup = prp->prv_data;
+	dt_uprobe_t	*upp;
+	char		*nptr;
+	char		*xptr;
+	int		argc = 0;
+	dt_argdesc_t	*argv = NULL;
+	char		**nargv = NULL;
+
+	/* No underlying probes?  No args.  */
+        if (!pup)
+		goto done;
+
+	upp = pup->probe->prv_data;
+	nptr = upp->nargv;
+	xptr = upp->xargv;
+
+        argc = upp->xargc;
+	if (argc == 0)
+		argc = upp->nargc;
+	if (argc == 0)
+		goto done;
+	if (!upp->nargv || upp->nargc == 0)
+		goto done;
+
+	/*
+	 * Construct an array to allow accessing native args by index, if we
+	 * need to (which we do whenever we have remapped args).  We don't need
+	 * to worry that any of the indexes might be too large, etc: this has
+	 * been checked already by validate_provider() before parsing and
+	 * writing to the DOF stash, and anyone who could inject invalid records
+	 * into the DOF stash is already root.
+	 *
+	 * Shuffle the native args according to the mapping, then set up a 1:1
+	 * mapping in its place: we do the remapping ourselves, driven directly
+	 * from upp->remapargs, in the trampoline, so array ops etc should not
+	 * do it.
+	 */
+	if (upp->xargv || upp->remapargs) {
+		if ((nargv = dt_zalloc(dtp, upp->nargc * sizeof(char *))) == NULL)
+			return dt_set_errno(dtp, ENOMEM);
+
+		for (i = 0; i < upp->nargc; i++, nptr += strlen(nptr) + 1)
+			nargv[i] = nptr;
+	}
+
+        argv = dt_zalloc(dtp, argc * sizeof(dt_argdesc_t));
+	if (argv == NULL) {
+		dt_free(dtp, nargv);
+		return dt_set_errno(dtp, EDT_NOMEM);
+	}
+
+	for (i = 0; i < argc; i++) {
+		int remap_arg = i;
+
+                if (upp->remapargc > i)
+			remap_arg = upp->remapargs[i];
+
+		if (xptr) {
+			argv[i].native = strdup(nargv[remap_arg]);
+			argv[i].xlate = strdup(xptr);
+		}
+		argv[i].mapping = i;
+
+		/* Guaranteed safe: see libcommon/dof_parser.c:strings_len() */
+                if (xptr)
+			xptr += strlen(xptr) + 1;
+	}
+done:
+	*argcp = argc;
+	*argvp = argv;
 
 	return 0;
 }
@@ -779,7 +929,6 @@ dt_provimpl_t	dt_uprobe = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
 };
@@ -794,7 +943,6 @@ dt_provimpl_t	dt_uprobe_is_enabled = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline_is_enabled,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
 };
@@ -818,5 +966,6 @@ dt_provimpl_t	dt_usdt = {
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.provide_probe	= &provide_usdt_probe,
 	.enable		= &enable_usdt,
+	.probe_info	= &probe_info,
 	.probe_destroy	= &probe_destroy,
 };
diff --git a/test/triggers/usdt-tst-argmap-prov.d b/test/triggers/usdt-tst-argmap-prov.d
index 28134baa6fa3..7cec525c908a 100644
--- a/test/triggers/usdt-tst-argmap-prov.d
+++ b/test/triggers/usdt-tst-argmap-prov.d
@@ -1,10 +1,11 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
 provider test_prov {
 	probe place(int i, int j) : (int j, int i, int i, int j);
+	probe place2(int i, char *j) : (char *j, int i, int i, char *j);
 };
diff --git a/test/triggers/usdt-tst-argmap.c b/test/triggers/usdt-tst-argmap.c
index 89a0a53fc1d5..cbdcaf1f0b61 100644
--- a/test/triggers/usdt-tst-argmap.c
+++ b/test/triggers/usdt-tst-argmap.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,6 +12,7 @@ main(int argc, char **argv)
 {
 	for (;;) {
 		DTRACE_PROBE2(test_prov, place, 10, 4);
+		DTRACE_PROBE(test_prov, place2, 255, "foo");
 	}
 
 	return 0;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
new file mode 100644
index 000000000000..8bcfa92ff6b0
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
@@ -0,0 +1,34 @@
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
new file mode 100755
index 000000000000..c575983adf65
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
@@ -0,0 +1,2 @@
+#!/bin/sed -rf
+s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
new file mode 100755
index 000000000000..ad8dc2e7c267
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
@@ -0,0 +1,83 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+##
+#
+# ASSERTION:
+# Testing -lvn option with USDT probes with a valid probe name.
+#
+# SECTION: dtrace Utility/-ln Option
+#
+##
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS=
+
+DIRNAME="$tmpdir/list-probes-args-usdt.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go(int a, char *b) : (char *b, int a);
+};
+EOF
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >& 2
+	exit 1
+fi
+
+cat > test.c <<EOF
+#include <sys/types.h>
+#include "prov.h"
+
+int
+main(int argc, char **argv)
+{
+	TEST_PROV_GO(666, "foo");
+	sleep(10);
+}
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${CFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+script()
+{
+	$dtrace -c ./test -lvn 'test_prov$target:::go'
+	./test &
+	PID=$!
+	disown %+
+	$dtrace -p $PID -lvn 'test_prov$target:::go'
+	kill -9 $PID
+}
+
+script
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/tst.argmap-typed.d b/test/unittest/usdt/tst.argmap-typed.d
new file mode 100644
index 000000000000..0e0c923e1736
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed.d
@@ -0,0 +1,40 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when remapped.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place2
+/stringof(args[0]) != "foo" || args[1] != 255 || args[2] != 255 || stringof(args[3]) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(args[0]), args[1], args[2], stringof(args[3]));
+	exit(1);
+}
+
+test_prov$1:::place2
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap.d b/test/unittest/usdt/tst.argmap.d
index 7896dc07e0e2..9cd3425bf8e0 100644
--- a/test/unittest/usdt/tst.argmap.d
+++ b/test/unittest/usdt/tst.argmap.d
@@ -1,11 +1,10 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
 /* @@trigger: usdt-tst-argmap */
 /* @@trigger-timing: before */
 /* @@runtest-opts: $_pid */
-- 
2.46.0.278.g36e3a12567


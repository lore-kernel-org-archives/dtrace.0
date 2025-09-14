Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209ED169AD2
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757856377; cv=fail; b=QUZS2oASrh0tDZxw9MGcPKt8AJ3lut069DRO6KmlV54cGfHP6GxWOqZe9hQ5D5wwiL/SiKjPVc8WmWk+UbH6343BT5/oflsEJ/aR4qKdcW80FO2MXOWPZqC+oVo1yjMFZ8RZk3xF7cIkaFw68t4wVYzSluW0kZt8y1T8vthuGMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757856377; c=relaxed/simple;
	bh=b0djwrRJW0OSX2d9SB0DS4xeMkYoPnv0oO271NxeS0E=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=UjlNdJ56efrd2ynJDB0S2hA740YzuHHCf0AIrs+VdfrhWLD+B1OkUy/3BX6m79UjrZjJWR5lI0CrJaC9TppnDR8Kz/qYEMY8aVjOmPsnSqG8x3H9LGwGXffdzzIey9CTkwJJWetPyAziq3CgzOUHwPS5FeXbnWtSAkx40PYzkNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Iq6S6p9L; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=e0V4239p; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Iq6S6p9L";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e0V4239p"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58E96vEQ002039
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JxzoIbje6Nfj/+d36t
	ElsD/L9zes2FvxcYoi3lfyNNM=; b=Iq6S6p9LQWma21ysAIMM3RrXLbI4ydfltk
	MxDOJTh4nCwQ8FF3gAo19/jY8+Bga/pqOS5ht/nkfJchk9tCLZbyJxNDqNAVVQo6
	XmvliaaHSypVeoBN1aaDpG2V+3QymgrbfnwHy2UElSUBU4tn+hD5ZTSykDKq/Aiq
	NFDne9CsOwoFItbafVQBAXFHFp4bLz7hH8wOZqjlUk5+InB3ZOpaFsixdAPoUsbk
	TLbDSbNwazTiYC8FN3dBEMZG0ROajB/PJOAu0t0udr4S86vtEaOre/PROAfBh1VK
	YkC+7vWaIovWYX1wRN/IfNaXhXgRE5C7mbcnP3H4Xa98wigFOCrQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4950gbgyxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:26:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58E8Twoo019192
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:26:12 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2ac73t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:26:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzelygOxr8p9xWktGJElYyBoSxe2wNTlZQd3HZcRWHdvsocdiUndlo7Zagk+TtotLeKGHIz4YvlzuBfyoM4fLJjCqQ5FkehZAI4UQhz/15HGAxuUqxVQLCm/YDJEW5D2K8SKzUrMhFTHSuznXlqCYTzxEqd9CnEKk/53oF8OuWnEe06650EmJbqo+omJH/Vy9aIpAJhdBLLcI3+x3CWVh7tfbvdV/RtTlE1tls+wc9Hd7D3eYFoAHNdPO9c9pUv1fwbQ1rAV2U6xyc9wm1AOn11ixGgjHVlOhHoccca8n/G8sUI0fkYx5PiaKmTe1qaZhumcjS3XDrZMmf3DXmFyOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxzoIbje6Nfj/+d36tElsD/L9zes2FvxcYoi3lfyNNM=;
 b=dHqW5vBgpWXGO1jHHZbppBrFNNABoUYxRLwv1bOtGE3diGS7nC0P5FeGEfomNprr6xGb7ifj2fHXvVKuub3JVAcowJ/dvJOYNuuVwm4D8mghl2GrUmB+SVptD5oBgAcbPrh0nKsqrZB+EflzTrWTeNeahqTycSbz0uZ5TgBNM1Knp9qFfQfVqWGl8v3iKqrWKxKRM9BVe+JFhNHtfOBpFJHFjP3j+BZHmr1gD7hUyU01rWuQvest+IGWWyiZ45hB3ssw/wTet+3syMDBbz8c8TC8dkf3XL6SJxwgX5CO7EwsIgm1T9qCpObEv4A0SGWPIYhRRtXyzvUYYIoKTOrcQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxzoIbje6Nfj/+d36tElsD/L9zes2FvxcYoi3lfyNNM=;
 b=e0V4239pTgU/Uv9OTjs/nuNFd0dT4QFPlbBeDvJkDblZEWX7ZxoW9ibFqtrPtOfRyTN+J93z52MrsB7ufFMsAx3LezFZd4RkobrllPyUFbCWOB50Zsqd8GEWf74Ha4/BJKTq6NNwuO9Zv9MnjnwAvy4ymP4r5fxRj8YJ3kvNEQc=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by SN7PR10MB6363.namprd10.prod.outlook.com
 (2603:10b6:806:26d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sun, 14 Sep
 2025 13:26:09 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9094.021; Sun, 14 Sep 2025
 13:26:09 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 3/3] Add more robust mechanism to skip
 tracepoint common fields
References: <20250913155619.22299-1-eugene.loh@oracle.com>
	<20250913155619.22299-3-eugene.loh@oracle.com>
Emacs: well, why *shouldn't* you pay property taxes on your editor?
Date: Sun, 14 Sep 2025 14:26:04 +0100
In-Reply-To: <20250913155619.22299-3-eugene.loh@oracle.com> (eugene loh's
	message of "Sat, 13 Sep 2025 11:56:19 -0400")
Message-ID: <87frcpw4gj.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::6) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|SN7PR10MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ed254a-b810-4b9f-d6b0-08ddf392444f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?REUgQUBWuIYQEjd7ls0tk/NCxt8k6CvJYrH+WjJ+8oEK3/o1yYnOqZoUfTYT?=
 =?us-ascii?Q?qzWp+Q0nPwY3MLHU6pT7oV0OL9BxSYYWA6uGhgUA5GRm8Ylke8mF6OJtE9x7?=
 =?us-ascii?Q?/uAd2ANQZ+HQWRXdcvsl6pBf3WQe0G0lazTxMoJSWjMzDjT/jgZtYTPWyvkd?=
 =?us-ascii?Q?ecEMM7wY3u1Qi7twzuWmsois4BPGumUSDNkLbGELAby/adIDIuOrzdg7IuAP?=
 =?us-ascii?Q?uqL0VtvYgUBGYpshx5gnfYTjPnZiqtKnvmMjHfvMypyJnqh+m+q4F5dQf63c?=
 =?us-ascii?Q?L9eZv/ExOiOFXWRBXA4VhAhTUlEzekW5JrSZLcYjT5EO7muq1Wv85O7uMYcl?=
 =?us-ascii?Q?vpWUPczvE3XUxvGeVVGEwoQnMosAG8teaPnn10OuFiaH+lTquTz0Bq+2ztWI?=
 =?us-ascii?Q?IVgGROp4cxPb7QnF+kF9hPDqvlBi6qzrMiCAQpIFwsDxgNLbd5cEJ2KRPJhT?=
 =?us-ascii?Q?gEh0dKNkHGGIkd+/FNzbMDff8VJXpMcNBtUrb6pvdUW7MhXlprUTgTiNG0y1?=
 =?us-ascii?Q?VvKC2hcsrEQatzMk6olD9qxSDOqVDmf9SoYUQIX3mmcaCiX04Qi/fDd4nJWJ?=
 =?us-ascii?Q?JWBKCF/C35PTstCYdjRCjm0YZgfij8u4uRXaJI9tFobEw9HDSgE9NbOI78xO?=
 =?us-ascii?Q?oEtH+ZbknMEtQkAkWcU5ZS7Jlmtcc5BNGexFH83Y6ZuBqdxlZOWcgC5Fomb4?=
 =?us-ascii?Q?v2vlP4DGwWIPefBUJeNXUz8hE2z9aJ6bquu4nBca2yOzpg0l45XTQuBC9nbO?=
 =?us-ascii?Q?Jmq8GU5g5PoZ4eGzNXJHOcielFF3ftSGs2bSW/EmD8anqCtPSj/gUOFmrQ9B?=
 =?us-ascii?Q?EU1wHJukoCyaVAfFgpxtecFP0/HtAA8+0uorRUY3WaO2LByQ+gaXmBmr8P2u?=
 =?us-ascii?Q?bPoGA81n3fG7+V7t3/DIhwNiml/MGkh1xwoB0tmeyeGsQOLj+nrirlslaPVv?=
 =?us-ascii?Q?flTyLE9yz8ewKorGzhNXlVeAlmODOmhRENQjZNGKGvVeNwe5h2oiS40TDkzw?=
 =?us-ascii?Q?MTlfNb6xfmO5CEGZGFPTfH6QEmDC7//9oOSPORxYwEaZWsYQ8sNiGkp5ppQk?=
 =?us-ascii?Q?GmE4hXxnRFI3OFszGz7kGeyoD5sIpxY8fPc9gy+dgFECr5aRK8AgDmOQglT+?=
 =?us-ascii?Q?JNWZ7szpG6eb8x8vTDAXlpcyl+/KFFrBhki3wcGNiBT9CQhjarAdjS0b8HTd?=
 =?us-ascii?Q?TClzVaw+2Tv0wk0TtnTef1Bye0WFxnQrk3Jm2yExfNY3VO88s0MIi8mlfYcM?=
 =?us-ascii?Q?uPE9P3uf3I/z0IlVN/aWac/6iJ1dJUtODfF83NgKjgnJ21lHaNMam5G7FXK+?=
 =?us-ascii?Q?7+t184pWkuOAFF4Ze+hIZnsWH3JsaOvoydmGii9FHSzoF2t4Syx7s8t3ohR1?=
 =?us-ascii?Q?dJi8CQYemC34ilQnPEaG0WffUMju/1j8PKlk2Lpxt/SpSvdTgjc8JiNRPYNO?=
 =?us-ascii?Q?h+m7cozM6xA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1YIcn6Kps+Yo5IFdlxh6t+R4Xikp0cqqBi+jQx5oz27l9arFwC5k06QVM6eH?=
 =?us-ascii?Q?KCsvIRMQkszs3on3KHQbmqY/E0GhzvY+ioCJNlc2k2cyaebFXgI3xTIaohT+?=
 =?us-ascii?Q?WWQ9JzMtrrQB/MBxSkITDlgqxr/eS2ioGSi4fnZ9aQYDB3+eECaPjH/K0iEQ?=
 =?us-ascii?Q?vr4uufxosmTbkkTIJGHlJ3/jpJQdDaylYP6fpCzIka1YDvH54/wu/gkH9Bl6?=
 =?us-ascii?Q?UTb+DtALCi5yWRH48qleePLHcGkh5A3gtnfZjxmUnlG646SQasQEyqUo4YUf?=
 =?us-ascii?Q?Kp5GpUZlWxQKI7Zpq5aNoghdo7KWpgRVcUZJ6Kfm4Os3ezERufwoVR1uLfMo?=
 =?us-ascii?Q?nsOJ1AgvMDWBFIm2pjGgImva0qjpBQFlgPTY+Xv8+5XpWxI15HITN6GYdTXZ?=
 =?us-ascii?Q?OwaXQKkKY5SIrTDwTOUEUnrQypKTFoZIbykWnCFF58HXm+o7/1TYYHH0updX?=
 =?us-ascii?Q?Hb3uUluUOiYp5wix59j5iZT6sSrNhdB2jaEwxEkO3px3+U5fUkrMIQXjHZJE?=
 =?us-ascii?Q?dqrbiVcBczx4r7e4dUMkSMnpzDPjKbTVKyGOYfK7e6i2gSeZIleQ0dLxYzXI?=
 =?us-ascii?Q?JPj+2vGyzASeBSVpKFlAoi30YptUUHq38Krxs0GD9Klgd0eqg16j6FqJbgol?=
 =?us-ascii?Q?RFbVFRgO9TGCSkD7AMp+aNW5vxIVgRj/R0hQ1igjjqWk714G+c50Kd8FQ405?=
 =?us-ascii?Q?yyQ/QiLKvBEVwWUnjrP+1ngkUPLJQY+U5oKK7y5gOXsI7oVkh2ur981KIFds?=
 =?us-ascii?Q?d0x76pLmQ9cNNdbL1mdFAm4nkLV4m/ODz+awyiasg5rQjGQtZVC/2E8UL0r5?=
 =?us-ascii?Q?yZahBi9sV+k8yqo6LEi0/D/FOvbNUvyYgcNLklNSuKfXI6zh7p/NjS8bieWs?=
 =?us-ascii?Q?LszU8CNW0XcJQAw6+fd3Oj2Adn/kLn7mjMNjN7uY/FFXXdD9NbfxcPqFa57V?=
 =?us-ascii?Q?cYxWDCTOkX0PzypyPzJzQH37yXhWXLJ6V5o33twYoBbRkA8xhBtLanvIDEJD?=
 =?us-ascii?Q?IqfAEzJsKHiPcudv4wPbOyL0Y4yeTAozzXViwVeimqzZU11POm8ncAG7kMHo?=
 =?us-ascii?Q?txjjDrYE1EAL/nWHHlQr6Od5aWLyq4GnDDAiCHm8eLKyJZnZKJAYHS42ITSo?=
 =?us-ascii?Q?G2z9HVzdWryGE9hEN6RiVr0klNImpYQw8d8AB25MBCSSQiPrc7yfiqxQ7EVV?=
 =?us-ascii?Q?3RPx3bSB7uRnIK4QqPgrZOWmdxK6jSs2xLCEB0DBgedMU1cH51Lx8vSuAGqm?=
 =?us-ascii?Q?qksaAhI0vQPvF6pDOLi5sKe0A6U6H2kFiavcyKybOwvpCu7ZJ9fy5mOBQoWJ?=
 =?us-ascii?Q?w/60SEIsC/1rZOZ2jiKBjti6ODn6FeCdl9SHK0GEhkR0NGcNo8PFiVTGb/z3?=
 =?us-ascii?Q?g4g7apHngT/HzS851Qnc5iNwS6sG1Wxh+BMZIsHvLE5eRjwj5unyM7HC9xUb?=
 =?us-ascii?Q?arfrDbZQcgITPVa8iYYD8/D9686me7PmydcIwzht3ZRRMlQz4OhWsSqVZSrr?=
 =?us-ascii?Q?FMByo48I1Jpce6Bky8ZeihO7t7YTciGvGwabOsxIACm4F3EQOAKWrOjVyYaf?=
 =?us-ascii?Q?03T1sUdpPlFww/MYezk9wo8Nl8amfA7uXKHUTFYSPZIIVEtPmcLQVaWwip6s?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2/sP/7BNIe3eJ7rsJ7V2+AHoJSKrUpFyZ7gt0jbthqnCYnFxrHY2TuXz7KILOoXFTnETqP3CIwoHTCz0o9NWu13xpC2/Uk6EO5247erYHswh6occ3dI0epNlVYSoZls7a4sjMEwJwvODRzLCalJHiixWGsaWXjnzN2JYB13EERaogZmKGLpXEsjPjnJwAmodsF2AnWAAsuugpEOpWdPXgjCYw3DwoOxbIYXMLRe0tCFaRm118DL1+2XRI6YDiFrYiZ0Ce5gZ8Ykk2bk5rnhdczwG+59OMAV2KAcryoc7f3CJzNVwsJl5r4Tb/qJKdgBzjQjgCVMxerp2Le2N1lK9Pno+ez+shNxBDbquVIIiEH/avFCx5jCEacUqT4qbWvaINhQ0uzowE9xxIYj7mvIL35LhgQ3OY1wrU1jJjb+0bIomKKes+toa2E8PNDs2v+0CftU1brNBu8G/JBV4MCN2LaRsJxWdw7CsFSyDl9E9UnD3qlDFBmxJPKH389HQAV4mt5qqy4iWenf4M4Q8a+8y26feAnCr0wLyI4F5C0nX4yQhTZcyaiPW9LS2PlhYinQQS6z6x0m3EYQDQva5JUgFdWq9+vmnhUmNCNuA+qfo5gI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ed254a-b810-4b9f-d6b0-08ddf392444f
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2025 13:26:09.7140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVHtW5gSfHvLSB6yjksxLHVvx5SwFdX9rQRrHB4byXZ/xeRHmc7h1HDins+L/ykMMUuZ2Ix/CNGPqpxkIe2zEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6363
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509140128
X-Proofpoint-GUID: yJcahx51uHHfM6frwH3hg_DZVFCYOsrq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNyBTYWx0ZWRfX5B4BeLtwPchn
 gyulX/4vgBJ9OioJSNf55mRbxc0mok/SrEUY3p1QvApIwE52KlTQ74LvCtSkKoYZ5GbS/u1W/k9
 TfJx6N86Ri1nZeYSdNWtSsusmlBjW5j4B3XVJ7ua/2a1iviHkc3zL2rk1d9wffrJIZMc1dneGjA
 mCSfCKyUQ3rtq6KNyQm9olW7ADhyenKJro1S06ZPHsgP7Y7AlRXXvfmMDrEN824oF+DBdr5pfjL
 Ye7OT6lApTZdeQCfGnggLqhOuU2IYrrHn/9qk5vLCV9mwSak+XHEKcpo/g+mgfi5mTJQtZufYbB
 7MUlyulMkKjfgYbZhcQi0IVOTWkYK94X+u4aD2WS4dATK/sy2O18q38ny7SWb6nH7Vwo+7ahrDG
 n8ae2ifX
X-Authority-Analysis: v=2.4 cv=QIloRhLL c=1 sm=1 tr=0 ts=68c6c275 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jTeLwtZ3HTWJ9dulj3oA:9
X-Proofpoint-ORIG-GUID: yJcahx51uHHfM6frwH3hg_DZVFCYOsrq

On 13 Sep 2025, eugene loh stated:
> Implement a more robust mechanism.
>
> Specifically, instead of skipping a hardwired (SKIP_FIELDS_COUNT=4)
> number of common fields, look for "common_" names.  E.g., in
> kernel/trace/trace_events.c in trace_define_common_fields(), we
> see the macro __common_field() is used to define common fields,
> and the names are prepended with "common_".

(If this turns out not to work, maybe we can hunt for the blank line
that always seems to follow common_* fields?)

>  	while (getline(&buf, &bufsz, f) >= 0) {

This is much clearer than it was before!

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

> @@ -160,14 +150,63 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>  
>  		if (sscanf(buf, "ID: %u\n", &tpp->id) == 1)
>  			continue;
> -
>  		if (sscanf(buf, " field:%[^;]", p) <= 0)
>  			continue;
> -		sscanf(p, "__data_loc %[^;]", p);
>  
> -		/* We found a field: description - see if we should skip it. */
> -		if (argc++ < 0)
> -			continue;
> +		/*
> +		 * If we have only seen common fields to date, keep
> +		 * looking for a non-common field.
> +		 */
> +		if (common == 1) {

... ok, I take back the thing I said in the previous mail about moving
things to a separate loop: the ID/field scan is necessary anyway, given
the first two lines:

ID: 94
format:
	field:unsigned short common_type;	offset:0;	size:2;	signed:0;

Given the overall format of e.g.

name: sys_enter_iopl
ID: 94
format:
	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
	field:int common_pid;	offset:4;	size:4;	signed:1;

	field:int __syscall_nr;	offset:8;	size:4;	signed:1;

an alternative approach might be to exploit the format, and always skip
all lines that do not start with a tab, and/or simply all lines until
the first entirely blank line? Maybe? (Looking at the kernel source, the
common fields always seem to be followed by a blank one.)

But this approach will work for now, though it appears to be pure
coincidence that all common fields start with common_. We definitely
have workable alternative approaches if this stops working :)

Hmm...

+			/*
+			 * Strip off any [] array size specifications at the end.
+			 */
+			while (*s == ']') {
+				/* From ']' hunt back to '['.  They are not nested. */
+				while (s > p && *(--s) != '[') ;
+
+				/* Then remove any spaces. */
+				while (s > p && *(--s) == ' ') ;
+			}
+			*(++s) = '\0';

Why is this necessary? We never look at the end of the identifier in the
common_ search, only the start...

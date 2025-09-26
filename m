Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F83221F2D
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913572; cv=fail; b=J6BKCBiHhvjWZ9t91q7r9pVgFmxs/D/cXVTM4uaY1QQVgETaml21kWAMyzyIkhyj8GtJauuRgEyq/tG+/UHg4eSWbA2HTXBLbnEI7EXSEdmhdNFm5HKIwNK3EygGlIvzeEvUKDsEUW9PyUlHMJCkqm0MVdAjFsNWERkbe0sSDXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913572; c=relaxed/simple;
	bh=P8k/j4drZueKVt5Wf8mpPNa4ecmI3dKzUz4h58v3OF8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sLCuILo/LHVmGsD62MDpyDcrCvbTrc7qsNuTfvGzRwJ4EJvzwzCljBt1ylVICt9IzJZxOhCKP+GMtBvxdiXk9fCly2TmxtvCRz0dsTcK41b/+4ppCBS8G1zbDYoUSNv3mV9FBDedQI5GjaNwIadDfiqzi6WkSOHzTJquaj8lcHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cENzqJvG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=umR2ity0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cENzqJvG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="umR2ity0"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QINGYX006505
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZYozN5Q8cLkQGxWW8z
	Vgz8JLIGe42eiim4xqepYhOkM=; b=cENzqJvG/D2F7W++5ZFDuE7QHAaNiv9F7d
	vW9/aPWKeDrMCKeyIoDbSIK7D7pkVwDptGLnh3kEoH/2azQKysm/tL3xEBuQ7cl6
	ftOou6WDlm3VwnhCkyhTjPhANu8RX+w7yd2izfqb5uH/oobjvG8o//k0Mlt9rcPQ
	0ZahczsLsJ2w2qlLAFZM4PzbW0WOGlViUfHQdfZXWU4yN8kQwv1B2BAVyeY/ArSj
	XIc/V3rKIMRVnWQJlnBRO8h6/nkNMjpTomRasR98TsqKND6gywkTgCthOb6aaOiv
	FGl1lPzG8jX54ONLPu5vL7wjkpboxbkCsKZ+Px+u3oMppx0tC8ig==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dw5a8eew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIVODV010043
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:07 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013027.outbound.protection.outlook.com [40.107.201.27])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49dawmc23a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4e0RwGf6zeRrrdETrsb8DR6gDdImAjFauwqIP1m6vTWYOquN8onjbkUfMhyW2F2DO9ogTkxcBVtl6B4FRkeAyY90BE9PDlyQuXxXIPd5NWqaTKKw8UU7FK/LgqhYu5JL6P1RtGMJh4C0T7V4uZLu6Bwlpbeitr377+j0ddw1TOS4Sb3i08O0yEhFVQky2HTBOb9r0zTzMaNgvT99U1MXm2aPRiYibxXidzKwbpUNNe3PesyYRBhCifDdAHpVrvnN6/qkGfNLEM0ETc6pupK3qdXwvW0emeLKpv8PBkScjMvWF/+dpPlVL5j/ZUTUtNyyZOI9bMjQryLHJAb4DUTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYozN5Q8cLkQGxWW8zVgz8JLIGe42eiim4xqepYhOkM=;
 b=oTaYjUWXgK/n+rEIcjFr05wLZ6wMWJf9aRgd/fWF+nJsUP7wRFfR+wyltD+W0FPebTvMUv2NaT6xIMwNH1Oh4i/Y1Dmged+R7sAirgoH6GBqt+GdhbAKT7msnMuW/lu1CAI1Q6yKw35to/TJLzBtTE1GOcI9/GzjRrefyHDbQ4EdaOV63Sm6OTH8TpCh9i+/TXRYpGL5GOJQUSrinQPvLQXoA1Oegv4nm9APO6i9cnetp9eB1PDiEz48sl85Bg+oEEf+qWUreyxZ3QU6n/60UeQmcpsg4eXYvnIbhJs/WpByKueyGA2PO5uyn7iB/mI6s8CXMgz9xx6pdN5LHrTBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYozN5Q8cLkQGxWW8zVgz8JLIGe42eiim4xqepYhOkM=;
 b=umR2ity0IFSOugeL+DX2yyAjGTqYwqxKuD1Z9RrJILG573tdHoAtNO1siPM2ZSI8LZpYp2WsCQlXMh1v+sVRm5LtSRw+S/NbpC5LdPTnxIxuuYwhrYccZop9jKl19FFOQprL1g+rs1h0sdn660tmc2YYBh4vnZ6hdZ48A+zDI3s=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SJ5PPF0687F9010.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 26 Sep
 2025 19:06:04 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:04 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 03/20] doc: Add separator lines to cpc Markdown tables
Date: Fri, 26 Sep 2025 15:05:40 -0400
Message-Id: <20250926190557.8485-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::8) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SJ5PPF0687F9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 0740a3a5-aaf9-4752-b638-08ddfd2fbd53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EVVOQiMbumlJlgZU1jH0B6KxDuZjWxFSoqxzl3zcWg3MGJ0BJk8tKYehy358?=
 =?us-ascii?Q?HsQu610BwcOckgZ3BX3aNG131SzepsTstdI/pTTVW6UI7SaMaFB2Sdv3QH9T?=
 =?us-ascii?Q?qUulBQQkaPLcRhmDS8EEewDuuzs5wV5jrZBmPkA7dZGnRxiSS6e9/dEdv+5J?=
 =?us-ascii?Q?lQtQjonFXLPO+x+/tc5dPIlve9x9vnE+DP5PppDU+bXDDkzho0sNuEwSXGFf?=
 =?us-ascii?Q?GlIUkhT5/s9+A5ynCWMzfsDtmD3Nsfh0tRfDndTQ163yppYpbre26733iGI8?=
 =?us-ascii?Q?c8YuibrZapr+FyjgvRBhqioYYGGyyIWlNiRiwXX3ucWZBRK5Oolxi0HGOKwd?=
 =?us-ascii?Q?JN8EY+skxf4Hcb47RlX5hwJ/uqBATOfAsaseAWej2D4No1r9ShuJgbAGK7KM?=
 =?us-ascii?Q?mUulpdRE0GSGaTPYzVcU0QysRYPhLQ4u+9+PvWZqpa+pW65CkMWvDIOTQrRE?=
 =?us-ascii?Q?4u4S+lOL+QO/CEYQnyu9inZOdUQ7YenuVb9Aru05uqffcdi9tcW9ZkJWTAgD?=
 =?us-ascii?Q?dM3swflqAhFXOcFd2Jr+yMBSX0+z6OuRCUbnhRLdFKE07RoGg8Dz2H9VsgK6?=
 =?us-ascii?Q?C/jvvuh+etC4ciZzDibAE1G+nELjgSW5pF29mfX0KHHUAlip3s9RbxY7hI3g?=
 =?us-ascii?Q?utbMWHgAW2JqsFiYEyElxqL574mE8hqyWRiEKMqeOyYWLJ4x3jj68QY+z+mU?=
 =?us-ascii?Q?CtOtZ9elcMIA+Ek4BSB7Y2liZ4xGCJojJ8YwkTVXUx/AbhifnfUCQ8i6ED+k?=
 =?us-ascii?Q?AyihsFXwUZECSvuzzMfMXntTzjYp2uMi2+ao5ySUzlmqGbaDT2zvImBMiv/x?=
 =?us-ascii?Q?hY1CNFcVolb6coNh09n6xBbbhApoWf5gJ9UPFH1c8R/f0gTGrLEwP5UU55TI?=
 =?us-ascii?Q?mwvzJHoeMWY4N6oywp2qwuUyWt7//BkTljyN3b2bpI9Gi8qxWLCHHJV9sWUk?=
 =?us-ascii?Q?sZ3ty+hfzCc+ewH/VM0/z2sW5lVcwu0kUkhgsX9MoO9IJbL7GHBH5bQGgit/?=
 =?us-ascii?Q?dyIbZlX9vglXa93nmzkteRKIHRdRidOQiDV2sySm59ZoAc54Oa77GpfVHAqR?=
 =?us-ascii?Q?9wwF/xGXs2PqbZ0Xqn7NRxwDACdTU8cJqUFeNJAdY0BP/6ewgNrrYs4aqvfd?=
 =?us-ascii?Q?Xw5LKNX9zPrnZ62p2f+rPsbJKzTriCS9DnuRw8v51EaxFrTIhdiwPUidWV2f?=
 =?us-ascii?Q?XmlYTaasBa4AAYsuXkrfRABG8GT+QI/vP2xROCNd+ZlCSsjXTgl87L6/v8Z2?=
 =?us-ascii?Q?wOlygrb9VBiik3tW9sQ43MiEZ9xnOA1PYxJW1UYasgX5+Z0FtpK9jZM7Br/R?=
 =?us-ascii?Q?T11TIREfWJZEdCVitGjNqMqyGXpgZSxCgEeInXAnS51yDe5CxXTYiroiT2CN?=
 =?us-ascii?Q?Dz+Wt884hOHPC3IoH7b4tdLq8gOIUTEhEo5883ZA1Z86wQXd3rDT1zRepq7R?=
 =?us-ascii?Q?9LdppDwbaRtWHbVx/fOjq2s7xVVYO3ko?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?26lFYejGHOw/ko5b+WEWsX8VHfB/OTIDkKNOrLqm6nEiosaVDKqb2u878ZIO?=
 =?us-ascii?Q?xr9uuQoaQVbYkxmD/zNLyCH4sUjsIDadAKgDczY//I/1vqKZoqE8op+HG27b?=
 =?us-ascii?Q?z54nZBxxysU1FgSMep4gDTp7SEiYqX53l+K342ckIyli/oGjR2HEbOlxpx7R?=
 =?us-ascii?Q?f3bXUCG7a/MG/r082vNmoa7r3avq9LhYwl6S9iPRO88VyVeKjQYfkXru1dKs?=
 =?us-ascii?Q?4savj37VnX5cDx70dgS07+p74LPy63IvoE0RnT8OGsmqf1WRc8HxCyu8ZDjX?=
 =?us-ascii?Q?cO5GAoPURGHAalRjzFzr3XnuPgU0xmunKF11FiiXu7X8hhXapi7EV9ENxNYM?=
 =?us-ascii?Q?UhzQzdKDI21l52rVl44STi53MFfqKJJ/0Hi5PU21fYnihrEVs8RDdZQTjfRn?=
 =?us-ascii?Q?pjFLqPrFBzxGRp7Vi+bsPNJeh2CgEp2Mjy40V5kAjZJ3qGRVqtsdibbdTV+h?=
 =?us-ascii?Q?oj6cfk5j8AjYvM+h8fCAqxvn0Rvr+XBmFJbgfXowd6Kwo65spX8+QdbZuwxA?=
 =?us-ascii?Q?ivV0ni8vyYlPhKk8zUGy1UX2f6C1D0MkU1QK4V59aR0JrB7aauPderD9ebVW?=
 =?us-ascii?Q?1+2oBzG+oCbP8D2vpeQ5qw74sdMpaNHupo68BbEtYp7+vO5xHwJMenNz0Mes?=
 =?us-ascii?Q?MpiAUOvpcpaCaNqI8a+5DKHCs3gRHnx92EwyweJZDNshSYgK2f/3tWwtLDJ0?=
 =?us-ascii?Q?ZcQ9WIDG+ndJ5MkPUzoKAE8Gd62vQYhjfjBIIRIWkLogqhkjn7DuZQFGsNsJ?=
 =?us-ascii?Q?QbcU48eWzOYrPSqfTBoAv1QIGXCINA2Gb0ii4FXdujk3GMwmXHs6S42zW/l4?=
 =?us-ascii?Q?tXjJcnF9lgk+s+sODQ/lcAZByDXqYNenfawbZKnagWGVOnHCeItDMkNsnMIq?=
 =?us-ascii?Q?dkjZqEiWqiVHEzglEdLb43KfqGxppmDrTlh2pPCUPNkJakL2gx+rwHQtz9V9?=
 =?us-ascii?Q?j2e5zyzEuRlItINoM/XUi+IrmW5KStznTk7eq355blvr3joMfDItaewDwlez?=
 =?us-ascii?Q?niJWCHUTTJKkhExR+PyUwzGbuODESzsTLsienrCrWTKlJs0hpNmIsAlF103A?=
 =?us-ascii?Q?GK7otrZyOC9TKd9HyMV5FHDjQO98qeCLxhmTSl3nNpvviGmqn9U8gsH2UAwy?=
 =?us-ascii?Q?7oHOz1xnCgLqstGjv2mZALbnWnQwDotaN16kW2PhAeRsTW5GN2oiWdcexdI5?=
 =?us-ascii?Q?O2FgVxWV6ZJjDFb8mzIxEZlZROQ7d8eetC6PWUftZ5ruFtI6MvOTfAPsBcaE?=
 =?us-ascii?Q?X+CkDbg8fhXUWL0RpeZRRSQK7+S2AlsQ58qb3d/KrYt5fhhg63a7q9VS9nAS?=
 =?us-ascii?Q?GSfAffDDVhZaTCitVHHwsobdCP+tSH+LFwyXLCcXzqEWYliKu2LdvddShb18?=
 =?us-ascii?Q?DsXBA2QhKbb1zk5lj3WcN6M25j9Zvoo99EHH8TWQOUwg1C6lBhDtbpm/RDZP?=
 =?us-ascii?Q?s9lMhXK/6B/suU0Roc6y16g6hXTAGiPFXoWc95/8KLTSNQKxQqZXAEkp0Ncd?=
 =?us-ascii?Q?djRn6W7b4yQ1fYq1EYISJbPZZblUCp+UubGkiF4KWs2Q98k+OqWFBjTCECOi?=
 =?us-ascii?Q?B5RU2LsZkLrprm8c6wrQ0GzFn3tnBLefFo7QlyIv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	77TMxH5hPyNilAdKCaAg131yiMmLI5s89taEs9v77xblbj3OIQWmqhpNrdWJYY0eREl4FsiSL3jtDXe1ySw2MKpUBEmiiIyeWuUwktlcgSrSa8kLxiiWVE+CVonx1ygqIq9iOwapEZa/nzT6uVKRzXG4PAs8MaNbRsO1uONXTCBpMMtGBMNlhPpxeM00xzbJn4PWvHYZ7TZ1eiSp3NnBW1TDFUSsEeKgThbSoIOC/+9xh4zpT3HJYUc+gSJo+L8lL4JwJuDQaIFMW1vWjXSOjJRWvje/Nv4QZ+A9M7ZVENa6EJrEh7DSSKE4TxTimcyg+OVdtIncD7GAMqF8XaLZ5/rVjczOOyjGmka0WYO9EugMk32cmXpLN6v/epSmNQE7/h+xMLuN8vKDxqEoNtP89pigwFqHPheAUfOBObgmn+rthPZE3Y7WalHWQFW5C5AvOzPHjVTTc4YxI2R81uaCBBLCpSrlGfVZC1pwwDjm3F4z2xs1VM4c/+zM9q9uX5v9pYvw18aJH3uiMuGGzfe58L+HC3UC6AN285I9/3SQC4dxlYWxhjbSsbtSLso5fwpijz4u9x+rmEF1irqEnI+wKEsSXgwKr8NOlpWAfZieCN0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0740a3a5-aaf9-4752-b638-08ddfd2fbd53
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:03.9555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BlGRLzOC651Gm4lb1wgXudB1b8TDM6J0ca8HcnZDcl9vU5PXkEeZSUim30IOHMQpe7L8c01rs1PDc5VRjtFPIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0687F9010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509260172
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEzOCBTYWx0ZWRfXwFlw2F9qJ4+r
 rOPqh6MMVoXj8LiFDvAjpjtse92unj2iLIeX57FsX/kciu0D6smQ+NS39zaJsc6VTNgzMpdgM9l
 Qnhu9SS0WQidVcQGhbcbSnnmY2sex3yu+8W6PozXnYeSX59iGw7k5EU8GRMtpS+UxEgWp08wzUd
 9x58ltY1U++EXft61H+z+HjsLZBdaFJ2HNVIc4JzP7wdXaTrkHiglwgQN2OCgC1dLjIuGSkXjo0
 R2zKHPV/WXw4NkIkXaK1eyDLEp7af+qhf5MvO5cu6aw+MzdlAmGFeuB12/bEGECpFnNVfDAEXKA
 bdXFdNFiOXKFBuPxUxWq5a5YBwCSwWYY63p86+fCciJGiDnxkeOx9cLeCeCvsB8KNOSxwM3Se2b
 YdqHn85bMJHOzA0FiPn+cPmzULRHNbeaEntepn1sBmfY+HJ4xIk=
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=68d6e420 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=9l7YsGebT8sh33JRKo4A:9 cc=ntf
 awl=host:12090
X-Proofpoint-GUID: i20NtWC60vpvR3Vs764479-NwjMhsX94
X-Proofpoint-ORIG-GUID: i20NtWC60vpvR3Vs764479-NwjMhsX94

From: Eugene Loh <eugene.loh@oracle.com>

Separator lines are needed so that Markdown renderers recognize that the
associated text should be rendered as a table.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/dtrace_providers_cpc.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/doc/userguide/reference/dtrace_providers_cpc.md b/doc/userguide/reference/dtrace_providers_cpc.md
index fd08567c3..5128d8e8b 100644
--- a/doc/userguide/reference/dtrace_providers_cpc.md
+++ b/doc/userguide/reference/dtrace_providers_cpc.md
@@ -22,6 +22,7 @@ cpc:::<event name>-<mode>-<count>
 The definitions of the components of the probe name are listed in table.
 
 |Component|Meaning|
+| :---    | :---  |
 |event name|The platform specific or generic event name.|
 |mode|The privilege mode in which to count events. Valid modes are *user* for user mode events, *kernel* for kernel mode events and *all* for both user mode and kernel mode events.|
 |count|The number of events that must occur on a CPU for a probe to be fired on that CPU. Note that the count is a configurable value. If the count value is too high, then the probe fires less often and the statistics are less reliable. If the count value is too low, the probe fires too often and the system is inundate with tracing activity. When selecting a count value, start with a higher value and then decrease it to get more accurate statistics.|
@@ -32,6 +33,8 @@ Note that when you list CPC probes, example count values are provided in the pro
 
 The following table lists the argument types for the `cpc` probes.
 
+| args | Description |
+| :--- | :--- |
 |`arg0`|The program counter \(PC\) in the kernel at the time that the probe fired, or 0 if the current process wasn't running in the kernel at the time that the probe fired|
 |`arg1`|The PC in the user-level process at the time that the probe fired, or 0 if the current process was running at the kernel at the time that the probe fired|
 
-- 
2.47.3


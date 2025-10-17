Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9362EB5D1
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 06:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760681949; cv=fail; b=OLvS/XOlD9VVdr8BbQ3zZHcojGA4ZSEX1jGPjTYfIrPyNd4yX6+gu6hxVofr1kriMBNBkeCDyE8IfReCoszeXwWL9qsyt3ktVaxPvMghDaK5DE8xdsB1i2NUTh7DzFZToWtELvlB1KxnvqUzi3lYlVKypCAVhFkMVSLbd7NS1k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760681949; c=relaxed/simple;
	bh=tFAxjhdocfdRFnV6xq41Rx/Arg2XRVG/aeLv3UBna80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HBYcZHxh97JpqOhgypGW28sgDj1tTLjFajO2UnyPRgeEc7ggQYi1lM1d8TH7C5WrkxvA/ecRAh/AI7PVy0EV6mPZti8vGL4bFwFpv5rAcSBCu6VQEeNraAm97yNSHtyAai8esFcStd3yR/xnqwn5iBJYRPK2DjAp8mKzuUGvrPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ns7I9vC2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xu/hQRnV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ns7I9vC2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xu/hQRnV"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GLuAiT001457
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 06:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=gnkGr/9jkGjRkjKopg
	5fGI8FLS5HHEUH2rIc3KDVaMo=; b=ns7I9vC21Bq7p7f0vhBjcyZwV4ID0taphx
	PsgJYwhK4RmyXunq8VeRRNYLGEtSI5ZQXw9eK3RhNGSTDe0dpqw1LVUTsXGWvQQP
	yXjgTebX/U4i+DU3K5ICBIupoO3NO08te4sA0CYi5F+1Fo0wb3IinXhytHFAr1jR
	cTeOgqWCsN2NrO6RyR9dIokZFlU/rrq5s1oxG/UkQHf61U8vWHVlvoaJzDNDZ3eB
	c8kTdEw3lAa9tti6+i8JemsYv1CcfoAH+VrCih/gGoXHlzCbkGYsOdkpCSixOySF
	Z+HRioySPIDqUr9nIPCLcTbxxVDBZxe0Pgo6NCndRkxZabosGzhA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qfss2a0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 06:19:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59H46F4U000777
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 06:19:06 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpcnuvr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 06:19:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8Q0ufKg52u++PXXuTVXpO4dl4WczvTdDW9i8qzswEjOhuNEpJlZo0MEZ2haxpS0IovEmKgcy2mGo0cWFjw9crFBbJNcNMJFPwyvqCSoEuPfCI4gVYZpj5yN0qgpBOWDnFSHBv/GPpNlTvQN6MrDBEVptuXn0iG0qjM0zQE457/zNXn1PKvH4O8l0pLdJ3DoYAhSY9QQTR7Cz25OIeygwakd+QgV+P8DRRuO6FQYH0/ASM+IswH4qbHsL7OJiykMbk0EghIoaEkSq2pSXo/OoTqP+5T1Gf0+curOyDfTdaC+D36jp6zW3RsrChLbYH4K826OotEwIKD74J54z6bUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnkGr/9jkGjRkjKopg5fGI8FLS5HHEUH2rIc3KDVaMo=;
 b=Qgq2EYpwZ4WYGyRMLSM04D+3TaP2FCsjsUWW8S5EkLGNszf9zlvb+uGoMo6ALYy6nIrtjrbi44idSm8B4YabsCnyqLTQNuXJe/KnF3gvGGzwGd2NISanNK+lg2AP7CodwrXqDloD4yjcCzcr2GHtm/ilBYIcC8t21zbkw8U9r0o5t/iwiXDw+49PG0hgZU/yBJiZjHkUtCNq+OUdHoa7hf/5yIdRBlBhzx9JUPcvOsMUwvoFLVTnE5FFy23ts2vu6KK4sNZ/2EPQIpuIwo4wDBed+yvFucu99rOXsITrHAQy5VXP/zfFYfyvizc8RXKrksR5eh6afjJaoVWZd/BoWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnkGr/9jkGjRkjKopg5fGI8FLS5HHEUH2rIc3KDVaMo=;
 b=xu/hQRnV0TvWYy18psKV2UpM6YCfHrNQTX9NPfFMeeShdxFzS74GeNBcrjWXq5lX8NRkyI0bDjWsAW0bNF0KlI1Kj9zD18sy2uQLxjLqOsZj707O8S9OGuxbMTPqijAI9tFgUSDzswbywXccaDmwkMwfzewARcZqN0ZfBhJZtBc=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by PH3PPF7B51A0F8B.namprd10.prod.outlook.com (2603:10b6:518:1::7ad) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 06:19:02 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9203.007; Fri, 17 Oct 2025
 06:19:02 +0000
Date: Fri, 17 Oct 2025 02:18:59 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Clean up stack_fbt test
Message-ID: <aPHf07N4ISwnhK7K@oracle.com>
References: <20251016205641.15446-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016205641.15446-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|PH3PPF7B51A0F8B:EE_
X-MS-Office365-Filtering-Correlation-Id: 811e3552-e211-42b6-f004-08de0d451119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0zGCnuS1pOLhFmevVNYMepTW1XmQwk7tXH1/OBt7NYda01FTiguIHBSYEh4X?=
 =?us-ascii?Q?ha49hnjZxNU3M3Nd+yLnI6J7XNXctJ32w6V/hnLe71fXooB7uI2iGfCrTEZv?=
 =?us-ascii?Q?RT1v75u8JxdK616zByRUKgU//5nC/d3AjJVAoVs1tKBNOIL86nyXHWU/m120?=
 =?us-ascii?Q?4BSfwfQsbUMDG4xfV8iLmifoMuerLspbudPpbwUzI+T2frTim7kLsg7jIYBk?=
 =?us-ascii?Q?Ip3YzrVxnOF13XqADFmViVJG53gvT/T8MHd/aaV8DpISKZlIyeOm8oO2bmdO?=
 =?us-ascii?Q?JurvlWy1nj+HbjZLGvzn71zj3VfooJR47wOEtZaQ7+zCGsu1w79LFvaSzmKZ?=
 =?us-ascii?Q?H8d+S2EvEParrm+YinjsUMBHlUpc90/L5hdyH229t7sbWM9Ky8Ok0unWjH6o?=
 =?us-ascii?Q?ZMxn4Tec5806saXgeB+jEMavADEVsMkVmRUMge3Vel+34vLcarV35Hn+IXNr?=
 =?us-ascii?Q?1P5YHq4yPa4NxE+at6A7c+FFtQaQO66UXQEvgiCW8Cl1L2Oi6scnK1+J8vxB?=
 =?us-ascii?Q?V3sy/m28yb20VHPfuzaB9ZEXzUfrlMOR5ENSBdt0xiGBNCn8MmM1VwN3sZ1o?=
 =?us-ascii?Q?9tZE6RJyg7Qco5EmBCwwu7OkYBjKFyvyaf/O5E8wlrNTqlSMSBXKhznPbiBt?=
 =?us-ascii?Q?byEgIo6JqLl4d8Y55Y5NPH+So82lb39y8L1hAOQgQy2i04TmWa7jRAu9es/T?=
 =?us-ascii?Q?JWxfp+104e6E4KWWr8nKxMDc0hY6I7adE93k8y/cVWf+r6HWRzc6DUuQzq6C?=
 =?us-ascii?Q?q9qts7Yve+eGhiEOX4N+oikTx5f8+hNzLRxZPKxtTGdTfzuMmRNgAp41eCD/?=
 =?us-ascii?Q?KkMaSI4B3i7ZARrM2howiTWDRi+vh17aDvX1OuBiZRcp7VZgSFkzXLCCGFBk?=
 =?us-ascii?Q?7FCUNawl1WtzCAMkDYq74HVGc9T/qoB0iSvbRj5gTn5kZccxR2SuskFtf9tZ?=
 =?us-ascii?Q?OWExdInRQ7aVDSG6raxTZ1t1qHUD0KG7UKS4wX8Mh4Ysx1TNokwkTy87N02H?=
 =?us-ascii?Q?oUCNV9bBt1vcpME06I2Ddp9q1R6uDzsFJjP4Ix6+cV26k/W9sk0Ud+8A1ZdD?=
 =?us-ascii?Q?28gDPiYDkG0RgO0wZ2+NC946xfHnfyVT2axNYEP0Xw951N6HDlwz8g+QCq2c?=
 =?us-ascii?Q?TrUFJc7/qNfna02ntGlefb+DNZPbiRYDa1GeRhLJOytsA2MVsIoTSklCnDcW?=
 =?us-ascii?Q?5DOitnJN7nzfNdTvS2o4Rkq521J8M50FgZ0Z4r18BmxTv/a92V6shQTFEcEK?=
 =?us-ascii?Q?IYBQ+nYIkXbQYIg/Fj2FubwBQH2em994AMgwJjZ70W/38bVR0Mgqxu9IYl2S?=
 =?us-ascii?Q?pN5Yx8yswSPHHPUwvpZKIRvEtM3bBZhcPA9xSeSki51D97UY+mSwf2Yn4QdX?=
 =?us-ascii?Q?El2IvAtoXuYsv9kWMpuTMgHazAUp6hdR0HgUHMlhLmdXqaOy/BLKgYYl9/yF?=
 =?us-ascii?Q?VSfdTs3NdbQfKwJtl5AsT6nY9gIgZJ5GleEPJad63ddHzK4Ek13UVA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OmOnmRRX1TZ9ePMQ6lJvPkGxlV67ym7fVl45Tb10g6wWVOMv473RsmWPGzXQ?=
 =?us-ascii?Q?480Bur3rydmnhv5M+MzkYL0ko0OqnBVCgCcPOW/myQ6q+Et944M7gtZiPuc8?=
 =?us-ascii?Q?bPWmVRbOqcXafdSk0v9pphp3rxJZlsnwsSDx4ejU1jgIZU1+rIR+qtXBlTn3?=
 =?us-ascii?Q?3hLAuCBMr/rzVbQL2Jxut55cN5fFX91R0zGqjRZZkmEqvz4ZzdGcfQJurR9b?=
 =?us-ascii?Q?kL7eIXuSmKootKuTvsMDtuQKij1q1/RmewHwTw6M3Nx1+8ZgxO2r5bQ5BDj+?=
 =?us-ascii?Q?AUkFgYMBZjZXHS82zc+VXRJrtV30Ckqk9PwakO6LaQIxc5zY78a9ESSLjemw?=
 =?us-ascii?Q?6/Dez3v+kWs7eY/QSSEez5qPjFjzuP83gTGKYKohmeCtDs0LbVIR4GpV3WNb?=
 =?us-ascii?Q?NEoxlWx4pQ57IkkE8AYKCysU9JtbQtkWdgoqrXbVcTvZz3YtC9klQaZJjEmV?=
 =?us-ascii?Q?owN9rP24JfRhSPGVYvB9jrTjjbjqUm7YygMm/N9qrNfQxdbLOb3vy50+9Au3?=
 =?us-ascii?Q?ADlB4kskSmnsTHyvfagSSChiMz3jgWctYv2YaWhJM9d9I2qCLaiTbCuywTXG?=
 =?us-ascii?Q?pzg9Vzxoh+6PDx6syopCEzQzdZbMK6UuMFNX727TGCRa+Cad/j+Po+ZLRoq3?=
 =?us-ascii?Q?pE8aihkYmLLn48TmB10Y9NIc1Mvu5I7m7eyz8jBOS/fg0+7f59xYqTJUaXhz?=
 =?us-ascii?Q?Cvkto/8dtP37URT76ovhVAJxBDYkHQu+0FEEGA6u3wtPyPVaUXhYKlvDX64h?=
 =?us-ascii?Q?Vse2K54qe/tEWutuEHYHm1QLMna7GnmRVTaFhfnqya9P6Rx20WEEMuFQqiGW?=
 =?us-ascii?Q?X7Et9IaYb+iG5EyDICFHusoJNkqTF3M7oc9KhRSIVseU5xVq0O+8kzoWdQRs?=
 =?us-ascii?Q?KLPST6T2R/Nl9tJy7ojoMKss2mkVHe+rDhYqTDAJYft6Xg8b18j1oiecKlCj?=
 =?us-ascii?Q?yQVk4pTzSFwCL8TADn9Gr3wdtmNPJ5km3XEYQxbtU4FnD6P0hawjxwrcD2Ed?=
 =?us-ascii?Q?6Adv+VN4DVqc0oAKUlnXw7/ZwYUBHfX5m5WZPzT61GUKkJkjOmL/rTE1zXmq?=
 =?us-ascii?Q?7nWyV34rMAvC3NjOdzOyXN6v8PNkFg4JyukE8MdxwC/yI200HmUoxnMhAGcX?=
 =?us-ascii?Q?tFmIEBocDcTthWK5i+TeMmWYI46wpbfDe+epuL+Jan0QYWE8sZkaU/vOUw8g?=
 =?us-ascii?Q?FGMfO/WpX5QpRCH62dX3ZkI7trG9dI7po7KpJ+utgXTRQmoOkvlMHizxzzrq?=
 =?us-ascii?Q?iVznKsKHaBEv7Iango+rfeqp2d/gE//ft6H297dQIIzNwNvmrv/4vbIAUvnl?=
 =?us-ascii?Q?2foNpa69MktjpHyw+p+ywqSGYDDvBHaiao707+Sc1tDRbFdF1EmnQ5FhMlD7?=
 =?us-ascii?Q?u3g2otREkQg11Q4bTGWsdJHDdehJdjfyeasiMIpZYQLbYdkO++8CU9jEZiPq?=
 =?us-ascii?Q?w8U9sHq8X7c22TBUx+9dwoFgpXpSbWuF78klL7q7pQf8p/toa92/E8+5IiwV?=
 =?us-ascii?Q?yNQtWlBIKlOI8ImfNP4KCODospcWzKukMNTHkoAmi81DU5c9ai8R1dJqcXiC?=
 =?us-ascii?Q?azHH3XTBOJlWljVdZjjyoY6szOtlmuP3k3GWwDFL/HGT1FJ/oKx/9lYxrdk+?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bzIt0u24+pvh3936VikyZSTDhIL+xbAggYpL60PF3/K1qnXxhx7KT6OCcpJeWQhxnxlZwXjx3fkEH4fzBJwzFrLC41IfSdvhsV+gXxN2SY4RPwouBWkUj7B2Hnocy6TwAXx3g2VpHSP9DMSVlersVkDj5m+F4eVaKCpFvYF/UvStSb1l7J3A+va29jSvGs+2S8Fxk7pol/FSdI2PQ/n0z4vDVnc3Tg9N2rn+Cxuak9WSQAVNoU6EOJv5ZxMRrUfAoUWkQeylqnOfQh8LucIyBxBTeptuUbEnxzu87h/Ci/hcv0EcULFwLnS68C3vU0vTXPMkzybB67QIcrZoxsXMQFjhghu403V4FkDjZ1cMWTeI1o03/sQhPZmb4x8A4XWSrpda4k0IjWy+ERv5jkzz1Gxk/HeGdCIYdRTV0zfshqVsD1I4UjttOIv1EGfcmIj2aDz2QwFUGXv2N35FRr4tfn8iLJJB4xU/OrPTsH6KCboT7/Mf4KoNq7vcI4OzoQRssLiGYgUhu0h12LZYHnMv5VoCQFP8jeqfBk/Du/P2GY8Tai2TiIXsWgTwwUw7F2n+7i59WbXzjchbkjz4Q0Z6taXg36IX6GkKpllQZBIWUMg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811e3552-e211-42b6-f004-08de0d451119
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 06:19:02.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3x2Lyi4HHP0dCXqrYNe/7n+Ps53qd07+dm9WEA4PUM1OVMkhXXSqGO60I0sUSXcOONji/CuVUTV8TA9UNo0VfjotJat8MDt8fCSSGRFMoV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7B51A0F8B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510170046
X-Proofpoint-GUID: ilJvH8nYxFKSKXHDJhzHGD5gVSs_m2xD
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=68f1dfda cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=CPrLnq4gB7N6bv6KgjEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMSBTYWx0ZWRfX8bGodPH6SdiQ
 U1RjUwsB3YxTHnOL1U0nA1LAWDOzcdrDax80HyctcJFNrokpGJEF468UVYKhJPSmlVLZgF4mUaI
 kf0+WOodOk/LScktA8gNmwOWRmCHeDTmeTEYUPY/8Dp1ykGnQUbsZVCqouJi9NZeGbHf8VliYaW
 zIkBicye7zkHuETOv6Abg2Csbxd0ws8HqKSKsI1DBiXXSoJdHFHsoPDclQeen/BrF7KH2jOpX9h
 2BgsnM4nCqh5YzkPAoQQAbdfggYHaKvTg5RrT5zB6UV45+IWc+I7fLkORIRdvQXnloVwsOXaVJ1
 bexgd9OZCSs9d3dIaL9WCILGR5i2nhOQWriV+XcKTyz3QJFGdUjdorYiwihfQnrK6Osd0I8n3+i
 zc8GzwGPAy42Vv2RVkfR6S9nWvQidQ==
X-Proofpoint-ORIG-GUID: ilJvH8nYxFKSKXHDJhzHGD5gVSs_m2xD

On Thu, Oct 16, 2025 at 04:56:41PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The idea behind the test is to check the stack() output for some fbt
> probe for specific expected frames.  An attempt was made to specify the
> exact stack that was expected, but there are too many variations among
> kernel versions and so maintaining the test was difficult.  Loosen the
> test to check for only a few expected frames.
> 
> The test was also checking that stack()'s first 3 frames matched
> stack(3), but such a test is already provided by, for example,
>     test/unittest/printf/tst.stack.d
>     test/unittest/stack/tst.stack.d
> So, drop the stack(3) stuff.

Since the kernel implementation can change between versions and architectures,
why not just verify that the function we're probing is the top frame, and then
perhaps for sanity ensure that the rest of the frames are resolved addresses
(i.e. symbolic nmes rather than hex addresses)?  Although that perhaps might be
a bit strict because I could see some architectures implementing the syscall
stuff somehow with dynamically generated trampolines or something that would
not have addr-to-symbol information.  Or ksplice might even cause that if the
splicing took place while tracing was going on because we never re-read the list
of kernel symbols after dtarce started.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/stack/tst.stack_fbt.r  |  1 +
>  test/unittest/stack/tst.stack_fbt.sh | 89 +++++++---------------------
>  2 files changed, 23 insertions(+), 67 deletions(-)
>  create mode 100644 test/unittest/stack/tst.stack_fbt.r
> 
> diff --git a/test/unittest/stack/tst.stack_fbt.r b/test/unittest/stack/tst.stack_fbt.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/stack/tst.stack_fbt.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
> index 15b85be13..f3d321e7f 100755
> --- a/test/unittest/stack/tst.stack_fbt.sh
> +++ b/test/unittest/stack/tst.stack_fbt.sh
> @@ -5,7 +5,7 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# Test the stack action with default stack depth and depth 3.
> +# Check the stack action for expected frames.
>  
>  dtrace=$1
>  
> @@ -26,8 +26,6 @@ BEGIN
>  fbt::vfs_write:entry
>  {
>  	stack();
> -	printf("first 3 frames\n");
> -	stack(3);
>  	exit(0);
>  }' >& dtrace.out
>  
> @@ -37,17 +35,16 @@ if [ $? -ne 0 ]; then
>  	exit 1
>  fi
>  
> -# Strip out
> -# - blank lines
> -# - "constprop"
> -# - "isra"
> +# Ignore blank lines and strip out
> +# - ".constprop.[0-9]"
>  # - "_after_hwframe"    (x86 starting with UEK8)
> -# - pointer values
> +# - "+0x[0-9a-f]*$"
> +# - leading spaces
>  
>  awk 'NF != 0 { sub("\\.constprop\\.[0-9]", "");
> -               sub("\\.isra\\.[0-9]", "");
>                 sub("_after_hwframe\\+", "+");
> -               sub(/+0x[0-9a-f]*$/, "+{ptr}");
> +               sub(/+0x[0-9a-f]*$/, "");
> +               sub(/^ */, "");
>                 print }' dtrace.out > dtrace.post
>  if [ $? -ne 0 ]; then
>  	echo ERROR: awk failed
> @@ -55,77 +52,35 @@ if [ $? -ne 0 ]; then
>  	exit 1
>  fi
>  
> -# Figure out what stack to expect.
> +# Identify, in order, a few frames we expect to see.
>  
> -read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> -
> -if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
> -	# up to 5.8
> -	KERVER="A"
> -else
> -	# starting at 5.8
> -	KERVER="B"
> -fi
> -
> -if [ $(uname -m) == "x86_64" -a $KERVER == "A" ]; then
> -cat << EOF > dtrace.cmp
> -              vmlinux\`vfs_write+{ptr}
> -              vmlinux\`__x64_sys_write+{ptr}
> -              vmlinux\`x64_sys_call+{ptr}
> -              vmlinux\`do_syscall_64+{ptr}
> -              vmlinux\`entry_SYSCALL_64+{ptr}
> -EOF
> -elif [ $(uname -m) == "aarch64" -a $KERVER == "A" ]; then
> -cat << EOF > dtrace.cmp
> -              vmlinux\`vfs_write
> -              vmlinux\`__arm64_sys_write+{ptr}
> -              vmlinux\`el0_svc_common+{ptr}
> -              vmlinux\`el0_svc_handler+{ptr}
> -              vmlinux\`el0_svc+{ptr}
> -EOF
> -elif [ $(uname -m) == "x86_64" -a $KERVER == "B" ]; then
> -cat << EOF > dtrace.cmp
> -              vmlinux\`vfs_write+{ptr}
> -              vmlinux\`ksys_write+{ptr}
> -              vmlinux\`do_syscall_64+{ptr}
> -              vmlinux\`entry_SYSCALL_64+{ptr}
> -EOF
> -elif [ $(uname -m) == "aarch64" -a $KERVER == "B" ]; then
> -cat << EOF > dtrace.cmp
> -              vmlinux\`vfs_write
> -              vmlinux\`__arm64_sys_write+{ptr}
> -              vmlinux\`invoke_syscall+{ptr}
> -              vmlinux\`el0_svc_common+{ptr}
> -              vmlinux\`do_el0_svc+{ptr}
> -              vmlinux\`el0_svc+{ptr}
> -              vmlinux\`el0t_64_sync_handler+{ptr}
> -              vmlinux\`el0t_64_sync+{ptr}
> -EOF
> +if [ $(uname -m) == "x86_64" ]; then
> +	frames="vfs_write do_syscall_64 entry_SYSCALL_64"
> +elif [ $(uname -m) == "aarch64" ]; then
> +	frames="vfs_write __arm64_sys_write el0_svc_common el0_svc"
>  else
>  	echo ERROR: unrecognized platform
>  	uname -r
>  	uname -m
>  	exit 1
>  fi
> -
> -# Add the first 3 frames a second time.
> -
> -head -3 dtrace.cmp > dtrace.tmp
> -echo first 3 frames >> dtrace.cmp
> -cat dtrace.tmp >> dtrace.cmp
> +for frame in $frames; do
> +	echo 'vmlinux`'$frame >> dtrace.cmp
> +done
>  
>  # Compare results.
>  
> -if ! diff -q dtrace.cmp dtrace.post; then
> -	echo ERROR: results do not match
> -	diff dtrace.cmp dtrace.post
> -	echo "==== expect"
> +diff dtrace.cmp dtrace.post | grep '^<' > missing.frames
> +if [ `cat missing.frames | wc -l` -ne 0 ]; then
> +	echo ERROR: missing some expected frames
> +	echo === expected frames include:
>  	cat dtrace.cmp
> -	echo "==== actual"
> +	echo === actual frames are:
>  	cat dtrace.out
> +	echo === missing expected frames:
> +	cat missing.frames
>  	exit 1
>  fi
>  
>  echo success
> -
>  exit 0
> -- 
> 2.47.3
> 

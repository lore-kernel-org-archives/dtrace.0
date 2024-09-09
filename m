Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CED817588
	for <dtrace@lists.linux.dev>; Mon,  9 Sep 2024 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725909030; cv=fail; b=AyyJNlIZ/+x7IwgkEHUasvYhHQPe4n0E2iuckKFtsbeAtyanqK5wrOEss86gPCdb7xSNHX99dfEqpMg5cDdjBU7/qVjDGlm/nV7vcD6rG5Ba4GEIWt7KC744GoiS6HHutYHzUhJWZZuOhMFXzCedFi8yHxWWwyKwzIuH1qCyk+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725909030; c=relaxed/simple;
	bh=DEO+TQS2hUUxou4gzqGLBMYH4zqRTf2mOSNQ17EkAZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ct+17RxCTRVOo4MgOgPtVMBO7W6CbQkIazwLQHD5sdgfW+emDDKPytu5t1Ta3gy33O79viyuQN+JpP9h9pUYLWnDIhrqUvHrtgkw1ci9P7w+jDrl3H2L7QaTUJR18hsc2Pa2cNZkDgmcwcqJ5nv5SaNMk7dg9CiLRlnKCxFqWKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gr2Okc0X; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JmbFTw/V reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gr2Okc0X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JmbFTw/V"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489HBUic005638
	for <dtrace@lists.linux.dev>; Mon, 9 Sep 2024 19:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=t9UeCo8JO5bbwtEVn6GBFaYbsdWmNj5yX2VNjS4FPFI=; b=
	gr2Okc0XH49s6NFWL3IHquiyWAiT6G/YR7UCNU+/GK+gzLgoJEU74ZepXqnmDbl2
	AUPbrNJ8pjvWdc3NWkMIIFfBkj3x7QwTwEp5Lst1O3adpiV3/CyZDUV9oFfTFt+q
	enduIADxfSotwZT8NFFDWtZYBUtTirj6pWz5WucgmhcNBUYVKpvlv1+wQyHWbm66
	zLbUG64Sf3mcG/mR1edCqoA5uNovYMO7B1nQv0OViFB7kS4FL4ZOYKsbd7XgaHqz
	iv6q45NvW2QGemb+hmbWzqTw4gI+t2Z3eYL2DiDGjv9l5v0xrqlyOdUHo7apmcGi
	Tp2Ro/SPdqGeEEmJC5hzgA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdm2kvb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Sep 2024 19:10:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 489HR9JE006247
	for <dtrace@lists.linux.dev>; Mon, 9 Sep 2024 19:10:26 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd97kqtn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Sep 2024 19:10:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxrO5btJHjVHu5S+q+HmG/zrUceqBSBNjGOnQd/zFldVr/WKaXupVUV3oKLSwIQzXsgHYaoJmEfPb7cgi7j/StUA1SFEpaoYZLncUqP0fsEDKsctB7eXfNIvXN3s/Jxs1W439kkMoOeEasWydKLKXK35KmfWCtdG5WVWTqL6GxqSrHb4YWTsF61AMyWiJ+4H8ru4fcFewsB3IQiHVfUr1DdseNKt4iNRwUkG6HOfxqXcs2uHDFAT1TbgVkzxZBJL0w4I8nr+y6oaIuQMnfFFwqLHZcy3F6qCkasdYERmlqBb4er1g8pZEpzJhrNNgfNz+pY5pUpTy6EfKdZLesARcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpwG30I2Mb/IGdW8mx0NKUOy4NgdRXfy2/qEpEORhpI=;
 b=dXrt6Str/2WOnr/VZ6BZ9d9Ot5cFWNQKMO6HEAjc0UWD1m3rd2emRMlGzfVO1VzD4pizo8S+JUMqpRFw9zw0Zpu9ebtl43SJlznvPo9+2ToOQU1BmJphxRI7bMhJnmt+zdtRIF7dFty6c0nmtd5G6i/addZs7nKAH1w2FWuu+fL8chMIu/v8PKu3WV9jous3/pmymxgv/gJinrJOC3WlRzm7ZT/5pQkeAHfDwXrNvTGoILOhF2cuBZKFMpG1H5wP5rBhDw3X65DMm7hbKTDaPL8KHiD45tNF0o9TUFs9SUpBqHXnQjLt5pbk0+gF+jDMNncRjOGOhXCebrdsLe7hOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpwG30I2Mb/IGdW8mx0NKUOy4NgdRXfy2/qEpEORhpI=;
 b=JmbFTw/VyN3Ntxu27Tc6z9g1rPsg88Q8KxcEn0XxfRF4GVccjpBVF+PqIgxW7QCE4/yjvEmWSzcZqjZ+j5o3UsKzb1JknCga4WEjiQSmppBjCI5XYy7gJ7dBgJ34RHP+B4M+zTFcoe02vPovGWCNd8RwfScI2xnUXdp7tzDpF/c=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA2PR10MB4522.namprd10.prod.outlook.com (2603:10b6:806:11b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Mon, 9 Sep
 2024 19:10:22 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Mon, 9 Sep 2024
 19:10:22 +0000
Date: Mon, 9 Sep 2024 15:10:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 03/19] Deprecate enabled probe ID (epid)
Message-ID: <Zt9IG5yxNCR8wSA3@oracle.com>
References: <20240903051643.17203-1-eugene.loh@oracle.com>
 <Ztp3paXrmBIuigSb@oracle.com>
 <536b6eb4-cde5-709d-d93f-1a442a0aa9d1@oracle.com>
 <Zt8w9uRKDrZVG1Ik@oracle.com>
 <ec91cc0a-eb07-d6c4-0ee7-bf74f1cd4b62@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec91cc0a-eb07-d6c4-0ee7-bf74f1cd4b62@oracle.com>
X-ClientProxiedBy: MN0PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:208:52d::20) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA2PR10MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: 44378c00-6003-4f82-149d-08dcd1030db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?vVJad/7+7N9QetLDz2i2rOilcOcGf1vFH2a4rBq/YWgBqzhSJ9th58nU6k?=
 =?iso-8859-1?Q?XQUUjAhBTQvct0lDcXkEOPsvJuJ2D69dqZQ6IN/u78kvZfbnbiwczeMrr0?=
 =?iso-8859-1?Q?eobceWDUFdmGmkJ/410qUGuWq2Zl0SlpSE6BZkoNwxIlF8K3x+Da+yYR/W?=
 =?iso-8859-1?Q?SiLb6WuSwnawHuNx0BcN18e7CZyP7RvdxqVSlnCR2A8YYcC3IlNPkmO6SU?=
 =?iso-8859-1?Q?LCrSlek5mHE9gJ6SzI7KLqhz5dgQZA/YSzGN3Br7lDyUhcymgBehxCMFOL?=
 =?iso-8859-1?Q?ZxU7aVs9t0tJJBOQ6NJo+b1KxpJUYiJfg8WV7ZPefsfFi9YzNGlgseOF15?=
 =?iso-8859-1?Q?KlbUPybIo7GSB32tk/1KQPYTnUn7QsK718cYw+jtb9jj3fLC5OfD16hQs6?=
 =?iso-8859-1?Q?YNmm0xmcnWf5ehorPELwnx6yPkS+jLrqQjL1d2GmrxQF3QLvq4BI7BzwdU?=
 =?iso-8859-1?Q?09JO3rH/5t//tW6ByK+dQyIeY4TOULc4XGTmGxfce3CmmYGkSfpDe0Mq18?=
 =?iso-8859-1?Q?pXWjHzE+YfwbwPbEeklo88F40/Vh8/9t7iVgMEs5MBzuHta0v6Gv2wzXfG?=
 =?iso-8859-1?Q?Wbc99+oOLTxFEIVT7XeimKCXcWAsXvweo2SWVhIQeawm1O3pFLGb8yCnPp?=
 =?iso-8859-1?Q?KR1R2ksqy78OYe8PbE1zU4GKTIgDkGMwdwiT0gjbLh8AQbIo/IqABjqBNH?=
 =?iso-8859-1?Q?bZPLy+LMVEfeMdGs9MwkCYj5u3wBjI8p+aLSRQ+4oWgEBgdFKfHjDsweV8?=
 =?iso-8859-1?Q?ceyXY3/+bF24yh/RT+LO5+3o26Aw6zqcqs3jvmkQOPxK10G+u600z5v5G1?=
 =?iso-8859-1?Q?eUCbmas7ChXS1I5VZPkWzsOoE3KlBP++crflJ51+hO9TtVtd9WwLrLMdYx?=
 =?iso-8859-1?Q?GP7vqKFzJXWfsQiZVEiCjB1SaX08oBi1codv6nUG46bSpj7a+AjJvsenz0?=
 =?iso-8859-1?Q?uwy367G5Jzyc2zoTK4YUpgNXL8Yi8Pfb3PhPP9NTx/5BN/itsCXb9RssDu?=
 =?iso-8859-1?Q?hUZAV1gPHV/Tv8BG2eMtJZ1lXC+0hIpDTOlgGXyk4wNjCQfhK0gamYmSU+?=
 =?iso-8859-1?Q?/2Pp03odeA6QzQzsPHrZgpbJJJU5di3QDApTCLqdeQgHwCvsck9oaR3r/A?=
 =?iso-8859-1?Q?jRCrzojQn51Qs74j2eHEviyt2xm1YDYRC/oWMd+/F8z1vK1fD+pzO5byWu?=
 =?iso-8859-1?Q?oN9d80VnPoRVvzSXBigocfm+Wb4kosxtUKXSlq7leq7fqYX4jea4HxYVNP?=
 =?iso-8859-1?Q?0tW3ZNCo3CBFe1F8bPT4lnJ99K1mghKfFOo+MNWMudlCCs+WbPv0sjARPS?=
 =?iso-8859-1?Q?kLvOn1Bq3J5RMOmZIVIqYGCTySLCzEJvnV1LBUYgQYR3PC3jO8xRKeTvx4?=
 =?iso-8859-1?Q?U5P4AINZPbjXvyCXcCHNZGtPz+sJyDow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?fbD+y0SQs6jXFsLexECOsEShvNeQg2SRaxVm8mx2K22AO6sSADQ/7acQhB?=
 =?iso-8859-1?Q?IPN6DgmuGzUe6y+f47Oz585tXHHY5uySCdM2WleVGgxnnJ71iLfLskZLtH?=
 =?iso-8859-1?Q?gQpZyb5o7Grt/mi3nDwjuJw5c22W7hOPXh7oG8N7lAcbyXMtVImeKMBSOX?=
 =?iso-8859-1?Q?dczecOZKDrCuOJNup6D94iW3qHhJFeM5fvCqBV6YA6i5LZh2DhwRzZlvZk?=
 =?iso-8859-1?Q?nD+DuogKYUIHqpqlHOv1jwGUp/Vm6bd10i5moih9G9AEXOE+Ncf2LthExP?=
 =?iso-8859-1?Q?agXoGaPHc62LRxFX6IIAQb7+dnfLChVYtp/Nkb9t8DoEo6OgTZYILN8vxH?=
 =?iso-8859-1?Q?xqbyPZNP/mpNPf2o7duiHjkbgZbvCUfeCTPfpGBi+cYBrKx6jGgnyHxRHc?=
 =?iso-8859-1?Q?uKosiLweKDhb8IaTlR7UMVkt5dkUg9lBIt9gnPUi+BIjfhobNDpfQ8Q4K3?=
 =?iso-8859-1?Q?xU3X0piKCpktWMVIwSs+fhi+/6ZS3Tb8IsBJ1v6aYyuiZXI3sVSO9+Vd3Q?=
 =?iso-8859-1?Q?Bwotn9HKwH0UFXGvvJh4pmSZjXD43tgO/VgVCvsixt+lFMS75Rof7Ep/Rb?=
 =?iso-8859-1?Q?R4l7v1BZpOUZeTgDu/avb++fJGiP0kRy/V9wV9qP2LC8VSZPs/LBzA3bY+?=
 =?iso-8859-1?Q?KbkFNLYLXbr8NOF6YrtHi0+vx+Vth+wKR0S7aDc95Cuqq5xQLmRtt4I32g?=
 =?iso-8859-1?Q?EmWZN0ewc5KOiQ3P7eB+4BYV4jVD+9gGceoyyhLweI8XISPXUad6Wklvl8?=
 =?iso-8859-1?Q?dEjowCOLr1cj3Vs/ATjgj0VJzzQF13qrLoJoOs5JxT5KMm8XWNgdWxk8Xo?=
 =?iso-8859-1?Q?N8FnPHQk55Vc5VJUkJ5dy/2A0A4y4ldill1HKLdWjcFP24Bck5e6h5sDzS?=
 =?iso-8859-1?Q?XQ7oZRlxYLYJGdcUQed8jKAGD2XXmVci+gMM+b8QdRD7LxTDVz88sX+PA6?=
 =?iso-8859-1?Q?Qph019aC7hzCwfHBBa7jdapCcK9mhqi0kWjzHGuzfBx4KYRS7d57hAxR1D?=
 =?iso-8859-1?Q?iks+EeTI+LjT5cpxswL3p/FinpbU/GrBH6ufBAZ9G9LcV0m1TQE4KJjlbs?=
 =?iso-8859-1?Q?CKtYrtJGEmY+h4jglceKRwq4o6N8CS8ewIpKEk3LeLIbLbZc7K413uXgOJ?=
 =?iso-8859-1?Q?Jk6k2sr6zc4cpfHb7OMK1BppimiVAOnm0kLJoe/kCqEUir3dO8NBSLYYW8?=
 =?iso-8859-1?Q?AcoA57fTXxZDMO+qR+XbaYeFCzri+pyeHYwOdnHaNg7Ut1dm4tZT0yLvCO?=
 =?iso-8859-1?Q?bjTyyj2yPhVQxycs3SmYvWplpgTtgvmboa5NyQfuRll3m1CUXxoObNM8zd?=
 =?iso-8859-1?Q?UF3rdEV/vrJbkjr2F/cFLJc2bkCQx2/ry1QhS/mnUwu09V/X378mW/B4M2?=
 =?iso-8859-1?Q?8EMZQCe7qCsUB+pn9m7rM4wXF9gfZsj/VXdGvDT1jybdraikAvZbDDLVcS?=
 =?iso-8859-1?Q?/kC+jFve/GyQeTiuwVFY5Rs9LkTJyZTLJ1AFaPzFqoA42vnVrBH/dMzW/b?=
 =?iso-8859-1?Q?lNeKgOHUo8t3TOvtCjZuiITNfPTbcmuRiOTzfhz5gJ8GSVRXFgq5MlSeSs?=
 =?iso-8859-1?Q?/0RZqs1ETxf9JLwE5cpmufjjULbdmMsxtntyeu5/GeZupzjSk0ZJhxMSHO?=
 =?iso-8859-1?Q?HdClMvM4yW1JfeveA0DOnXVulQvvnvfepxVZbilntZ3WEabdwSK7pjag?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QcxR7CifPsv8zbsccd/hWULBaYXUFyFidOzVIvkPPWuoUUrGU6Hrg49CfXWQiIFjf/irXQrfy6JtfWApNi1ZXv89zWFfSP8z0rqDHF3UC3mYattaO16XfNFhvXY/uJ1ST0lVBw8vg7UKvjeJdS3GmVKAYul4nO6qpmkd0Zwk057i+sVfOhXjw6KARvG0zwAdIIOjX6CJc1n2P0jmh9qxVMhNP/R9TIetjI4gidwp/ood5xq5PN2YZmVkuAAu/tqO1oLyU2+YPNvuyEbuAQUzVGGckl0amVRtpkz9Ra5qrFwAXvD1czucyl4zw65CZ2NEgyKx0d9kGAZnRAk597NlCRlcL/4ifFLkLOcaXfyB9vZ3Jjchl3x4LJK1WxOVGeXnj3xmaWNkn0Fh2d2KtrgtTtU1ZIRKNs6JVOTpMdUx2Qhj/QnGzRwi3gd8J89p9aQUknkVZ0rj51HXaNRliBSlr9WvA+5Cit6ppxAiKHZ6tZ45zVAt1TfWPNGqyY5CXIL+a8/r2GTu7boH9+CNVuHNh1lcN4fhgIjmEpoaJCLBvZQR3hVjcRT0UM3C/5fC49A742Q+D2Oy4KG55WFwLJygVq8evpRz3boPQ+PORoQUtnw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44378c00-6003-4f82-149d-08dcd1030db1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 19:10:22.5928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZB1YLujj1+rnimFaVfuYjh/j5lMHLrhhhxUq8RFEIugtE62lw+3QdeQUIXTqPKECUTStgcVrvu/+YCb6P3EgYY8gQ1UTK399gLTazAKCNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4522
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-09_10,2024-09-09_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409090152
X-Proofpoint-GUID: _6Sl_9Sv3588j3mlJ4gkgOPN9r1CX9vQ
X-Proofpoint-ORIG-GUID: _6Sl_9Sv3588j3mlJ4gkgOPN9r1CX9vQ

On Mon, Sep 09, 2024 at 02:40:34PM -0400, Eugene Loh wrote:
> On 9/9/24 13:31, Kris Van Hees wrote:
> 
> > On Sun, Sep 08, 2024 at 12:31:12PM -0400, Eugene Loh wrote:
> > > On 9/5/24 23:31, Kris Van Hees wrote:
> > > > On Tue, Sep 03, 2024 at 01:16:43AM -0400, eugene.loh@oracle.com wrote:
> > > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > > Deprecate the use of EPID:
> > > > > 
> > > > > *)  So we rearrange as follows:
> > > > > 
> > > > >               old                        new
> > > > > 
> > > > >            0: pad (size)                 pad (size) <= buffer start
> > > > >            4: pad (additional)           specid
> > > > >            8: epid <= buffer start       prid
> > > > >           12: specid                     stid
> > > > >           16: data[n]                    data[n]
> > > > > 
> > > > >       So now, we say there is no longer an 8-byte pad before the
> > > > >       buffer start;  rather, the buffer starts with a 4-byte pad.
> > > > I am not sure whether this layout comparison is comprehensible to anyone not
> > > > familiar with this code.
> > > Yeah.  Incidentally, I had moved specid so that prid/stid were in the same
> > > 8-byte block so that someone could read it as a single 8-byte EPID if they
> > > wanted to.  I'm assuming you see no value in that.  So I moved specid back
> > > to where it used to be and I think this simplifies the description of what's
> > > going on.  Anyhow, I revised this explanation.  Hopefully it's sufficient
> > > now.
> > I like the specid first actually :)  Since it reflects the designation of the
> > data.
> 
> The most recent version of the patch has prid, stid, specid.  Is that fine,
> or do you want another version that reorders these things?  It seems to me
> that at some point we should converge on some version of this stuff and
> worry less about second-order considerations of things that do not impact
> the user.  Anyhow, I can make the change.  Just tell me in what order you
> want these things or whether the most recent version is fine.

I was just wondering why you changed the order again, since that wasn't part
of the review feedback.  It just seemed odd, because the moving of specid to
the beginning of the buffer actually made total sense, so reversing it seemed
odd.

I agree 100% on the need to converge, which is why such a change seemed rather
unusual to me.

> > > > > diff --git a/test/unittest/actions/setopt/tst.badopt.r b/test/unittest/actions/setopt/tst.badopt.r
> > > > > @@ -1,16 +1,16 @@
> > > > >    -- @@stderr --
> > > > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > > > > +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > > > Perhaps it would be more efficient to update runtest.sh to support both the
> > > > old and the new error reporting output, and changing both into a single unified
> > > > form that substitutes changeable elements.
> > > I don't get this.  First, there is no reason to support the old output...
> > > that would be a rather remarkable historical vestige to keep in the code
> > > base.  Second, it seems simpler and more stringent just to compare to a
> > > results file in some simple, straightforward way.  You say "perhaps" so I
> > > just left it as is.
> > I was more thinking about making the output we compare less dependent on how
> > things are phrased so that we do not have to update .r files whenever there is
> > a change in how we output the data.  Except for a test or two that verify the
> > exact phrasing we expect.
> 
> Okay, but again it seems to me that there are multiple acceptable ways of
> doing these things, each way with its own pros and cons. So, do you want
> another version of this patch with the requested behavior, or can we move
> forward with the patch as it was most recently posted?  There are other ways
> in which the format of DTrace output could be converted to some "canonical"
> form before checking; do we want to embark on such a project now, or first
> get USDT functionality out the door to users?  I vote for worrying less
> about some of this "under the hood" fine tuning (that doesn't even have
> unequivocal right/wrong) and more about delivering features to users.
> 
> Anyhow, let me know.  I can make the requested change, but am nervous that
> we're churning on issues that do not benefit users.

We are not.  But I would be remiss if I didn't mention areas where we can
improve things, especially if it would result in less extensive patches for
things that in the end do not really matter much in terms of what is being
tested.

As you pointed out, I phrased it originally as 'Perhaps' - this is certainly
not a make-or-break part of the patch.  Then again, I had also suggested
leaving the changing of the error output as a post-epid-deprecation thing.

One way or another, we should have an action item for this so changes to the
error output do not cause such extensive patches.

> > > > E.g.
> > > > dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > > > 
> > > > and
> > > > 
> > > > dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > > > 
> > > > could both be rewritten using pattern amtching and substitutions to be:
> > > > 
> > > > dtrace: error for probe (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > > > 
> > > > and tests that are supposed to exercise specific aspects of the error message
> > > > or that depend on specific details could test that explicitly?

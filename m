Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74106188917
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730131272; cv=fail; b=SSU7iQwv2bhBPQTgHnydGFduFcG2CFv8mt3i3zjJ4dA5mqVvuas6I7qrbGbWSqDMuLmgBu7Sx9fbi56mokww1SBtLNK8S85KHMoOk9ekaHW2Y+KKfZuAEWZpf66bhZYPBU3Q3aeWrcEeYKx2RgW+hEnhG1cZdnElUMK9DuqV6Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730131272; c=relaxed/simple;
	bh=tf1XagAuSayaVaUXj0h9Bx3rC2/sjlfB4J9DziNdQl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YE77269nQ/LUH8LX5Hor8P0MEf1bgBnv+jDm76Vbp3vPCSzZg7Ay+hU0QwhoL9qboWyIM8p2WDdrpSWGsSazd7OYD8DbYQ4fKk+2IrCgVDfOvI9745n37An0cJNkxGePrYxUHij+zQ5xL8BQlXLG0LLzMk1k60szM5Gr2KNOauY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QxcZn0D6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qUVdXUXx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QxcZn0D6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qUVdXUXx"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEtZvK007122
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=UyxQqy4sHCHtKsi1mp
	TP8cDY0H8a7D9s/nOuJ81yeTI=; b=QxcZn0D6n4l5cfBLMrxt8XW6oGUppkHOLE
	st2ZpcJi8ltxkly3vcqoGkmZZBJtIQweUdoX4HCNwkpdYUYvgX8OllhKZS1Wdh82
	68O2UfnjjmSPcrW+hCLskU9x925A8bztAOLYN0ILCjTBi32I9cs20IX17f0ROC5p
	/h5s4jWGdQsfZTeDKda5x7qrUdkEXcaMIBjBZJI1q43vxa0BiCclvykdyvjAtUpG
	yi6mXkyMoyeTzAm4wzIEZAhlxAflRxamlLOkMf3dagjpFw2pKAPaaGRHwxBcrGsc
	hsblnlqtek2E8XrvV7KoaN0DXXT/UoL200vKloBaJaVW4kSNAGjw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmb9qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:01:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SF0lUa034810
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:01:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd643wj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiiUa3Ac5FZLufD+GMuJtO54hJLH7XHgqkDcsRbtjaNiTed/D4Bg0oc4WefDi04ugmD1ZwQ7PbR+kHEhB5bjKAEpftN0PlW5rlFxATrGoFWkR5Phge1KQH+q0oqeEcV3taBhVvcYFcjdlgPbWRHH0yO9G6g86Fkos3Xw19t4w7P6XaHNpKOF0OTDeEkZCcNzTfAbHKY+en+PrbK8YKWDnzHrQh1P5gGRBU008kgU9KJkCgJZt2bOV+dtyopm/LwBNve/pQfu4juTEzju4WBP5j8GBgTDRtMgp2sPKneoe+vtBlZXx2Os0SZ39VnBMCqu1Qkm2Y2ZU8Dmq8bc+Qu13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyxQqy4sHCHtKsi1mpTP8cDY0H8a7D9s/nOuJ81yeTI=;
 b=TRx6ctfKmMwkTlv1PvmxaTW94lvcVj1I5qQqS5QvRAfHt+QEIkhaMasF6Mw6wRJuFESKEafygsQSa8oT2R2d6arzP9AOUHb3mH6wE90PpdON795JCWfFezTgsZWTmaqqItXbqzLZ7eK87/c2Z1BBvPtpPLRm1PqAGsPp9amURiVo2EJ1983w+xd/vZGYKGLIGYfNeKENK2n2Zv/jD4jJVSlWwf0OyWaV+dIBiA17u4ERGnK98ves+7qODGP6ruytAtZKkHPTaeSDJv4lThCi8SKbclDzbPSLY/CUGds2aPSHY+y4gx/OcT/H4MU5nJAe5mAIT3N5rYEnFs8HSZYQJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyxQqy4sHCHtKsi1mpTP8cDY0H8a7D9s/nOuJ81yeTI=;
 b=qUVdXUXxX4AwAaxC4k7Imnu1NVZ5nXu+zcKx4Viwm7ueeH6lBeH/O3W5ZcKP+vTjKKHQPxWNT4uVadQ5/va/L4OobJt1EMtzOajAeepdkmHVPff4NQt+T5j5JtLtuChkewZA+nOxIqeONDhCYILDgCtscTR/9TATQqrRZEIfPlw=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA0PR10MB7256.namprd10.prod.outlook.com (2603:10b6:208:3df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 16:00:57 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 16:00:57 +0000
Date: Mon, 28 Oct 2024 12:00:54 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 5/6] usdt: typed args and arg remapping
Message-ID: <Zx+1NqIpc8vONfqE@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
 <20241018195808.270688-6-nick.alcock@oracle.com>
 <ZxfxrhUANHKZZgqn@oracle.com>
 <87h68ws83y.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h68ws83y.fsf@esperi.org.uk>
X-ClientProxiedBy: BL1PR13CA0402.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::17) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA0PR10MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 29de0b38-075a-485d-87b9-08dcf769b5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zqna6f7GKtjsD90orUb3fM4QNyk8mNQEtmhoZt5BN23qJGXPPPPkDCDx2WPR?=
 =?us-ascii?Q?G2FACFBzNTCTQ/dAqb5SrG1bFRI72LHZeWo9E72ew/2I4U9yPzP9F08q8NPv?=
 =?us-ascii?Q?PQLyxAGEYP9E8ZXq64OShut9HRz0QBzH/xZFSzVuJhlYa20ZpCddsw1TT3WU?=
 =?us-ascii?Q?K5zta6MDUxSLSu2Hn6kL57wdw1PVKlUYDMd2ZzWRptp7Q4qYBjePEEcvTxjH?=
 =?us-ascii?Q?/ZeUBh6IKxij362MQYGV2gPP2EhJoRYhEMZU8QJxkrMRR6lyVxDT9ihCSS7X?=
 =?us-ascii?Q?2fAoFPLjgmd0Q1Fg4cEAQ1w//2+Yb8JBrb1k/sHrhN9ddrrdpuotixJjdmFz?=
 =?us-ascii?Q?2T++dYplJ6oHA43TvnHhg5orDrsaLuBCz08Y2kTi5YAqZZcPbGDGtVSIRLQG?=
 =?us-ascii?Q?kNGQZ3vKjupkR45G0RSWtuC89ulrAN6BAR+ATsxtvO65JgFvtzSv8NlMVV6r?=
 =?us-ascii?Q?bvlPV+Ji8HGzCmg2lIyIuAGuYejOXpD2HH+YF6dtyNwryHeHOCc6RCILG9WI?=
 =?us-ascii?Q?CA1byndHoh2FnxWiEJhd6xkb2hK580JCkH/AUSO8ZySS2doGvw6lNCPRN4Tc?=
 =?us-ascii?Q?XkvoojpEpE+9I/yV+KKCb7thXT49maf5DadA5JLs09WA/dKeKePn4MsF5Opi?=
 =?us-ascii?Q?uVC+uahl/PKO4645vwO1/KkpAYS+F+2cXqO0umVw8mg1ga1pjwftwy13eotA?=
 =?us-ascii?Q?3/0ZccfNnxzd1eZBfPd3YcQnlrk8tyJ83zamE5wm4+JnJ9MG9j9nWFgEgeoT?=
 =?us-ascii?Q?zKDTc1mUnRo97SRmOMeqPsXJ1KNWYhd63cWP7ooPgbaP4hRxZVG4AcktBW9L?=
 =?us-ascii?Q?t+dHwPgAUqIONP/AoQeGR9UMeqLF13Eb5JQcB1SJb39i75cyofKDKCXPP3AA?=
 =?us-ascii?Q?4fvuxwbbjt2tyybVDtGBoAPYuIrt0l37qQrEnPGFxD82RSdHIWFUE+c7DyHw?=
 =?us-ascii?Q?JiXwe78yFXoenAT+zmjwJhyozECgtPEvsk+YVLNtfx/qEPJxZROx4scAvd/c?=
 =?us-ascii?Q?IztyRUG+FWpzaSOdFB0OBV2cSxa4t+PWzG4unmAyE/zgX94h0hKyOubi+SVa?=
 =?us-ascii?Q?TIuQ92TTIwBk4iKQFFJHREHPg8fsMDJlyvaQgTa/TRqhiGEYduew4rE06tCz?=
 =?us-ascii?Q?ndiXU++i6LcG8WFoeR2I0/JOWH4zoXPaZGkiChEsF+8SXB6jU+oe/w1L+XUG?=
 =?us-ascii?Q?wuY2HTJc8I5fblb9z0KeR+o93uN0x+tB7d7TNnN3CSE5zq8M9SbU1kjsx4EV?=
 =?us-ascii?Q?zXgs1pT1Yk0TvfRB3dOvwRPk3CEBFGG2I1CBOMN9XWPZf6AgWv4gJovjs8rm?=
 =?us-ascii?Q?dbD9eegU6bzihLQNiWZdXqEg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zFQY4+63F+uyRwfZrLqR/zE3dT7SCwtnsznQws25OHYrKi7UgG28bvKz7k2u?=
 =?us-ascii?Q?+fZ+hzuQEMO9RkZ3+y29DtiN1v1LwtBiI24cUGxh1hSFlerxz6mcrDQ7nPb9?=
 =?us-ascii?Q?wFDZE/uai0d5SyJxA+CjNLP4IGMUb5FjXQMy94CJrBfh+q9x+WU6wR+OC5ax?=
 =?us-ascii?Q?MIWWwBv9LgjaqRkDlmftqvkN8wo/k33xQlk11w+tLO+/vZLSGf8unyHZ9SlM?=
 =?us-ascii?Q?synEsaTvaOplEwJmA0iZQ3yBAgoP5Ai/sii7+zUkBWgbY/Z6Z8gmisCWT0wV?=
 =?us-ascii?Q?jUpHz6vQxoyYk3ACQS2noqms4v0ylD4LUPG8xDJ92VJtZgcY07fdOAgWMZ46?=
 =?us-ascii?Q?EsTZhe73iy1tXyhpCxMNH0+mgE4K8oEg7cQnsP3yZ19CsuQRVPZc/7h6bLga?=
 =?us-ascii?Q?0fia5MSg6jf9SHIH5V6agpBHSM5n89MhA/OYLN6ymLP9xTHBBPaOcOwApHxJ?=
 =?us-ascii?Q?4Zpsex9bMUhXEGEqT2EGLm+b+2/38Yplhv4+dBxn+85hBIHuwhhHmc/tw9Sf?=
 =?us-ascii?Q?pOieeUMAqW5ZJ19zdlcCmAQpGEgPpz1Nv55BEQgaL064dnKF7klfPQOHdOKI?=
 =?us-ascii?Q?OHN91KBLkVu+DQSmbIojiCj4/36qIU5kaU6JyT9EhVppNcOJUW0H7+unIeAx?=
 =?us-ascii?Q?x+JucCWNgZuDsBJkXuCN775I2ElEgfANrn4+WEg80jGI8ZtjcUXlNgInf9NW?=
 =?us-ascii?Q?RbBCVyU/Unar3ccwToqbGDKEWz0fISZwKohiH46sZaMgHY492HqSuQtGj1hj?=
 =?us-ascii?Q?8f2I6hiR3YwxgQkCWRsNcQIVHh0jPdoWfNmFpH/pSFNQ7EzOzzZIXTA03fAN?=
 =?us-ascii?Q?Sil+5RggqCTjN4xBhbTwX2Mj0i4v3SIbX4xPEq1XZKxj8zyXJvJJtqHjJ8Aq?=
 =?us-ascii?Q?r4qZLJu7IBHbACLfG/uw2x6vd83u8brFdo8I+sbNxfzV1q6G7fb9LZCnF7md?=
 =?us-ascii?Q?0nVzUcbqd4+L/o37RvVk5bT51RgcjpaCFHJdukqC1Fuq8sQ1RQRdOcprkB7i?=
 =?us-ascii?Q?9D1l7bfZVvezQTR6ctRQQRUx60AnzO48qG4cyH0YVC5l30ND3wPddXeNauen?=
 =?us-ascii?Q?3YaJBUEQZNvUpT/KZKMwfygGqHEg3aSHczLx945gN+yHLL6YCx8uEXBvC1bX?=
 =?us-ascii?Q?nCIXWIbTNQwb27NiFZZEpZQC07Q6Ikv0pYD7y0nb8kDE9X7CZ/ELBQPSAIge?=
 =?us-ascii?Q?5N9heoQGBc2JGdAJ1WR9ffvnvDHoN8w7R87kDoh4kfnyKGLFbAn+y6V8LTpD?=
 =?us-ascii?Q?XBKWyqPA+3QEMwRc4rHo9s5hCHwMtFQAfz7cogPG5pLfSS+yO880qKJsiBUJ?=
 =?us-ascii?Q?IH2dlQ6K3fV/n+BbSSjIe4HLddmoPBQSDgFYHQxZWqBl6Fs6PspcChsvHgNf?=
 =?us-ascii?Q?T4XnbEroqM8Qzb+FN3NghzpCV+mxXjXQrTIiTE9tF8HAeT1C7AXPVBfhnD0j?=
 =?us-ascii?Q?f0tPQe2XLEiT5olzw2EghQk4U/sg84IlgCjOiWPiUUPKxfxk34zlJNwTkAyh?=
 =?us-ascii?Q?YEUyNuZKpdlnw8Jqc8KwwbJrq6cLhib3zdX4/iHG+A3aF6eaHGf0Enha3qbk?=
 =?us-ascii?Q?qO1gvRltCZ99Fb4bOpTstn1IutoiRG6N86v6vVf/jsIWKeC7d8vCtp/X1tH+?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F7iDVVwPcfoFasZrR0gNXOfPtBSa1vYvtW6I/SE8Tz76XCVWYPjcHfG58AfPqgeaZpsg1wq4Hdp3BoKho9ftQasDhstvtYH0eIWzjPBPt92nN64gu8ICWQg6M15WqkGOADwtCktyiZsvOWKnjccVCmM/DwdpOeULZya28/jmuBCEEvNo70zP5jYHAxP/hHYPg5VI8QfauyVmWyl8xwEG6w09ivBTvC1AwEjJjJyairP0Inz4F5+zZ5QryxNtkmUNqosK7WftONv2n298sTeO8Nv7KoQQD52SId1Q1nLa2L05tPzqupK37GrBIe87hlTOCuHiSfOlKsFd/rm3KlIno3HURDfrykG0OprFVt59d81Xa2wfwqTKYxw7oFdgokdH03IHsW3+MykmVXIvrG1x5nidLdPdSeIbRHvKIHH1QEylVqJFkfe1Yb1VpsSN84G/2MlmMr5GxUKE054nkrGztFkWWi0BbVVfJEm6UoLyb64+Qmcq1HGkyf9OFGaO5mMzfiTBSKEFT6pZBAPa1zJRNIrXAnzRPU9/URFZwJ8UZj4AlAIQD7Zn3nppoPt5f3RJjoyM4eN8XgJoAjOoK+wuuHZpIRwWFxC3bgXXkaUbaJs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29de0b38-075a-485d-87b9-08dcf769b5d8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:00:57.7052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDOilAXw1hondu7p1utl2BKbNVtQASjBKvuEAoR1R4MKOL8dvKsIw/UfMogagfiOy92ktvkZcYSZnGgl09LrrXsioCTmfdn77frek7XoHxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7256
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_05,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280128
X-Proofpoint-GUID: pyi_3_cIhocxP4jVhrssv9VrzNG6_-Sb
X-Proofpoint-ORIG-GUID: pyi_3_cIhocxP4jVhrssv9VrzNG6_-Sb

On Mon, Oct 28, 2024 at 12:52:01PM +0000, Nick Alcock wrote:
> On 22 Oct 2024, Kris Van Hees told this:
> 
> > On Fri, Oct 18, 2024 at 08:58:07PM +0100, Nick Alcock wrote:
> >> This change propagates the arg type and mapping info we just got into the
> >> pid_probespec_t onward into the underlying dt_uprobe_t, shuffles the native
> >> types before handing off a 1:1 mapping to the dt_probe_t, and calls
> >> dt_cg_tramp_remap_args() to apply the requested remappings.  With this, USDT
> >> probes should now have visible types which obey the :-notation translators
> >> specified in their .d fils (this is now tested).
> >> 
> >> The probe info has been moved from the underlying probe to the overlying one
> >> as part of this: underlying probes don't have any user-visible args to
> >> get info for, and their probe_info functions are never called.
> >> 
> >> We make several assumptions for simplicity, all noted by TODOs in the
> >> source:
> >> 
> >>  - overlying probes all have the same native types and remappings, so we
> >>    don't need to look at more than one underlying probe to figure out what
> >>    they are.  Given the structure of DOF it seems to me this must always be
> >>    true, and even a malicious attacker could not produce DOF which said
> >>    otherwise.
> >
> > You cannot place more than one USDT at a particular tracepoint (underlying
> > probe) so it is guaranteed that all overlying probes can only differ in terms
> > of their provider name.
> 
> I'm fairly sure I'm wrong above -- this is not validated, so malicious
> DOF can perfectly well do that, simply by emitting multiple distinct
> probes citing the same (or overlapping) sets of addresses! We could, of
> course, add validation...
> 
> Just because DTrace is the only legitimate generator of DOF embedded
> into programs, it is not true that it is the only *possible* such
> program. If DTrace gets popular and attackers realise that a program
> running as root is consuming DOF provided by arbitrary programs owned by
> anyone, this will surely not long remain the case. Non-structural
> properties of DOF not validated by dof_parser.c cannot be relied upon by
> code consuming DOF contributed by USDT programs. (So this is a genuine
> problem, though it might just be missing validation -- which will be
> *fun* to implement in an environment with very limited malloc.)

The validation need not be at the level of dtprobed.  DTrace itself can very
easily determine when a USDT probe pops up at a location (identified by the
underlying probe) that already has a USDT probe.

Malicious DOF encoding data that results in more than one USDT probe being at
a given location, possibly with different argument data, will result in
undefined (yet still safe) behaviour.  But that goes for most other things
that anyone could fake - DTrace does guard against such bad data posing a
security risk though.  It is not necessary for dtprobed to do all validation.

> >                         The USDT design in DTrace encapsulates the USDT probes
> > (and providers) as instances of a meta-provider that acts as a template for its
> > instances.  So, all instances contain the same probes, together with all their
> > data (arg data, tracepoints, etc).  So, this is a guarantee and need not be
> > mentioned as an assumption or TODO.
> 
> I wish :(

Well, it is a guarantee for what DOF gets generated by DTrace.  Sure, malicious
DOF will result in things going wrong in terms of functionality (but not safety
thankfully), but that is a given, right?  For the purpose of this patch, you
can assume valid data and I think that the commit message can stick to that.

We can come up with a variety of issues that can occur when malicious (or
buggy) DOF gets processed, but I don't think it is useful to provide that
level of detail or analysis in a commit message.  Especially because the
way it is phrased as assumptions it gives the impression that we dont know.
And we do.

My main objection here is really that it appears that your patch is making
assumptions for simplicity, and that is not the case - you are implementing
the correct behaviour based on knowing how the DOF is structured and generated.

If you want to mention something here for peace of mind, perhaps just say that
dtprobed does not validate that e.g. no two USDT probes list the same
tracepoint.  But even that I think is unnecessary - after all, it wasn't at all
mentioned when dtprobed was first implemented, so why would it now suddenly be
an issue?

> >>  - any given underlying probe locus is either a PID or a USDT probe, never
> >>    both, so we can just remap the args at the start of the trampoline and
> >>    then never touch them again.  This is obviously wrong, but the both-at
> >>    the-same-locus case is not yet implemented, and significant changes need
> >>    to be made to create_underlying() to fix this.  Right now we can't easily
> >>    even tell if a given locus has both types of probe on it... fixing this
> >>    is literally a matter of shuffling the pid probes after the usdt probes
> >>    and then doing a single dt_cg_tramp_restore_args before all the pid
> >>    probes fire.
> >
> > I would rewrite this to point out that PID and USDT probes being at the same
> > locus is not implemented yet, and that this implementation assumes that either
> > all probes at a particular locus are PID or that they are all USDT.
> 
> Rephrased a bit.
> 
> > I would avoid speculative statements about how this might be fixed in the
> > future (however near that may be) because there may still be design decisions
> > to be made about that and there is no need to bring it up here.
> 
> Oh, I thought we'd already decided that! I'll drop the last couple of
> sentences.
> 
> >>    PID args are already broken before this commit (something to do with the
> >>    wildcard USDT work?) so I cannot test if this commit broke them further,
> >>    but it shouldn't have.
> >
> > This does not belong here but rather in a bug report.
> 
> Errr... a bug report about a not-yet-released DTrace with a the USDT
> patch series half-applied? I don't think we've ever had bug reports
> about non-released half-applied patch series before and I'd have assumed
> that a bug report was exactly what you *wouldn't* want about something
> in that sort of state of flux.
> 
> Obviously I wasn't planning to leave this here in the long term, but at
> least this way if you tested the series it is obvious that a few tests
> are expected to fail and some things have not yet been verified. I have
> no idea where you'd expect me to say that if not in the commit message
> for the change in question.

Point is that you are mentioning that there is a patch before yours that you
say breaks PID args.  Since your series is based on the current development
branch, that means that said patch has already been reviewed and merged.  So,
it makes totla sense to open a bug (github issue) for it so that it can be
looked into.  Mentioning the breakage in a commit message is not going to get
the attention it needs to track down the issue and fix it.  Also, the way it
is mentioned here does not really provide detail on *what* appears broken, i.e.
which test fails, what the results are vs expected, etc...  All stuff you would
add to an issue you file.

I am also not sure what you mean with "wasn't planning to leave this here in
the long term"... as this patch is posted for rwview, I would expect that if
reviewed as OK, I can merge it as-is and so this portion of the commnit msg
would certainly be there for the long term.

> > In addition, I think it would be good to add a few more test cases to cover
> > edge cases:
> >
> >  - A probe that has native arguments, but no translated arguments.
> >    E.g.
> > 	probe place3(int i, char *j) : ();
> >
> >  - A probe that has native arguments that do not get used.
> >    E.g.
> > 	probe place4(int i, char *j) : (char *j);
> 
> Good point, implemented! (The first one was fun.)
> 
> >> +	int		nargc;		   /* number of native args */
> >> +	int		xargc;		   /* number of xlated args */
> >> +        int		remapargc;	   /* number of remapped args */
> >> +	char		*nargv;		   /* array of native args */
> >> +	char		*xargv;		   /* array of xlated args */
> >> +	int8_t		*remapargs;	   /* remapped arg indexes */
> >
> > Since all overlying USDT probes associated with a given underlying probe
> > (uprobe) have the sane argument type data (native, translated, and mapping),
> > and PID probes do not have arguments by definition, you can certainly store
> > the data here.  But why in this raw format rather than a dt_argdesc_t array
> > (and an argc member to indicate the number of array elements - xargc).
> 
> I started out doing that, but it meant infiltrating knowledge about
> dt_argdesc_t into dt_pid_create_usdt_probes_proc(), and it proved
> outright confusion-inducing when it turned out that dt_prov_uprobe.c had
> to pass down a *different mapping* with reshuffled elements, because of
> the need to move native args around in the translator. So the
> dt_argdesc_t approach gained us nothing and made things noticeably
> harder to understand :(

How would this leak dt_argdesc_t into dt_pid_create_usdt_probes_proc()?  That
function can still handle the raw format.  My point is that the dt_uprobe_t
you store the data in (associated with the underlying probe) can already store
it in dt_argdesc_t format rather than storing the raw data.

It does not pose an issue with the mapping of arguments in the trampoline
because wherever you switch things from being a shuffling to simply being a
i -> i mapping, that can be done as easily based on an dt_argdesc_t array as
it can be done with the raw data.

> > Calls to the probe_info() callback will want an array of dt_argdesc_t elements
> > to be provided, and nothing else needs the rarw format.  So, you might as well
> > store that array here rather than the raw data, and implement the probe_info()
> > callback for USDT as a pass-through that simply takes the data from here (from
> > the underlying probe), copies it (using strdup on the strings because the
> > caller will free them), and assigned it to *argv.
> 
> Yes, if it wasn't that the uprobe probe_info needs to reshuffle it, and
> the only reason it needs to do that is the nature of the uprobe
> trampoline (so knowledge about that shuffling should not be propagated
> into dt_pid.c: as you note, in the future it would be nice to not need
> the trampoline arg remapper at all, so we don't want to spread things
> that imply its existence too far if we can avoid it).
> 
> So... maybe later once we're not shuffling native args anywhere, if
> we're sure that nobody is likely to want to do that?

I really do not see the problem.  It is the same data, just in a different
format.

With the underlying probe keeping the arg data in a dt_argdesc_t array, the
probe_info() calls would still need to provide a copy of the array, with strdup
for the strings, and thus you can easily store i -> i mapping there also and
thus the dt_argdesc_t data on the uderlying probe still retains the correct
napping data that the trampoline will need.

And if/when we adjust things to get away from this silly argN == args[N] thing,
that altering of the mapping index in the dt_argdesc_t elements can simply
be dropped and all will be well (aside from also needing to update the
trampoline code to stop its reshuffling).

> >> +test_prov$1:::place2
> >> +/stringof(args[0]) != "foo" || args[1] != 255 || args[2] != 255 || stringof(args[3]) != "foo"/
> >> +{
> >> +	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
> >> +	    stringof(args[0]), args[1], args[2], stringof(args[3]));
> >> +	exit(1);
> >> +}
> >
> > This test should also test that argN (N = 0 .. 3) has the correct value as
> > well.  Later we may change that which would require the test to be updated,
> > but the current immplementation you provide is aimed at ensuring that argN and
> > args[N] are identical, so you should test that in this case also (because the
> > other test does not involve different types, which could make a difference).
> 
> Good point! Hmm we may need to copyin() there too.
> 
> (Adjusted all tests in this family.)
> 
> -- 
> NULL && (void)

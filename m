Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DE91552FC
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730137924; cv=fail; b=lk28mgHZpK8UqI2tAiTHruzB8BhbEg8QK5Ey/wFPeqd1r+OH6sU05BD+MumI539vb1eyYlQNIQSModnjjPEN18cWuGbKL7DcFK0upOt0U9UuD+rsi+lmz2rRKO/Y1IXAkUsCL++NZFI5k86bWk6FCj61S95yc8WMIBIbbHIbIHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730137924; c=relaxed/simple;
	bh=4JwOsKFOypqFJnSNDGxQcba/5FuqueK64yoF28MCAoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I5K+042ixl/n+nIPqXbqWGsIIHbUon6jxYeTijYbvySmSJJixRTiYdVJa5I9bWwi28sUcNFfVw68ceBm60V/DL3gdJuCaJtoOpzY4XguTL0+9KYv/8kc2Fw2XohnbFxzBv+BYO94cFaz4krpv7WgHTkW6Dejix4Nw4r2Qr/kONM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CAg4Tt3C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v6YyeVem; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CAg4Tt3C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v6YyeVem"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEtdI1020892
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=8hhRT2YVH3p2MovhoI
	hQ/+I6ta3qFfExumOhP/wrdus=; b=CAg4Tt3Cr4ApDHPiZVsdbLBIlCub3IYowj
	aEmwKbN0dwBZvDj8m7HGc1ZAJOTv/hekYL9WFnROw+rgyQIXVn53STPydZAVPfKH
	4T/RchNlPr7mz2DzGI1+MOh2W5yaEZ7QXs1fam//Ax1QknmXHkxYP9Mp0C0wsZr7
	hlhRRqW+rohYAXk3iWDFbFy+jixURRTHKB3L+SlXJWdYktgbV6q9xWY0sexBv4f3
	1/iNxd6k3vlUwcficYal9WYwjY048TkntPM5pPQlsNAHC8PwEV5/ZR/hv3MqJGUv
	l4v9LcXzpX+fqDdXmTyhwiulVH08A+vUzDBV11+Dv3qUmUffJj2Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys3hr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:51:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SHH4LT040315
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:51:58 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2047.outbound.protection.outlook.com [104.47.57.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnamsda7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:51:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqgxn9Dw951xvwo34FRRIUkusxHgH2qBcXXzMDn+8DUdZGkjOrl9dofVeJHANlXdYth6/dLSG2XOgTwBFo68zO9YPWZroQJvzgH2Bzv41zfhC9gf/Pdv6d+8PTu8VJ6PcCNab0ycmnECgMvzzvPtX54+Pe2W0W8LMYTb201/xRtwFjm81SZxyvpgpgbqgOwlu+EK+AehsDW5ORg/bB1VDhqcl4dpf51godRD7bFx+MKXWdgn4hH0L1GULWGeH6yzdpaxLs2m/mydO6ieNrUXA6nM1TbcrSltdv/zzG5bcYvja2d8Wq5rzx4M4U8THyvTDuoX5LhXQKdod0eXi+S/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hhRT2YVH3p2MovhoIhQ/+I6ta3qFfExumOhP/wrdus=;
 b=WwpW2fmyPbO0FFQiWbxUcHfghpTBR+Rl2Hpj6N/Tp6n2tC+5GbSDBjcAT6Y8DViRxc1KOk4IQJBncp235ZJMBL91YDUfc2u/gZy3hhPIEuBE5bDd1g8Jz+NHBdbdFLJpf8vii3hk5fZHwc+EGh7XGxKWTs4Np1DwKhmXuN9ql+MZ2NUW9zcYuqhKSSrWzL9Dnq9Gg7reS0jUtF+7H1Ik2quY1LI54s2xu3Wl/wl6FO+61dgK86KyvCCuzniRHy48qcKkkdEgpaWGWRc/RTPrO/G9Rc+LchHwoWXQtFzFOtiOMg/AaiR8+fWNXat1zSE5cJXe0MJtNEHe1YaEMKIm7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hhRT2YVH3p2MovhoIhQ/+I6ta3qFfExumOhP/wrdus=;
 b=v6YyeVemMf9ckJeR2I6whSOTbb0zc13EOnF0Lk6DsY1K/LxNbEVJN5sOMF1K3l0Jw/WLV/aFYBWkfhjrsmQyN5j/dm5VCBKPASNLeSV8qC0uUg3FJ/lUxO00pzuduFl3BNZCXc1lnFAZFv2h30vqmHC+EoZJOMpQDZfcoNHeYPA=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ0PR10MB4622.namprd10.prod.outlook.com (2603:10b6:a03:2d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 17:51:55 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 17:51:54 +0000
Date: Mon, 28 Oct 2024 13:51:52 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 17/19] test: Add a pid-USDT test
Message-ID: <Zx/POEwlI8JegtVL@oracle.com>
References: <20241004045157.26120-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004045157.26120-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR01CA0040.prod.exchangelabs.com (2603:10b6:a03:94::17)
 To CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ0PR10MB4622:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a78d7b-abf3-4d3e-989f-08dcf77935dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EbG+cDgxoRxl3RdqzX+Ji+dLZY4RDRYPOeiVYc3OVrUmdSwv0C3ShC8koYdn?=
 =?us-ascii?Q?fzllzeIRUDO3lFGixKf4TEQ5e5XZ/Zdm7bjxz91D80h0Xq9TNTbMm8s4ySy1?=
 =?us-ascii?Q?xhv9Eqzv5rUus0Qd4lniENqafXY9qf5be0yewyqd35NUvOEgNLJw1NdhagK3?=
 =?us-ascii?Q?5pd4LdC+kHU8Fpzic0XvPV1nPpFA645Mb5bjQ0pAqJ6l27b/IdYfKU0JT63f?=
 =?us-ascii?Q?XY1/R6TQsngIpBpLpidpleWUqT9RWpMfVORpTKt2pC6sh0E/mU+eRwidjaJy?=
 =?us-ascii?Q?2NyVCd4oKDIaGrDkll/OAyfXlTcadmSKqzj1B3uHzuAlqs6DBff1scYiIm0v?=
 =?us-ascii?Q?0BXml3bKOmp9PqC3YeM5MXCx3fOOS2HdyL9i1c46Z3ePRcxnzgtJqF0iFlcK?=
 =?us-ascii?Q?F6wF+gmvkGR7iNHXOgLpzpT86Occ/xZriqba2PggCQanROdXnqoY7zTdK8ju?=
 =?us-ascii?Q?vVzU4n3r9KHaBlEt5b/U3n7CACuASE9atNqFUljjkFC/ROE7eCA9uJmZ7re6?=
 =?us-ascii?Q?mrtluiMePixQl9TKIFFr+Ra7JnQ6nz1G7gvusSpPzE8vzGSTQoL80c5pk3vR?=
 =?us-ascii?Q?kfGlcK2lPt217TdT/q7Et6pLaElpRnEJM+IzkgHTwiw9qVBabfkpLboM5xYg?=
 =?us-ascii?Q?k9uMm+Inp0Wa61j+kkuIR8b7F8qO9qMDaA0eJgJcgeMAiWCM5lssTeIVg+ZT?=
 =?us-ascii?Q?WVI+wSzhoaA3vAOusKoYq8erBhNxsTXVPN/7qYVlVMsCFNht6qb/zJ8Ov6fX?=
 =?us-ascii?Q?Hv8dmC2Z7sOxSSt+NFHSPo8AUuMcnCJlUmOKe1KzTDx/DE8BYkn9BYtaRqYH?=
 =?us-ascii?Q?RiDKyc98r54YmPwygI8/YUFpS+9uwwXpn9bWN61MR8BgSzJgSZm5awuOeq/J?=
 =?us-ascii?Q?jrbjnLw9DJGOX2NoPMU10ySdVuMSufREpzlyUk8R4jvgirlOq4ExmcXveefP?=
 =?us-ascii?Q?BAdqShWJ1EN0xxxP9iBRShLEr1oBmuGVmxVZj89kxHsBLAF+o7RkMbCUcS/C?=
 =?us-ascii?Q?AUjf776uiS5hcmIszNU3wSLpSNXMr0S8CYoARtgCxu23NUMZQI20xJt6C6bF?=
 =?us-ascii?Q?xof9xx8LDaOku4tCSR8sGrE27ysUVmBHGyHBLIJvRZX13SfnMDhnnUsc+nna?=
 =?us-ascii?Q?ryCp9kS3CMj0EcfLRd/LLzqma9VPV7PU3HbUNOwbfm5h0QWYmU9OFlkTuuVh?=
 =?us-ascii?Q?kRKSzGZDjXNWQWy1t68H2z+pJLI7AYnTje90PpV+7QJDCnqilXHqp9JGUdDF?=
 =?us-ascii?Q?LmPRpSICc1NZeT2OCScmxGEwE6Pj4N8tNGn+yLR6UyGm8rEEJf5zO3t68YQc?=
 =?us-ascii?Q?bkgejWnTPtiO3/85gLTPc9O5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cy/NrW3UpQ1Yg6VixoL/R6HgMOvPFBiV7IdHrNqY2rI/rK4LoZrmW8qKPOCv?=
 =?us-ascii?Q?3/8MvY4zfhPE2W2saIMCjy0j62ozPIkbpnfw03uprm4yFkUmzM7wiw/iBDcV?=
 =?us-ascii?Q?BtBXJlyuJIaiwQ3W+0KM7igeX+S8IJCkHxWumgaJdA5L4jPySm9+mf/hsJSc?=
 =?us-ascii?Q?4CddXc+mn58TW9Bb4yB9UbhOI3VYQ+8omugbFfiWkgRyLt+h1xT3sYRGPzi2?=
 =?us-ascii?Q?1n6atIQyNSc1JmFDMIKpHwehBJEwcQ40NDVawVa/x1B99dbZ2m72dTDrymx7?=
 =?us-ascii?Q?JXhcTmMT0D16Wo/Hx9bQszsBAH5HTIw1MpGcDKZlMHsx+ZwxahmCk4Ox3nsZ?=
 =?us-ascii?Q?eDY9JeTEXmYAgPJWxVsw9G+knt14Y2o6hiTXlveW+Cqmb515snlkd+pj1lhu?=
 =?us-ascii?Q?iOKNc/QNgDbksRoRBfZO2rb7Rxe1WpUqihfQqthz++6SqFL8w1wr8wauqMth?=
 =?us-ascii?Q?l6eM0RnvZEd1ygtUqZxng7CIOp98zJA2lnJbMWWZa2ODk2+E8szcMDUE2VKX?=
 =?us-ascii?Q?tBpLMhJb6Evujs/MH9XgtsyLzXOan54do3HheAJ/jDXHO4H7Ys+Nr5uAsv4L?=
 =?us-ascii?Q?Ko9GlB7mbmm41HfXGV1+vrKO7B9blgE2lxtCoZg784P5wwr5k51ikRX3FeI+?=
 =?us-ascii?Q?jMP6mICilePf3kiVGhe1ExtpXYHc5wW+pn58cJ6rZqA9iNaUHGL4t/eA5AQL?=
 =?us-ascii?Q?kwrSjzORSxSfONoniJKJ8YWsGv6BslBsbqmEL8xY1nhOSTxnjoBeEqBaSBeh?=
 =?us-ascii?Q?u5m+sD28FJyjmAjjWui5FP/YvBUyzrXkXXElSoERP0dEc9qCaX43CgtOIR8g?=
 =?us-ascii?Q?fz3HGMNzXYHDkabI9M2X1tX0ROUBOKWJbI/+es3uXBj+U8n+WrdslXH2WeEv?=
 =?us-ascii?Q?wdRmtneVa2JQyfQjU6UmoYgTu4a7ke10DeVe/1jIetM6GwzKMjeTv2H05egL?=
 =?us-ascii?Q?W9ExTAYLV0lDUYDY4oP85ElViA3PuTCELVBi1kM/TWXoothsTLfBAYdZHTcA?=
 =?us-ascii?Q?t60Oq5hXgwGmBU+CPM6DueuWqZ+lrwFyuYHrUoHjmHBBRHSXX9UCJwJ9SIN6?=
 =?us-ascii?Q?45mu22T2p7FBl4c7mH8DJ1gYjgm6rL18XDcRJ9aqxE+wG3J/RIRnEW6Pesj3?=
 =?us-ascii?Q?DLM//1/pQNptp+ZFRiZtQJyylJvd3RCK4DAILCMelGh4TgnixD4RaRVohi8y?=
 =?us-ascii?Q?01HzHMeePtyuuxhjZqqxpnemxbqXbfXnQNeO81r3zlku9jkvmMhRIAtQMLg+?=
 =?us-ascii?Q?DGW1DZIYgbQjvG0AjR6eLsXaUCd+78ieHeRTclGRxtbBcvwGXYX0ffWXwEEC?=
 =?us-ascii?Q?p50HYhJVokYf6O6sJKczRmYydt2PhgjNqv+pqF1bKm2mdjMzGKh1ntQ9scfi?=
 =?us-ascii?Q?z62Qeiflm/izxz57dZsGYZDMMHVZpngZYYKG75PUfZsOt6hIWHHbYeopYprA?=
 =?us-ascii?Q?NqLjplxIy58lfpRrKmFaFLFbWo4T8KHgYOjU8UNVTizDM3h9iNHjNKMXbz3g?=
 =?us-ascii?Q?8OMxCPQaNtF5mw3j4xzVW1c6STBPKAopOlVr2p8C2yl7XuFeztYcw8JCE/5g?=
 =?us-ascii?Q?8QM347QvF3ItizYkfzZgQxoV/FY8QxP3g1jFULJEUeOlzEGgHF6yw26klF0G?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aHfCJTCtZ9/txuNS6jnjGeRw+tRqevBwXo++SbsCYJu/afoqxvYRZEuceTMfsTEr9UkHLKaue2FpN8TH2XfVP83QKzLjEAJ7OWNqPxicjN0srelp2RZhcs7ACnjza7FJCh7t8GAdZXQtwmCF3VwK9GavmaSf3U+9ts0WOWsy4mP2wm01oCVTtA9xzUDPVF+3ADxokgJzqoZu4h+4eDRxx9Z4sFE8ufOBUwC3gyFht6Py4z0jFnvmo+DbWhSQxk7fm1LeBnfSdAKGAV0QeKP3QxB+K4HmqYKZFoQeDkjiOJApMgrmqeNP6Y/A1hrvTQl0TJdWCu+q2XzrR8H7khKj36klI8R/xX/9HbrwK/e7wbaDxAWuZJIqMo33aHR+CdJggvp0Kgs7JsPA5R3SZLHLbo+X1v2EZDw2K2Hf8KRN1beWuP5BXnWZ8SKiHZCmeCeAzwO8qW3k0y4xF8jkJqNzjZe/qcxgB1d7j18QEgfdcn0FtF01WtrkbD/Yz3JZV1J9Qd+cLrFAp2a9BNFTuZJ+iJjpgnC2i25EgV3ysCBlPSXp161RcTvSF6TmXhqadwGz5umM3856gnw9V7inJDSJnZMHoitbPdOhXE4Mq3NxQb8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a78d7b-abf3-4d3e-989f-08dcf77935dc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 17:51:54.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLtVrxC2q2RntH23csjuw12sOQwa1Xjb48gT/i4UWm2Y43960uXQ+bzoDOBByoRGa1ES1cdIToIBSqgl3A64i6rTJIKCYdBvucSUsT5f2Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4622
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_07,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280140
X-Proofpoint-ORIG-GUID: shSKtuHmjHkmtMfahW35Xmn_WJARd-Gz
X-Proofpoint-GUID: shSKtuHmjHkmtMfahW35Xmn_WJARd-Gz

On Fri, Oct 04, 2024 at 12:51:57AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> This checks that pid entry, pid return, pid offset, USDT, and USDT
> is-enabled probes can all coexist.  Specifically, pid offset probes
> can sit on the same PCs as pid entry, USDT, and USDT is-enabled
> probes.
> 
> Note that PCs for pid return probes are apparently in the caller
> function.  I guess that's due to using uretprobe.  I'm not convinced
> yet that that isn't a bug.  It isn't what Solaris did.

This is not a bug - the implementation of uretprobe is such that it fires
*after* the return has taken place because it is implemented by means of a
trampoline function that is interposed in the return path by replacing the
real return address with the address of a uretprobe trampoline that triggers
the uretprobe firing.

The alternative would require setting a regular uprobe on every return
instruction in the function (we used to do that in our custom FBT probe
implementation in the previous version).

I would update this last paragraph to be:

	Note that PCs for pid return probes are in the caller function
	due to the uretprobe implementation in the kernel.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

with that ...

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/usdt/tst.pidprobes.r  |   1 +
>  test/unittest/usdt/tst.pidprobes.sh | 292 ++++++++++++++++++++++++++++
>  2 files changed, 293 insertions(+)
>  create mode 100644 test/unittest/usdt/tst.pidprobes.r
>  create mode 100755 test/unittest/usdt/tst.pidprobes.sh
> 
> diff --git a/test/unittest/usdt/tst.pidprobes.r b/test/unittest/usdt/tst.pidprobes.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.pidprobes.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
> new file mode 100755
> index 000000000..8d18c89a4
> --- /dev/null
> +++ b/test/unittest/usdt/tst.pidprobes.sh
> @@ -0,0 +1,292 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This test verifies that USDT and pid probes can share underlying probes.
> +
> +dtrace=$1
> +
> +# Set up test directory.
> +
> +DIRNAME=$tmpdir/pidprobes.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Create test source files.
> +
> +cat > prov.d <<EOF
> +provider pyramid {
> +	probe entry(int, char, int, int);
> +};
> +EOF
> +
> +cat > main.c <<EOF
> +#include <stdio.h>
> +#include "prov.h"
> +
> +void foo() {
> +	int n = 0;
> +
> +	PYRAMID_ENTRY(2, 'a', 16, 128);
> +	if (PYRAMID_ENTRY_ENABLED())
> +		n += 2;
> +	PYRAMID_ENTRY(4, 'b', 32, 256);
> +	if (PYRAMID_ENTRY_ENABLED())
> +		n += 8;
> +	printf("my result: %d\n", n);
> +}
> +
> +int
> +main(int argc, char **argv)
> +{
> +	foo();
> +}
> +EOF
> +
> +# Build the test program.
> +
> +$dtrace -h -s prov.d
> +if [ $? -ne 0 ]; then
> +	echo "failed to generate header file" >&2
> +	exit 1
> +fi
> +cc $test_cppflags -c main.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test" >&2
> +	exit 1
> +fi
> +if [[ `uname -m` = "aarch64" ]]; then
> +	objdump -d main.o > disasm_foo.txt.before
> +fi
> +$dtrace -G -64 -s prov.d main.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to create DOF" >&2
> +	exit 1
> +fi
> +cc $test_cppflags -o main main.o prov.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to link final executable" >&2
> +	exit 1
> +fi
> +
> +# Check that the program output is 0 when the USDT probe is not enabled.
> +# That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should not pass.
> +
> +./main > main.out
> +echo "my result: 0" > main.out.expected
> +if ! diff -q main.out main.out.expected > /dev/null; then
> +	echo '"my result"' looks wrong when not using DTrace
> +	echo === got ===
> +	cat main.out
> +	echo === expected ===
> +	cat main.out.expected
> +	exit 1
> +fi
> +
> +# Run dtrace.
> +
> +$dtrace $dt_flags -q -c ./main -o dtrace.out -n '
> +p*d$target::foo:
> +{
> +	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC]);
> +}' > main.out2
> +if [ $? -ne 0 ]; then
> +	echo "failed to run dtrace" >&2
> +	cat main.out2
> +	cat dtrace.out
> +	exit 1
> +fi
> +echo "my result: 10" > main.out2.expected
> +if ! diff -q main.out2 main.out2.expected > /dev/null; then
> +	echo '"my result"' looks wrong when using DTrace
> +	echo === got ===
> +	cat main.out2
> +	echo === expected ===
> +	cat main.out2.expected
> +	exit 1
> +fi
> +
> +# Check that the program output is 10 when the USDT probe is enabled.
> +# That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should pass.
> +
> +echo "my result: 10" > main.out2.expected
> +
> +if ! diff -q main.out2 main.out2.expected > /dev/null; then
> +	echo '"my result"' looks wrong
> +	echo === got ===
> +	cat main.out2
> +	echo === expected ===
> +	cat main.out2.expected
> +	exit 1
> +fi
> +
> +# Get the reported pid.
> +
> +if [ `awk 'NF != 0 { print $1 }' dtrace.out | uniq | wc -l` -ne 1 ]; then
> +	echo no unique pid
> +	cat dtrace.out
> +	exit 1
> +fi
> +pid=`awk 'NF != 0 { print $1 }' dtrace.out | uniq`
> +
> +# Disassemble foo().
> +
> +objdump -d main | awk '
> +BEGIN { use = 0 }             # start by not printing lines
> +use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
> +use == 1 { print }            # print lines
> +/<foo>:/ { use = 1 }          # turn on printing when we hit "<foo>:" (without printing this line itself)
> +' > disasm_foo.txt
> +
> +# From the disassembly, get the PCs for foo()'s instructions.
> +
> +pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
> +pc0=`echo $pcs | awk '{print $1}'`
> +
> +# From the disassembly, get the PCs for USDT probes.
> +# Check libdtrace/dt_link.c's arch-dependent dt_modtext() to see
> +# what sequence of instructions signal a USDT probe.
> +
> +if [[ `uname -m` = "x86_64" ]]; then
> +
> +	# It is the first of five nop instructions in a row.
> +	# So track pc[-6], pc[-5], pc[-4], pc[-3], pc[-2], pc[-1], pc[0]
> +	# as well as whether they are nop.
> +
> +	usdt_pcs_all=`awk '
> +	BEGIN {
> +		pc6 = -1; is_nop6 = 0;
> +		pc5 = -1; is_nop5 = 0;
> +		pc4 = -1; is_nop4 = 0;
> +		pc3 = -1; is_nop3 = 0;
> +		pc2 = -1; is_nop2 = 0;
> +		pc1 = -1; is_nop1 = 0;
> +	}
> +	{
> +		# pc0 is current instruction
> +		pc0 = strtonum("0x"$1);
> +
> +		# decide whether it is a nop
> +		is_nop0 = 0;
> +		if (NF == 3 &&
> +		    $2 == "90" &&
> +		    $3 == "nop")
> +			is_nop0 = 1;
> +
> +		# report if pc[-5] is a USDT instruction
> +		if (is_nop6 == 0 &&
> +		    is_nop5 == 1 &&
> +		    is_nop4 == 1 &&
> +		    is_nop3 == 1 &&
> +		    is_nop2 == 1 &&
> +		    is_nop1 == 1 &&
> +		    is_nop0 == 0)
> +			print pc5;
> +
> +		# prepare advance to next instruction
> +		pc6 = pc5;  is_nop6 = is_nop5;
> +		pc5 = pc4;  is_nop5 = is_nop4;
> +		pc4 = pc3;  is_nop4 = is_nop3;
> +		pc3 = pc2;  is_nop3 = is_nop2;
> +		pc2 = pc1;  is_nop2 = is_nop1;
> +		pc1 = pc0;  is_nop1 = is_nop0;
> +	}' disasm_foo.txt`
> +
> +	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
> +	if [ `echo $usdt_pcs_all | awk '{print NF}'` -ne 4 ]; then
> +		echo ERROR: expected 4 USDT probes but got $usdt_pcs_all
> +		cat disasm_foo.txt
> +		exit 1
> +	fi
> +
> +	# Separate them into regular and is-enabled PCs.
> +	# We assume they alternate.
> +	usdt_pcs=`echo $usdt_pcs_all | awk '{ print $1, $3 }'`
> +	usdt_pcs_isenabled=`echo $usdt_pcs_all | awk '{ print $2, $4 }'`
> +
> +elif [[ `uname -m` = "aarch64" ]]; then
> +
> +	# The initial compilation of foo() makes it obvious where the
> +	# USDT probes are.  We just have to add the function offset in.
> +	usdt_pcs=`awk '/<__dtrace_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
> +	usdt_pcs_isenabled=`awk '/<__dtraceenabled_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
> +
> +	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
> +	if [ `echo $usdt_pcs | awk '{print NF}'` -ne 2 -o \
> +	     `echo $usdt_pcs_isenabled | awk '{print NF}'` -ne 2 ]; then
> +		echo ERROR: expected 4 USDT probes but got $usdt_pcs and $usdt_pcs_isenabled
> +		cat disasm_foo.txt.before
> +		exit 1
> +	fi
> +
> +else
> +	echo ERROR unrecognized machine hardware name
> +	exit 1
> +fi
> +
> +# We expect all of the USDT probe PCs to be among the PCs in objdump output.
> +
> +for pc in $usdt_pcs $usdt_pcs_isenabled; do
> +	if echo $pcs | grep -q -vw $pc ; then
> +		echo ERROR: cannot find USDT PC $pc in $pcs
> +		exit 1
> +	fi
> +done
> +
> +# Get the PC for the pid return probe.  (Just keep it in hex.)
> +
> +pc_return=`awk '/'$pid' pid'$pid':main:foo:return/ { print $NF }' dtrace.out`
> +
> +objdump -d main | awk '
> +/^[0-9a-f]* <.*>:$/ { myfunc = $NF }         # enter a new function
> +/^ *'$pc_return'/ { print myfunc; exit(0) }  # report the function $pc_return is in
> +' > return_func.out
> +
> +echo "<main>:" > return_func.out.expected    # since we use uretprobe for pid return probes, the PC will be in the caller
> +
> +if ! diff -q return_func.out return_func.out.expected > /dev/null; then
> +	echo ERROR: return PC looks to be in the wrong function
> +	echo === got ===
> +	cat return_func.out
> +	echo === expected ===
> +	cat return_func.out.expected
> +	exit 1
> +fi
> +
> +# Build up a list of expected dtrace output:
> +# - a blank line
> +# - pid entry
> +# - pid return
> +# - pid offset
> +# - two USDT probes (ignore is-enabled probes)
> +
> +echo > dtrace.out.expected
> +printf "$pid pid$pid:main:foo:entry %x\n" $pc0 >> dtrace.out.expected
> +echo   "$pid pid$pid:main:foo:return $pc_return" >> dtrace.out.expected
> +for pc in $pcs; do
> +	printf "$pid pid$pid:main:foo:%x %x\n" $(($pc - $pc0)) $pc >> dtrace.out.expected
> +done
> +echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
> +echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
> +
> +# Sort and check.
> +
> +sort dtrace.out          > dtrace.out.sorted
> +sort dtrace.out.expected > dtrace.out.expected.sorted
> +
> +if ! diff -q dtrace.out.sorted dtrace.out.expected.sorted ; then
> +	echo ERROR: dtrace output looks wrong
> +	echo === got ===
> +	cat dtrace.out.sorted
> +	echo === expected ===
> +	cat dtrace.out.expected.sorted
> +	echo === diff ===
> +	diff dtrace.out.sorted dtrace.out.expected.sorted
> +	exit 1
> +fi
> +
> +echo success
> +exit 0
> -- 
> 2.43.5
> 

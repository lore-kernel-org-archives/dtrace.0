Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2961763B
	for <dtrace@lists.linux.dev>; Wed,  5 Jun 2024 04:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717562008; cv=fail; b=B7MlwEJ/nNXmg8qqZjUNGtwAXotfkzb8+4KRpVNZVY8SywEHAPKbrvJAuNBsIyqAb3m/YMI1Zy6kq0H8U6cLWFIyitgXCJvtlT+BX/0tmh5p+w/oqCvr3yDA++1Z6DEOciC+YJvEp9Z+BUoDalmjo+iswVrhaeYWeVDoNoXBTc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717562008; c=relaxed/simple;
	bh=Zoc/0c/6Lwm0R7pbJ0xHXyEhmPNZc1PLQA7auzSI9F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k715T40Jb6hHSOU+te9nF79hdqX6PNrOel3fue4W0rnigIl0EEEdA+Q/NJmJTAheKfU5RZ8WSKv9BtoOa0LfUX6a9r7HMpd4g5ybrNB/TXT33sb+ZArrw3lVfLv/i3IrpbeD28DvB7VuAvMxQHeCxDdjZF9vHpDLV101ZFLl+Pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b8noJuYv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ORqnbePi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b8noJuYv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ORqnbePi"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4551Dkn2028397
	for <dtrace@lists.linux.dev>; Wed, 5 Jun 2024 04:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=corp-2023-11-20;
 bh=Lyqt3Yumm5V+RlGyPrh2ieT/f0ELC/F6Y5zE5Z2uczc=;
 b=b8noJuYvXQxNyigEOa740F3MIH1Dj4S87jA9CvSfaNWSU7WO+pwO+yO88t9S6PLfYq9t
 SdIMH3ZawuHKRE36Vibf1AkYBid0/eAWOz35l2lO1hntARzF2fqW3l2C8ohGD4Gn3siN
 O/8wh4lZ7XP9R7wVSPm1XV0G2EJbMjVGaBgE54PAq+NRADHnX1U/2tLRwDDxDkL4drin
 646ffaQEaT9cPa0aDy6af2VBXe7ZcRWkxF9ezjWYQ6KPa33goyQKixqTMycaeSYlffly
 rzyD+IwPpQlXgPQKeFkStSfSzxpuRhWt1FuU3jHxV1ZGCL/2cWKStIucOy1hn4KCfHHM mA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbusr9dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 05 Jun 2024 04:33:24 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4553QlbH016217
	for <dtrace@lists.linux.dev>; Wed, 5 Jun 2024 04:33:24 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrsb0ghy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 05 Jun 2024 04:33:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsYQ/gXKOcXaGN71PmVswfCSmCtW4ox1zMoa4bSfPfhG0dnPKkTZFGmRQ/9uDFvTmV6ZZycHaWVzxMbVyPv5iWfJ0sGea/iPW+ojn0D7lZ1CD381JUJIbfry5FOU6XLCou2ACbKp5svD2NgtSejZEgEElNBA6qQigBliib6+h1DT8jcYTgGqk7EwcptSa8F7ySCIB1nPS+LycDaH//2c5h33zLJ6N30a5P788aS6oEhe3XUdlt+Cswt/eKw9qLzP+6Kj8c0u9GlhTpzF0yr5tmWCkQTRf8GelywQBDk7F0H5es0PmXec5OR8q/Gtia9yDY8VF8GDsG2GJsBjfAnzhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lyqt3Yumm5V+RlGyPrh2ieT/f0ELC/F6Y5zE5Z2uczc=;
 b=KGhLLGmTLhW6qNyD8r4X3D7c71y2mZ9spOUVjcfBQ8PdYWilTlXp8E0Bqbm1toKINJLZbUxvMhpxQ+NHLSysn43vBTldnX4gHBSUBNdUpxNe3ZYKNytKG8yyMT3sRYa0j03AFL9bmCTkrS37bIATTzC9sPrAbhIitE9GsA419wQ1GWKFFNBrhzwS6YdCRovTGGRzlURHcNH1/ww0xyHAQtIfrANBm+/h0sD7tZFMvQTkezYiNm0kiDdIFV0KqkE9t3FnR6ro2gesxPh+ONtNngGsG5RQq+wG3wnJcOhL3fyHBDhVBA71dkMetXByesiLRteEtyZVTIoWW45lYYc53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lyqt3Yumm5V+RlGyPrh2ieT/f0ELC/F6Y5zE5Z2uczc=;
 b=ORqnbePi5Lo6K88LXXgxiWUMuBEknryQV/Qpab3MaLWgQG9F+wg5gtzP7xwDh+lrEoVAPyeILUUNK58bpSUjeGdELRC3LpWWvr4FivPMvw9roN5YP8moD78ddwwLXKWoMvc3Ie47WRdBfPRYptw9aSfqY38WLGfuygnz4BTbtno=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB6631.namprd10.prod.outlook.com (2603:10b6:303:22c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 5 Jun
 2024 04:33:20 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 04:33:20 +0000
Date: Wed, 5 Jun 2024 00:33:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 07/14] Create the BPF uprobes map
Message-ID: <Zl/qjYKgVWdU5Ys8@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-8-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604181113.11505-8-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB6631:EE_
X-MS-Office365-Filtering-Correlation-Id: 200a9d24-82e4-45b4-7f8c-08dc8518a0af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K2voznX8bkbHd6ORfsmzqqtb+fpIZM0TtIyGVK7GZtwAP7qeKQr9C1+kwEzB?=
 =?us-ascii?Q?XujYlAudLwichynNfThjhi4bZ7QsMc29yvHRkml0aPSSU0DcvgKyPpmId3eV?=
 =?us-ascii?Q?kwA8bKdBfkXDfqqedGeYo4w1LNXsP6wfi4p9BGm6v+9Iz+BB/7sx+Cmhah+N?=
 =?us-ascii?Q?sjFd5gly8N5G3yNkxTzxLgE0lJgVOuXiSkrUhvCgAXjiKqdjtZ2EVF3HiopH?=
 =?us-ascii?Q?PoL+kaVxPzWc9PrXhD6GUREGh+xRc46eN/O3J+FXRzbhpid0zZCNHDitxwKb?=
 =?us-ascii?Q?hIeAURjcA71/M8pqJo3Zfd6wPuF7yWZg0h6mE+bGYlHPuHHEvifm20umHLqP?=
 =?us-ascii?Q?pv+WJXuhLirvo4AEGG8Ml3Q8aNn3Qe7ZWRTBky++baBCM0BXiB1W/TWvkF2h?=
 =?us-ascii?Q?sCOchWOVVBAd2KEXLOkQvG3Uni1J4ci+Cpydqa4aoHY6G9jVCXlemLjvCUm0?=
 =?us-ascii?Q?4AH5EcHAcyCqJFXkYSxahZ8vHwWsOg2dt0s1RiKUx9+RrwTMwOblkMXty0ef?=
 =?us-ascii?Q?gpvYzTVcrN4ZYvEPqE8m6kY/jjey19X+zRj8Spftz1KwEf8yiELAykZ+eYgO?=
 =?us-ascii?Q?HC+brmALaniOPb8v2fMRqtt7wOMeh0argjr+9ulmGlG5Yno78oZHC1nkEsQ0?=
 =?us-ascii?Q?1LNdrUsHZXXxMwpEaxZgD82XWwFLNAYou8Y4Omdwg1tJYDnmU3d7PdUa+c7g?=
 =?us-ascii?Q?XpS2lJCmybEJbWeUoJ/bqEFzGgTuIVeXo+K/L8ALRR5o6+0z73XzzahW/2R1?=
 =?us-ascii?Q?RynPOJPAMPLT4LieGvblIpmtWHpivNQJelzjEreP4s169Z5nAz05iPEA4pIU?=
 =?us-ascii?Q?ac91o++5at4qrwJnSMB+zTOEy8yXNAusbKQU+qrQeQ0POhTQOXnsxPgAP1zT?=
 =?us-ascii?Q?5wtmX/jw6bkLKaI3MWv/gfmO0cxYKVyl8hKU1122ecXX39l83phq45WYZho6?=
 =?us-ascii?Q?R6/n156es5KjaKsLhDutKox2b7opII3QLhMkTfzLqIPn5oMth8UYUgSMU1zC?=
 =?us-ascii?Q?CbSYOiY8JYtNOiQND9pK0orLkUW2ECJ2RRI8INt83XHZuPYVnSABn8pL7gqS?=
 =?us-ascii?Q?B4Xx/wZiwseZUL4F1iB1Klflo8p/5ezvKtSKkVWzg0HcMjhHYbdAWFKKbI/o?=
 =?us-ascii?Q?hbLCgfdETPBkZOD9seeXODa86AJdAz/KU5eNdeX88Q6ZH3CnTVuZn7DkH7aa?=
 =?us-ascii?Q?pyLxjrmTBs6YSYfx9YSEoP5QnPW8rphItCqBNpq7y/0i1meFdWjw1k5GXLad?=
 =?us-ascii?Q?8QCz3+YiQF81xu2SQeJ4bLSG2vs+CF9KzJUqPcw/VQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qh5bIS8KyL8s79pUQV9DXPmVs4XVFsPYVFwHA2iOPYlZE/ttpNYkpamaNTKf?=
 =?us-ascii?Q?RH514FXQGNF3J5PdbC+LzVApaA27brnAqp8efEinZjCqN21tGj9w5SxVXp1R?=
 =?us-ascii?Q?GR5ucpPKmBba6/IHSceyXuGfFlYfPG0Mmf0ftGWk747Rdkr+DL2jOX9SDe8M?=
 =?us-ascii?Q?6uKcv5pIGARW+XvQYAbTJZt/HEVn9CXzNw56hUMsDqBMIAWm/eac8fUzor56?=
 =?us-ascii?Q?nU98tWFAAuXPM0Ge+AOnYvdD7dEpbJCoKgn4A2oTuPhZBb8GGfiKUpxrq+sP?=
 =?us-ascii?Q?Dl0Kp/KlINd4t3GQED4oXNyNOj+c32ukiwvSx6Bu3Sq66jTnQ35YJNIcHweu?=
 =?us-ascii?Q?29T6hlzkgptc88S2ZywAwWhHkFwF2mhgflN2sY81ScCQl91zhFYEyl6ffG3G?=
 =?us-ascii?Q?cRbn9lrXcEi5hFR+uHo3i/zyoRlPtwSOVK+7Z3h86kigol5bNcnEeUy+u9Ni?=
 =?us-ascii?Q?SUye4Kf206jvLXvVQMM5e42FnYlNwrlDwksXXWRIDzi8oAoHU+x7z753mLWj?=
 =?us-ascii?Q?JoobbztPnP7En3pbpCdqZq2fvJOVUMlsi/+hwz7iqCiwnPeOV6ob6izNN0in?=
 =?us-ascii?Q?kL4cxoH5GtezGYuIytTxcUwLDKXTu13z5PqnV01EtYyKoP+um9V7FTe3I8ZG?=
 =?us-ascii?Q?30QSX4NNBQG5MckeGCvRrCYH1wd6Q+ghw7PXS0+1uWihzn/3cvGEJJaTktNz?=
 =?us-ascii?Q?do/yq5QWYseII0/GD0mmWawk4ooH/QjqPJsupqk5cI8a/CnpGIH0nGWrvXWJ?=
 =?us-ascii?Q?xbklyOihWG/0tIh2QzJX2URJ9CQUIXWT+Zl9WuRohjYZlnQNPXTBWJ8eOllY?=
 =?us-ascii?Q?bQ2AHl9O0VQk0URjMeiYSVE1z+T5cVKgpPkiJRU80Vxef4Lm3xBjX/ih0YMU?=
 =?us-ascii?Q?k2awRRMwgBL/7WEbfouwhBIilPq6aZgMPZBAveOnWa2uM0Ns+c1dZqXr48by?=
 =?us-ascii?Q?PcErHOWYwIFgX286qX5mD6D6bv61sEjp+rCP6PhzvkIJ5Zf6ri+UHGeg99x9?=
 =?us-ascii?Q?7yc6st4jHV/gn/SLsdUFgyOAii83V6CLiMoVk/a1dJ61f83m8+lz5iAIju1O?=
 =?us-ascii?Q?aeI6/G7tI4S5fkzhNHdr8/XqheBQKuz3XOrofOjkiYfDhaFvWYbs+QGhVcmP?=
 =?us-ascii?Q?+SO2dRgztYkv8Atev+KTN6k2hArZHxGikvJltTNNKHDCbcPRjz2E2gqfn7bl?=
 =?us-ascii?Q?JGBn71cYb0wCIAaSese783j6MJ1u/KZ1/YXCuZ9H2FWJVd1zsgtqOPClbPp2?=
 =?us-ascii?Q?N1OycI/LY8pyuxn6QJu/sW9SN9WBF9AbI9/BOgX0ogIvAbLGFuf9BOMrUdh7?=
 =?us-ascii?Q?TzCNIz3IehV9RDEjUvvGcmiz3c/za03B7LURxfv1L1EvNsg0B6cHl+HUUQqu?=
 =?us-ascii?Q?9s96OvYxeBjBYKKj7mrPQwNLYjDrNDH+55FRcz/in/H2DOpPed3MGkGwh4Q3?=
 =?us-ascii?Q?NcK3ey1+Lx6NDtl56p4llKHpxmoO3QfsUPoAiqW0pgmmcxwKauKlF1BERQQF?=
 =?us-ascii?Q?8j2ctgKkN/hdKB9WXHbglNRDkfl6dTpEe2exz+vEhuyjw2ukoUCFP0D+F1Ft?=
 =?us-ascii?Q?f2Hr7zn3KaPhyYBaAX99GGH7/3BQoB8HDqJX3zA/f+VRIKPyKfQX07AZM9T5?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xIJ4TFSKvaVHgsbLNZ7S7+H9aj3NKPrQUj1NnxBvPS1zODttJQENCzWlgk6hKz5w07tp0o6s9ivZCC65igjqa9sRTPGo28mOIYIigHqUMsEnIrNFEb7Ghkh0MHOTHtNEB7q4iHMTo3B0ZVw2wMhVsyTasKdbhv9rSQFh90W3Wa6Vv4ZB/7sTJ55lHkiFbcHEzDxLyY1adgsuCe97jou7PjsbBL36dgxEH6PW4RhlVeR4A1rAzza6NEiyYKArjPJWqCNk32Gn2fPl2J1Ha2L4j424ecdT9umxqE/P8QjugKSNKV126gKmjdRhNkxJFP4XEZZrsAAlJ9ZttCZjncihRf7TzPCwmKFDHc0cm0Pm3u6g0+k5Q+PMvPkpuf86t8P9j2o9EZwihpV72tpAl1YHOSPbRe8e8zyABY4cO3ydgv2ugeaIgsEUVZwWOpfQfPSauhcaKAEhKk6WgRkGikIS9PqHMxme9h0s1zcE7miSQBU2Gqv6kLirJei+Qqb83Dsb1FMwXD6T35D6na1ZPUDq5CYuj5GkEvvGOjDsOrVh7VoOQladHJG1wDxV0WiqlMRXz//mySQGCgxvCIGA8GtbqXag406eITk17LJ+Rh4czPQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200a9d24-82e4-45b4-7f8c-08dc8518a0af
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 04:33:20.2859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXhYAX+le10BPy+YVQEh6S6f7bDRLbOf9F93+y3flOTj4A0y7J6P7tOSquSfv7QwpsKu60zltHwzhZvKqJo2Pw9G+F/w8ym+/iCDntL4+s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6631
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406050033
X-Proofpoint-ORIG-GUID: 2kX6eBkd2vgcrVfUSgbHg0gb0eiI_HfM
X-Proofpoint-GUID: 2kX6eBkd2vgcrVfUSgbHg0gb0eiI_HfM

On Tue, Jun 04, 2024 at 02:11:06PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> WIP, sizing is hardwired for now.
> WIP, should add new pids and purge old ones (after the initial call).
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_bpf.c         | 48 +++++++++++++++++++++++++++++++
>  libdtrace/dt_dlibs.c       |  1 +
>  libdtrace/dt_impl.h        |  1 +
>  libdtrace/dt_prov_uprobe.c | 59 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 109 insertions(+)
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 71c6a446..3aeae274 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -946,6 +946,53 @@ gmap_create_probes(dtrace_hdl_t *dtp)
>  	return 0;
>  }
>  
> +/* also defined in dt_prov_uprobe.c */

This is a red flag - why would structures be defined in two different places?
That certainly risks really bad situations where one gets changed and not the
other.  Why is there duplication?  That should never happen.

> +typedef struct uprobe_map_key {
> +	pid_t		pid;
> +	dtrace_id_t	uprid;
> +} uprobe_map_key_t;
> +typedef struct uprobe_map_val {
> +	dtrace_id_t	prid;
> +	long long	mask;
> +} uprobe_map_val_t;
> +
> +/*
> + * Create the 'uprobes' BPF map.

How about naming it 'prmap' or something like that?  Or 'pidmap'?  It has more
to do with pids than with uprobes.  (And then rename the struct names also,
and everything else that is currently based on the uprobes map name.)

> + *
> + * Uprobe information map.  This is a global hash map for use
> + * with USDT and pid probes).  It is indexed by (pid, probe ID),
> + * using the probe ID of the underlying probe.  The value is a
> + * probe ID for the overlying probe and a bit mask indicating
> + * which clauses to execute for this pid.
> + *
> + * WIP.  Just make up some sizes for now.
> + *
> + *     How big is a probe ID?  Sometimes, it's a dtrace_id_t.
> + *     And uts/common/sys/dtrace_types.h gives us "typedef uint32_t dtrace_id_t".
> + *     Meanwhile, libdtrace/dt_impl.h has "uint32_t dt_probe_id".
> + *     So either uint32_t or dtrace_id_t is fine.
> + *
> + *     How big should our bit mask be?  Start with 8*sizeof(long long) bits.
> + *
> + *     How many entries should we allow?  Start with 1000.
> + *
> + * FIXME:  is there any way two different overlying probes (differing by more
> + * than just pid) could map to the same underlying probe?

I expect it ought to be possible to place a pid offset probe on the location of
a USDT probe, thereby causing two overlying probes on the same underlying one.

> + */
> +static int
> +gmap_create_uprobes(dtrace_hdl_t *dtp)
> +{
> +	dtp->dt_uprobesmap_fd = create_gmap(dtp, "uprobes", BPF_MAP_TYPE_HASH,
> +			 sizeof(uprobe_map_key_t), sizeof(uprobe_map_val_t), 1000);
> +	if (dtp->dt_uprobesmap_fd == -1)
> +		return -1;
> +
> +	/* Populate the newly created map. */
> +	dt_uprobe.update(dtp, NULL);

This seems to be something that ought to be done in a function called from
dtrace_go() that goes through the enablings (and perhaps also the retained
ones), and calls a provider hook for any probes that match the probe spec
that relates to it.  Something like that.  And then the provider code can do
whatever needs doing for that particular matching probe.

> +
> +	return 0;
> +}
> +
>  /*
>   * Create the 'gvars' BPF map.
>   *
> @@ -1051,6 +1098,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
>  	CREATE_MAP(scratchmem)
>  	CREATE_MAP(strtab)
>  	CREATE_MAP(probes)
> +	CREATE_MAP(uprobes)
>  	CREATE_MAP(gvars)
>  	CREATE_MAP(lvars)
>  	CREATE_MAP(dvars)
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index bc883e11..7bbeb02c 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -66,6 +66,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>  	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(mem, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(probes, DT_IDENT_PTR),
> +	DT_BPF_SYMBOL(uprobes, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(scratchmem, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(specs, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 1bf79d80..935b96f4 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -438,6 +438,7 @@ struct dtrace_hdl {
>  	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
>  	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
>  	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
> +	int dt_uprobesmap_fd;	/* file descriptor for the 'uprobes' BPF map */
>  	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
>  	void *dt_errarg;	/* error handler argument */
>  	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 34906aa0..591f2fab 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -45,6 +45,7 @@
>  #include "dt_probe.h"
>  #include "dt_pid.h"
>  #include "dt_string.h"
> +#include "port.h"
>  
>  /* Provider name for the underlying probes. */
>  static const char	prvname[] = "uprobe";
> @@ -70,6 +71,15 @@ typedef struct list_probe {
>  	dt_probe_t	*probe;
>  } list_probe_t;
>  
> +/* uprobe_map_[key|val]_t are also defined in dt_bpf.c */
> +typedef struct uprobe_map_key {
> +	pid_t		pid;
> +	dtrace_id_t	uprid;
> +} uprobe_map_key_t;
> +typedef struct uprobe_map_val {
> +	dtrace_id_t	prid;
> +	long long	mask;
> +} uprobe_map_val_t;
>  typedef struct list_clause {
>  	dt_list_t	list;
>  	uint_t		clause;
> @@ -135,6 +145,54 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
>  	free_probe_list(dtp, datap);
>  }
>  
> +/*
> + * Update the uprobe provider.
> + */
> +static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
> +{
> +	dt_probe_t	*prp;
> +
> +	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
> +	     prp = dt_list_next(prp)) {
> +		pid_t			pid;
> +		const list_probe_t	*pup;
> +		dt_probe_t		*uprp;
> +		long long		mask = 0, bit = 1;
> +		list_clause_t		*cl;
> +		uprobe_map_key_t	key;
> +		uprobe_map_val_t	val;
> +
> +		/* Make sure it is an overlying pid or USDT probe. */
> +		if (prp->prov->impl != &dt_pid && prp->prov->impl != &dt_usdt)
> +			continue;
> +
> +		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
> +		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
> +
> +		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
> +			dt_uprobe_t	*upp;
> +
> +			uprp = pup->probe;
> +			upp = uprp->prv_data;
> +			for (cl = dt_list_next(&upp->clauses); cl != NULL; cl = dt_list_next(cl)) {
> +				if (gmatch(prp->desc->prv, dtp->dt_uprovdescs[cl->clause]))
> +					mask |= bit;
> +
> +				bit <<= 1;
> +			}
> +
> +			key.pid = pid;
> +			key.uprid = uprp->desc->id;
> +
> +			val.prid = prp->desc->id;
> +			val.mask = mask;
> +
> +			// FIXME check return value
> +			dt_bpf_map_update(dtp->dt_uprobesmap_fd, &key, &val);
> +		}
> +	}
> +}
> +
>  
>  /*
>   * Look up or create an underlying (real) probe, corresponding directly to a
> @@ -803,6 +861,7 @@ dt_provimpl_t	dt_uprobe = {
>  	.probe_info	= &probe_info,
>  	.detach		= &detach,
>  	.probe_destroy	= &probe_destroy_underlying,
> +	.update		= &update_uprobe,
>  };
>  
>  /*
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel

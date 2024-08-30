Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC53513634C
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724987661; cv=fail; b=sUZNa3GQIMcfe0NaeVQfTUYErgtKaekUfy8wxxSkSBLOY1D1xFZGW2jZHslXQuHXRcVjYi3cfUCMjfivYhEMq8xs3eQBTxXOuEuhl7/ewcBNZvUa0/ENkJufY79USfbgBizWFSba73WFU8RJd6Py2s40Bz1/H3cyAXF1K7kP0xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724987661; c=relaxed/simple;
	bh=qnhLZEnsbONA7MfohOVDZlVKHjCNlsC/PnlJfCmKZHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kZvBKnBhv6w8bswmZB0ZjOAqCLC5Ii0REPbnREE7iS6HiAYXzkELGwFzPcM0mkPhqdu4JUaYwGKCmM73/cucF0levYUeY3HkKLnJA0JD/qBoBQiY4xdY8F/BVKCQpLidzeWaA0VFb9xvJgdcssKuKuIh2pwDoVuaboChxdrRl5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ad0NHzL0; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ld/Gx5kN reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ad0NHzL0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ld/Gx5kN"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U2fVTc001106
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=e0hBfcenSmFb/PhpNv59u1KWuKiJHz5NYUiVSMdw0tI=; b=
	ad0NHzL0UIzFiLJPVgUhk+FhrP22SYrq8U5npNx0P2/LFRb2rEiddRrlcnSlICZ9
	lgN9+u38IpfUE/tTW0aO/JlbTnWhuOc4Uxs3rTl4GsIriPZoDYS2art9ZcnyRQ5X
	uZNOPX+XI+8clBt0O14BsV/1b0EEhmiWSETm6OP2KhJtWN7H9bZkQ+o0A4dw1z0M
	nwIV7IxaSi9kGL6/SYmH25wktcF6LeLepSfPLzIdOcgYoTVcILeQZGQysK59O+oD
	JeAWfw5OSTu3J3PBEZyMRSmvBM0Y/CZlRWzMj1WcG5Hr86E+XtgW0i8qtNbCiXJ5
	1wgSp1DUefWdiY7TFQIsdg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41b25qg75y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:14:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47U23vba020279
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:14:15 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418j8r95b4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:14:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzoJ0Gc6W3Z8ZglwP7WssokhBQQUHtDSaLW7OVDmyz6rBnvvQ8e7Conwl/vsVsA780h0yWDeRlkNW1cs6hHsrTx6O3NsFGp070E4JnyzEQFMfdWLNvpHl5NGKxE3iEBA7f2F93VxIL4zItZcdTNQBRIC33BMSq13Mgn8qE1ZemOlS1jBsrdmqitvMMZ/lZl3PLbPNQ82aFvJTtwwczwAko60aZHwj7l7gLlkGvlwbl1iZ8cSG6jbZslKkS9FDp1VaXL3N+sXbx17kGjbW64TbLTjj1V85qGq33AfHsO/KB8nQWy62h5ZizDnEezhcf9jAv1L07ekmmD3GKHUHaefGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFOmAUxtKEPmyXJ5nn1Higt/hkwmzX4uHXu3mYKA26E=;
 b=qszc20FG5nXJg5B9haijlv82OKXsahzF7J4RbYwjsBqZQy4Gk87dqbqSvgFS+WTKnzdKjncm83ZdML+2jiBUUAiKsXfnMv8+CRosrmBul2Y0y32w6g+xJ7QkNsLKsxa+WP8pB5ZQgQfKPwWhaCqpB2qHlgQ0NhSlgYwRnq7ARRXI6hSOz4uzVdUAeJg2wE58xmYYfOlZtNqChyA0VWnzvVbX8fPV4txBSQcKmfD0VVfOlqDExCA6m3st04PIm/OEXMVfwHkowMB1c3N2Pp5F96uU1lQNbpZykv7c7OYG41Yg88OTZBfEiVxiCGsPrRFFiDCbB8Lbhb2geBqlBXx2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFOmAUxtKEPmyXJ5nn1Higt/hkwmzX4uHXu3mYKA26E=;
 b=ld/Gx5kNYUwfz5zP/GJUBmg6UY7LOgq/4bW0V5PKPrXgm02azL5jwELiF3EbpTySRt/eJL7FJ2HjpnLxbCvCBhd2HnYdDP1UHjdm+7f0ve5+zSd0hAINH2tVaBZs3S3PYm686A/rTLHlb4NDYtd/aoW1DxtLS2vDbCxyJrf+P0Y=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB5153.namprd10.prod.outlook.com (2603:10b6:208:330::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 03:14:13 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Fri, 30 Aug 2024
 03:14:13 +0000
Date: Thu, 29 Aug 2024 23:14:10 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: DTrace development list <dtrace-devel@oss.oracle.com>,
        DTrace dev list <dtrace@lists.linux.dev>
Subject: Re: the whole EPID thing
Message-ID: <ZtE5Ai9bee+deC1u@oracle.com>
References: <6e005836-d4ee-fa4b-615b-0e1c19a267da@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e005836-d4ee-fa4b-615b-0e1c19a267da@oracle.com>
X-ClientProxiedBy: BL1PR13CA0412.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c141217-2cf2-4b2a-9f04-08dcc8a1d2c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?xhiYjFC0Giefhz6bRYAWYKyQ8vyRGU8FIG1CyCBRLC9iqKlCNjyFBQo8QA?=
 =?iso-8859-1?Q?emVwG4kWTfIgMdSzSOFHFqB2c+IO087GijeOJXyGJuH/OMXgy2I5yuBGVO?=
 =?iso-8859-1?Q?Zgf5OufuZby6ZVQt0Re7rVnHrclr7dzUWlIyAqn6niAsXcbem0Up3M6UPS?=
 =?iso-8859-1?Q?OewTqg1szlkkos2adAyUvU+fuAwyV8v0xEebMdnHVUsP6xblgHqzxqrzt0?=
 =?iso-8859-1?Q?xE435DglVWkwgwH2sL2YfI2Vd5Bg5Vh9A1C2EBmctzyFDiz9cmn+E3rcT/?=
 =?iso-8859-1?Q?mm81L90bS8Ezs9VIpudyN+G3wPocF40NPsSVCL5Zw6/+RcarXP9VITGbWO?=
 =?iso-8859-1?Q?ok4rVgsLHRuomXF6hLglmwtky4lOKjf1fZUwvBCiXGrSQ8sbmkns7GfTVo?=
 =?iso-8859-1?Q?yMJ2bbyRAa1VF8nN2vnpUwWaP9sh9ZYjoei3TIZaFbr4O32lTL+oM+Zrzw?=
 =?iso-8859-1?Q?+xp9UO4KgAR9IQvdYg+hEDDxrE5zi336Iv0zBR2uUyn1I+7SuAAectRMHA?=
 =?iso-8859-1?Q?0oAhqrv96GGwHhh7ZaP38lF9dUhRBE+xKiza1KoUV++mE4QSJI4YlE7H0a?=
 =?iso-8859-1?Q?1Od5/VJH/LW3UCF5gtf2f2s9TWV4G34MDTTMC1T8vS2G48sjkS4yWFiUrl?=
 =?iso-8859-1?Q?DixH9cvqZ1/XDVnPa3vuVsjrKf67dhO9cRp3lX4i3u+45lwX2ADGfceMK7?=
 =?iso-8859-1?Q?ZV9i81ZXrVZHpc6OMvuqVX7pkEY5HaY1KPwbLHWuh/KIoMTZDXjrH9Z8R4?=
 =?iso-8859-1?Q?debzPDYXkUgd71kcyvJ15r/xMz7JmOmGCPRjIadrpd2h60CeTqEbCM3a50?=
 =?iso-8859-1?Q?YN0lPZiLPOte/CLUoEvSzBxn9WpmeG8lEYQOteEtT/GyW7uvzBR+6Ldf0o?=
 =?iso-8859-1?Q?Z2u4N3XFoUlev2RRjosljHIaLGIiSCPm4MP/0hXi3BQmfEA2fci2ysZUzH?=
 =?iso-8859-1?Q?tzEKFAoEk/bqaRQMwCvuIKx1KLJeI7c4kNjc94Rn8D2z9JF8nt4OJduCaI?=
 =?iso-8859-1?Q?fIX2mFV0cY2nDg+HhO2wBDy6csNX4/joNQqO1B/sRQmespwGZw07rk9T40?=
 =?iso-8859-1?Q?T5UYMFw7Uvv3Ac3fjoEXmC7i2JrNdVL+fYrFUr9Hd8TdIO4eGKanhMKPiX?=
 =?iso-8859-1?Q?thrXM21UZTz4mptL/oK3BDyNUy1BykEQyzvEZOXJlbVwXHusXJOgUUBUW3?=
 =?iso-8859-1?Q?D9t6gHmEYt2HQL5pB/1wFu5Wr9dH6bIT+zQxyd/vFxEzSO3NRja8/3HK5T?=
 =?iso-8859-1?Q?e3a/H9dFS4igEGz/NDBHyHYCEmUSnF/NJwl+iyufVGIk/Wb2T0oGxPSukc?=
 =?iso-8859-1?Q?XAcYeLwrpsvUJY5rIjVRF8g9YD1+ggYNjQP2Y9MkaoTqIJcEyVFSpAnjNM?=
 =?iso-8859-1?Q?xo5uvHHJ5qMFz97WMe4JB8HPApqjR2LQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?EjE1hp8zH8/ah5TcRMZK/U0OAnG4ml/p1a3Awnf7bIKc5fynNv8B4ykbPg?=
 =?iso-8859-1?Q?73bRucNaV2X6K5AwH0WdbMCcZNQ4kYlHmX3r8RCkhZmX939ju+yjvJL0Q/?=
 =?iso-8859-1?Q?4z0pSDgaiMfuS+LuH1jIsJWBcYcIwB5yh61zssQ0KHsqKokYdsKPWarnV2?=
 =?iso-8859-1?Q?KtwR7DaSXWtD5/6OEjn2Bwm88fE50Cr8HQEvkOjuOz6lWsjocbGT626cQL?=
 =?iso-8859-1?Q?czW+5i9GzazU4jdqZMpUyK196Kbi0Y/hwICWgXx6Fo3QNsEtYg227Cljht?=
 =?iso-8859-1?Q?czlPzcrtuRQWYf+n+4mi4jLvSGqTBkaDljr+OoEql6GKvXVHDL8KdsfiAz?=
 =?iso-8859-1?Q?7tAxH0uZSoGqQzouYT1qtD2PYPj5UEfhSGxSe6jBEffLPAr+D0iHG9Hxnv?=
 =?iso-8859-1?Q?F578dkGz0YZviYYkMpnS+tfOzbc+rmIcnssoHhviY4QtxZLO3jub5JZirw?=
 =?iso-8859-1?Q?eqph12VL0lB7WIEQQDjifhU4r8EvZoe1wQRSberwmuNXZY14yKKpSnLS+p?=
 =?iso-8859-1?Q?WcjprtasmLORSywpLMirQf+5L63tyRIy57Aika47iAXCP89BixqBU72aeO?=
 =?iso-8859-1?Q?nVqkfeDFIe/h/HKPC2RAHKhSFtaUeJa7V1KDzCpZ0ihq/dnkVz15VxKH19?=
 =?iso-8859-1?Q?DmVZR7l85Fy5NuR11OmjqIvM8TYNjT79pgQMYG5vaB4cwgr2EfZ8NeGACG?=
 =?iso-8859-1?Q?H8OaqHrqZTLcdR4ixTe5Ve09S1vVrl6mNjjrkDDM99cbFsQgOOFLnaAJWK?=
 =?iso-8859-1?Q?ueSyYIW0JZPiu5wZi63eBf/WkIEOLz8PRRZGI+cPf5dIqEJeGmzn0CgB9W?=
 =?iso-8859-1?Q?ifgM+3EkaPnE7U5y9I0yUvRFK+M3RJo9mFRaNnXQeRnB/EBwXWF0lXRpJX?=
 =?iso-8859-1?Q?ZqOOPFDTUNItlrOuf9Rt1V/uk6afZuTUaONlt8WyJ201KdiCp+kuLO5Ev2?=
 =?iso-8859-1?Q?xfdW33pcXLR+5yCu6Pp2vXWCU0G9iQQI35yCHobv4iSBig+gnJZ1aJDRp+?=
 =?iso-8859-1?Q?4IFPRwrT36Q6kQ/R/RCX8C5wEpZE8qr1UmfxS9gNmCbR0gOLoH76UHVf/b?=
 =?iso-8859-1?Q?YTOVSNU0Pq/4pyuJawIKaJ/8/sWJVy6cdVQpJ0WfI8ABIAtSuv/Zc2sy2W?=
 =?iso-8859-1?Q?81FhV2qgis7kr1e0VsDx11Egomk7Hi8LsozDBNeZPdlJIo1v6pwJvqF2UB?=
 =?iso-8859-1?Q?G+DGJ6wSPV+d8kl6jkVATrCHyb0Ieq19X2gUnWVdmaOP8EU614stMhOvGt?=
 =?iso-8859-1?Q?YtVNuAa58X0rawrmxmmHVau6RzwgMoyy5/tvjLi8l/QWUUm6hnR5pT+cVI?=
 =?iso-8859-1?Q?DdyI0U52qL2FqGF+YiN/iWwjEuiulM80d5WE0+mTo+h5Z8AvL5HwNn1x6G?=
 =?iso-8859-1?Q?IlB9PRk9CqcGODrntIv1yDonA5JEvOcENBiOlKeJ2wHPSxfBRHO0wlM3d5?=
 =?iso-8859-1?Q?S74Fk9ObzHtHcwHADwhAomePU1Y1LpXeGBkR6uvlQWEwkSbjKkkExmDaSt?=
 =?iso-8859-1?Q?bHMr6u6GgV6/ljK9nBAf8bSNJHjgOrWzrzwc8MK4+OuYCvj9oTb6xrgQ0j?=
 =?iso-8859-1?Q?TWP617ekmGiHOMzqmt0VBQAHEWOEL8ObQAT44jZzwBQskBrEvBlYxc7IJX?=
 =?iso-8859-1?Q?mrLU+P72F8JwG643cKQU5EIYP23ihOgVhRhyorpQn+qHrKF8TlkOcwaw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tVKpQRb3ock4veI31PbvNMfi8hsuQAqssMuIUWt/0FMpMXy8L+F+GEgaY6qSfQqntzZSSKbbnrsw1F7lhIEdrAIjyxxvogCsL7U30VqdmHFon8xCmnYPSusxxZgeS7GlSu1pJnSdRpu4L+H2cAbFKHgzLusMRyglAYRrsaHNd0hMh1Hq35jrYdQQoYP3vGFarA5KfuHOqY1EhmTFfb4wuU3k8Agbtkf98pSFsN4wPiM3u4xXO2ft3CEbsa7AOxN5MeVsPQdt/0/u469EmkOycLTjoF/5Kicpg2+O9aoakz90Gkfkvzeu6TZ6mQrma+c1WY/j5HPoVi3ldhh9wu2JSsPrrKzw1Pmxl7CEmBOV460cwo3i9JOXmgmrQ+4EqZ6o8ndgICNvjfur5wFVvRybg5+VZdwZLvuLbByxQgSsHjg2sV7E+zTm7dxN9og0C0rTRq9jDaiCR2lFbvG8UfVu8WKzQLf2+5Nt5yT9G/EaW1/qyI47BYUPF8xcJGg913bfdTA8wy5n+0hWmoRoLZHNR+VCu/rji+FTRrjnb0At++UjppeKlnqMXjyqxGHbBGDOHiNshshfm+ycOrjUDsiHxme96ei2QKZ2rpvMCn+k3VQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c141217-2cf2-4b2a-9f04-08dcc8a1d2c8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 03:14:13.2621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eONRp60DcqhvxO8lQ5BzJ085zt8RqhE/XNcUrrPzW60L9PeraWTRMNzrz0QmU25Se5D0OyTCi4KYcHVuFBebfpIOVQkKYGn28vdowY/r3jY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_01,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408300022
X-Proofpoint-GUID: 1DL4JgCNp1xUMg8vHZGKbB219ioXQcvC
X-Proofpoint-ORIG-GUID: 1DL4JgCNp1xUMg8vHZGKbB219ioXQcvC

On Thu, Aug 29, 2024 at 08:37:38PM -0400, Eugene Loh wrote:
> If I understand correctly, an epid is supposed to be an integer that
> uniquely identifies both probe ID and statement/clause.  The consumer
> reports a problematic data record using this integer, whose value matches
> that of the built-in epid variable.

It depends on the perspective you take: user vs implementation.

From the user perspective it is per the documentation):
  "The enabled probe ID (EPID) for the current probe. This integer uniquely
   identifies a particular probe that is enabled with a specific predicate and
   set of actions."

The user cannot know how that is implemented aside from the fact that there is
some relation to the probe id.  While it also identifies the particular clause
as it relates to a particualr probe, the user does not really have any way to
identify clauses other than perhaps by the order they apper in the tracing
script.  Nothing defines how that order relataes to the EPID though.

The user can obtain the value of the EPID using the epid built-in variable.

The only other place that it is user visible (except for custom consumer code)
is in the ERROR probe where it is displayed (and is essentially useless) and
used to derive the probe ID from it.

From the implementation point of view, the EPID has been used as index in an
array that relates the EPID to a probe id and a data description.  It is also
used in the flowindent implementation but that is based on a simple comparison
of values so any value that preserves a 1-to-1 relation to what it represents
would suffice.

> Is the proposal to abandon such an integer?

Well, we cannot abandon it since it is a documented feature (albeit rather
obscure and of doubtful use).  But the implementation changes related to USDT
clearly move us to a state where the implementation perspective is no longer
relevant.  By passing the probe ID explicitly in the output buffer, there is
no need for the implementation-size of EPID.  We do however need to identify
the datadesc for the trace record and we can do that with an integer id that
refers to the statement (clause) the data record was created by.  So, from the
implementation side we really are moving to probe ID and statement ID (for
lack of a better name right now).

But again, we cannot just get rid of EPID since there is a user perspective.
But nothing defines what how that value relates to anything, as long as it is
a unique identifier for any (probe ID, statement ID) pair.

> If so, I guess the implications are:
> 
> *)  Change error reporting (say, to list probe ID and statement/clause
> independently, but no epid).

There are two options here...  We can keep the error reporting and report the
calculated epid value (see below), but that seems rather useless and results
in excessively large values.  Or we can change the error reporting to be more
useful, and report probe ID and statement ID.  If done well, that could even
be extended by reporting the identifier for the statement so that it can more
easily be related to disassembler output.

> *)  Do away with the built-in epid variable.

As explained above, we cannot do that.  But we can easily generate it as:
((probe-ID << 32) | statement-ID).

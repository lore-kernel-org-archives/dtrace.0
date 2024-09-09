Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03D017B515
	for <dtrace@lists.linux.dev>; Mon,  9 Sep 2024 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725903110; cv=fail; b=aSHkkE3m1o/vrCAKz18q9k1oEN8yvAfI1DYAYPTSFMXrtod6g+uRuedp1ZHpbHVKoMAiHvJ2vX3ueGJipT+AXKFXTJpdCDYxoHyb+YsQ9/Yv6RoKXkASXGzpRseR+gxurBKHH5N3TqbTjf2EJUNYhYzG05RmcXZpke5MisYKBLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725903110; c=relaxed/simple;
	bh=IjyNoT94YAoMgMDfeXX5wQ6Heg+g+z9CQh2J20/eK5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hq8ziVy/oiXnp1yadagP+gzmqUm/5cbxEvTFQDad8y7Je1unbEmEE7lZpcvdfn/sAYAlZzt7qIgOfrpoebqipsy8guMSQh/5FZxwb3geqWXzlD4bedvNRh1wbWTfhCGykx4hGODUToGPnhf+JLA2I5nBRnvxgWtHhswC44JpTno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Mvol7ElW; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hnUKCsF5 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Mvol7ElW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hnUKCsF5"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489HCDjS011144
	for <dtrace@lists.linux.dev>; Mon, 9 Sep 2024 17:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=sfKDymi7vflv0qBWt7FLbLfUHBo2KKF/VY4Wbs8zWec=; b=
	Mvol7ElWI91d6mYx4UerFJwdkbi4K7losua3NdYCgoiPKsprGCrxm8Wdv92lVWBS
	3nTIxb2P+cEERixjnC0cGFcPSIgcFaq+70ixVow6duZvC2scvWZRck1cMlTgHVf7
	qBHEo+qEKn0wuIMHR78WrjoApc7rp+dUnerLoiKXx+/IG/WY98B8U0YaeNHZe/NO
	kfaJVvT62lyJ6TLUorHAlfyCTLPPbVGEzwaoaewuwrN6Y0KxuATcL+2wNaFJjYIu
	M2Hnw33tQ8cPyp0WICe8eRQHPXBYlQXGL/JT63/yA+UW5DDr+MFGT8SpKCu7oQgn
	ExwJEf2QmFu4YCm/U0OisA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gd8cukth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Sep 2024 17:31:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 489FsioW006329
	for <dtrace@lists.linux.dev>; Mon, 9 Sep 2024 17:31:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd97g3q5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Sep 2024 17:31:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrMWsbs4PpmbS5llt0y19iJQMzPV4zeHT9DxSbE6vuw7hb0cWct1OU/xCdQKbMeYs7tGnaGPYq7KF1qR9UVeqUmI0ZRdC4mqQ3ECY+JzqZ+3hvI6huI/BWWUYdGq/D6s2U9rrFHie0C814LuZLDyqI95ZKrf+AcHLUk+Ca9+o2R3u26/F1tAeP4C/b2pB6CV9NVmw+Y8jycloNCxmEZL9R6u5D/iCTF7MjatHlylS+3C8Z5mAtAqTZdAoIyB9ORwCycX0IEpxl2bBL1JQHYp19MdMkjBgVfOgf26vbpU1TwJ8T6yEj+duYVDcD4zhybNczTZ7l6jktZCIaWCoCYAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLkXZ6oR7kU3wJPWQtep/PCo80nLdunKqiYHKvRHJgQ=;
 b=eu7/gpt4FrX1ta7s2tlg7GGuhiXTTPUXomhl6bVv73KeeOX8ngNA95UOxo+ca6jbDKr71pH8NQ0YkKKvjzVSKeJLJnnJ2YruVv9ifmTyfYxeoR6MxN/p1KMfUi2XaVVcBRgX15LjRKQkh+rq+vQyYQ7H+QaPWOILUy1kTzEN3K1YLvZYeFu0lygh66f9Yfit4a6R+To3ARNjdeIcKiWSDnOHw8n3nkCNmMe9ZNYL3BRuUAVO8pJgqwDw9VQkYnNTi+ryp0u790qSzJ3j/gMv2uhXBeakhiXN/wW/rxteI5w6bwWPfcgwgiFzkDzhsdsqkDrDgVcv634+MnG+EkA4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLkXZ6oR7kU3wJPWQtep/PCo80nLdunKqiYHKvRHJgQ=;
 b=hnUKCsF5XtYwLQ8S87d2ht7SXIk/2S5Z4IDHY6PvNngu6f1aECJXrKOEx4rPQzClsgMDzWt3Ymo/Zq/AtkTFfTSJgSWMo2+u5sLe2B0CynBCIB8juH56AbgerRGZr710RQHo2J+XZWRy6OKHdq4DRhZ5tEf8NOhu9Dx4buNMmD4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB6584.namprd10.prod.outlook.com (2603:10b6:303:226::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Mon, 9 Sep
 2024 17:31:37 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Mon, 9 Sep 2024
 17:31:37 +0000
Date: Mon, 9 Sep 2024 13:31:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 03/19] Deprecate enabled probe ID (epid)
Message-ID: <Zt8w9uRKDrZVG1Ik@oracle.com>
References: <20240903051643.17203-1-eugene.loh@oracle.com>
 <Ztp3paXrmBIuigSb@oracle.com>
 <536b6eb4-cde5-709d-d93f-1a442a0aa9d1@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <536b6eb4-cde5-709d-d93f-1a442a0aa9d1@oracle.com>
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB6584:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb20652-155b-4cd2-1b20-08dcd0f54216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?dGGiQ9Sopf5zMaXgaouNTeT1uZpy0Js/1AyCRJvGlGh1H7wpLXpPFx5LLN?=
 =?iso-8859-1?Q?DejKa6kChG0YbALvjdDg3NROwW8ofCeP0J+deqgIwZtIxgTSWSuPwPBNqk?=
 =?iso-8859-1?Q?DvljMahjKV0dYwJdBF91n8fReRF1bv/l++AVDEW42e4jAdM24ePSaP0+FO?=
 =?iso-8859-1?Q?pcifusmHkN0k5/JIIOQvVdgWJqO5bemkfYjwy43PkLapZa146ZGXmVNTAl?=
 =?iso-8859-1?Q?vzhtP376+ZAvJlJynA0t4Xd7AdarBjaBqmpM9Yiefq9lfBHeXllSc4Bd0d?=
 =?iso-8859-1?Q?4uGOi0+8tdA0ShXG8JPx1aANLD8aA8dgUISaRzlchECFYLyGtOYlSg7G3m?=
 =?iso-8859-1?Q?7iTXzx0+kub/QiS9by2yQIMp36lbb0xV6e+7DaTODB/imdWy9nD4ScgxV8?=
 =?iso-8859-1?Q?ki4NXoWXriD4TV9as7TuAMvHGH+WETS/iSZw/jNG1PSkNSTwtf/B46rqfx?=
 =?iso-8859-1?Q?yb7sZ/gfWNDZEAB5DsEiiPF67Z2YW5Xi0M1jb9msCuQXqAZNvCRAoUDYKz?=
 =?iso-8859-1?Q?qzr7kaQxM2Gwprg/ANwOLfzbHLvaqjO85fulEmYbKt/rqpyHhgUj69Nh8c?=
 =?iso-8859-1?Q?sePb1M/3GRU5ym/zlOcfIfPraRXBl5TVt4wL68rS468cuzaUoIgWp1VglX?=
 =?iso-8859-1?Q?Skx+H3wD2axxXs/fwICgXPJy5N4KPLRW9CNxzCe0e6SguEBX/qgTxxok8B?=
 =?iso-8859-1?Q?yU04yVYJZWqtsYwi7ftMjXhBXpMff9VZ7UUjN5T7Xt1AT59xwaUpjzBbL5?=
 =?iso-8859-1?Q?bu5c3LwTb4epuSoZiQX9Mw5JfSo0iADk0ygYPY22pgGncxd4Q2fSOQmU6J?=
 =?iso-8859-1?Q?6Yea1J5LSMQrtfC11xrI1iJd3g1kgqnXjVhH+sOSvBjHL8ya75SX4aT9rw?=
 =?iso-8859-1?Q?4Gtxw+6ddVk9N+Az1Dxwcx51jZqQc0C3AqhA9/F3s0nZ6gCnyNbNYf4LvO?=
 =?iso-8859-1?Q?NOPehWCXBzF1MiaGnoehxZ6Zb49wxgBsHOy6WOhiWzYQy8TOhPgSYKqf0W?=
 =?iso-8859-1?Q?aKKzC5Fzh4pTL6yY9vSnG0pN4YUtwX8s244cdZkcNha2H+vH5b6QTmcYAc?=
 =?iso-8859-1?Q?4HUsMlMLBBgbC4pIK4dRSPrtHYAh9uLCSWFgJkontxHIgIKBAHWQShZLx+?=
 =?iso-8859-1?Q?+7G0IwH+t09Ho27dH5jDK6KgVJ9PWj/97P9FDBMcDsMn/WrR76Eu71incB?=
 =?iso-8859-1?Q?vAbkJXhZ07mhgCIeOcXLYQwk/KCT2/5Xu1ytspiNoS4hmcqTFdj96VXYF8?=
 =?iso-8859-1?Q?tURsr4gZBDvB9AbCHTI7x0u+gqQYmAf9dPW0rwdYcUsVywQL/adV+CyT3n?=
 =?iso-8859-1?Q?K1JbqjdbAVfNLSutpSzXlXfvq3H5fKl9iPxQF7jcW5uE1soyrrGiUKDq2/?=
 =?iso-8859-1?Q?l1DhsmSIqo+kEo5Vt7IJ2rpImoloPvGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?/Buj06TuUHrvxY4e9modQanaQQJoHIYJypR2sMZfa8fCDfrHQTPfSlbbnl?=
 =?iso-8859-1?Q?J4kJMRrwOnF5uFQffyiwtakFYz1TqyLbhIxA7YNG7x1k6ogP6noas3biQk?=
 =?iso-8859-1?Q?Xp0BrGnoxF4idAcU1AySfq8964IQpLNr4k3ZxhMwuzOXbV8kDbGuSIZ8UO?=
 =?iso-8859-1?Q?IL2PE94vl7o4FEeElKS2bqOTpcEBGV2hNc3b4vIEwyHVMTMPN14WdH+XJi?=
 =?iso-8859-1?Q?pQhbjqdAwN7nFS5WMP/zqCT5wedhre4fNsRYD5Pqnzc4L9uxae42OHoK10?=
 =?iso-8859-1?Q?MaYBElTMIQIGIUwaISK+4ANbTZXxVUv95ruzMmk+SkMpDIPb3gvr4W2kT9?=
 =?iso-8859-1?Q?lU3//JqdnZVRxcK66ll2h3QiLbz4aaBeyN1t5mwh3YiQKDYGP+brdioC12?=
 =?iso-8859-1?Q?b5JXtMWnMoJVxXbB1HBBh4WN2IFJ/QxjchN2rhMH1sq65wcQQq5hFMqEkR?=
 =?iso-8859-1?Q?wILkSuSlS0JcIuHRbDG1OyuiIkrQtDZG9nUAaDSHEN9Awa+kEwR4GCq1OB?=
 =?iso-8859-1?Q?Z8i7sVeIoQwvVF/YmbIrBIVt0aEXt9H56qqORVniP9d9+y2g/bJVgqWYUb?=
 =?iso-8859-1?Q?jm924NYxMyLIkhDcmVlchPmeEq2w2WX3Zbd7X5QPOH4deZ7WszPgV/wQ/l?=
 =?iso-8859-1?Q?RdMtXtje8csEmvYn6eW7zgvN5wFYeAJ/ltPZOJRh5Acvn2ZO84uX8pFzPm?=
 =?iso-8859-1?Q?bCkBL7Gwr06p15gEM9xdil5NA7LEtFlE/+pj3beLtOoNkIeROyQ6piAoA1?=
 =?iso-8859-1?Q?mlggzxUCdt+hfA+XjEpZ0TLKpLWYfSaS2eQq1QOF5/0KI73IN0REy6da2O?=
 =?iso-8859-1?Q?Jb0i1aKDvEkKt1rDWM1U6UjKN6MseGKi5tAtirHttCn+XOiY/hfcBXg04c?=
 =?iso-8859-1?Q?IUE1MTMyMqtyquhCUI1JCuKDk3FYwu83gdGeh/A5H0FZ8kjTe9p42gDljz?=
 =?iso-8859-1?Q?Xp8wfKViU6OBCdJUug9qKu8tZYNDMiye0107P0NkwmgX4aIVVEMH/Si5AQ?=
 =?iso-8859-1?Q?0m03ifPZ72h3/JE9o45Q3yS2y6mCdy/2AC8zagv+uj9oTO/wD5XXrZ5rxY?=
 =?iso-8859-1?Q?0dYsGSNtYae11ssWqjT+jwCYSoIs/BzjjoZVhxtnUEvDo5LWKS3x6JXg/J?=
 =?iso-8859-1?Q?9bpshTDu/AR8Z8Naru8iboPf8Mrs3b7h5IvTyvYYnBIfUJwV6MdOjgL4A7?=
 =?iso-8859-1?Q?EgbpYdDra/eNO71K6zY5tchiHLXUiMeLOGNHnYw0hD2GTVpzTe07xgOY8z?=
 =?iso-8859-1?Q?8Y4HwFNVQ77mFt6fs/IUeg09i3raSgtlRvMZYrr4NH9int9npnM3SiAeII?=
 =?iso-8859-1?Q?LwQfUVa4EknPr9bWeDq2etLnSCofywwk07XVgoiSjWEL5I4k3IOIcOhdGR?=
 =?iso-8859-1?Q?AcIr+cZMegg1JggYFDqNk++x6ltsnxDm7MoV2bU0GgHljLukzNGMypU2wW?=
 =?iso-8859-1?Q?dJxXfUUJ3aD8H6WVFPKwUckKLq44JGdjctxAHeC2jwtgyrprkIT99JjEpi?=
 =?iso-8859-1?Q?4/jKIdUQIPiKSmajo0UcbbhnAwRG27jDFKBlyX4iU+a3186Nzw8l5HfIrP?=
 =?iso-8859-1?Q?MZ1mpaPoiidivITEYiY1SlETeSua/120UBuHx6gyc4Vq+iFczBNAwT72Wr?=
 =?iso-8859-1?Q?c8gx8lxREB1R81UddKZMQnhemMLpluLgQucOYT7nLoQrHBqJif6kyHoA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fM//3xkJWWAAxdBRSzTtt1xgttGiLOrRf5D65DZ9r6ujoPDZEs6NmpN9XGtyQK5GM6FBar5zylM/el4cukSGg06IqpB976l0neuYNGj2O0GJn1PSmtQAkD/hZl31Pp+hNZQ4/HAsyjx/gP1SytSDZw9RSUtiqBV/dOvhkrzqdgMSc8g6gvlTDlLQsv4GzkIu/nElxu82Ho37yZGt9yw7U70Mr11DSIR82OWueg8yIF8qVB3kJTzRX8K7VmIU7MqTCrn+ADXiRwFH8wCu3w5KD7sg+TmNT8skCUa2mvjAenMr+ydqWOY8rRspVF1Q8x4k9CU6Ei9gI1Of37wlZUdTrO/mNrHzeKJQi2IL/KjqQTLqnts1WUQvjssJ+3Ld4D9QPH4upNq5eOYdOpQPubZmS19jxcQkDyRs+ECACbLNDWBvJ6ze6oxzQey+q/yLppwn5OBGwL7VC5Qo3UdaAtxjOnk9wT3rgnsUzZ6WmIjACco3y75W5i3oBsM07DtM1kBq8aRnbDo3OpmXGz8Y7HLKl77PX+BBOiJWkW98ncHRTwo1FTBeI5677qryWJJqSOLrOX6p8dFrV4sSgZQRPbv+DrpujM7RqrbwflJbtz4zXKA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb20652-155b-4cd2-1b20-08dcd0f54216
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 17:31:37.6005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWDZHiWVfMB3oslUW19wOLEV7QjV2GBCW/TS75qW8yAxwBWCquyGd2+xRZYReeY/hYnttAtSZQM8pu4zdwtXYhAGSnkVG/7tnXoECIcbtjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6584
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-09_08,2024-09-09_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409090139
X-Proofpoint-ORIG-GUID: uqI6TPAaOXAvlEtf0OMRyJJYWkhJJz2N
X-Proofpoint-GUID: uqI6TPAaOXAvlEtf0OMRyJJYWkhJJz2N

On Sun, Sep 08, 2024 at 12:31:12PM -0400, Eugene Loh wrote:
> On 9/5/24 23:31, Kris Van Hees wrote:
> 
> > Great work!  Some comments below...
> > 
> > Note that with this work, we are breaking the libdtrace API
> 
> Okay, but perhaps it was already broken, at least through disuse and
> changing ioctl stuff???

There probably were already smoe breakage changes - I am actually not sure.
But this definitely is one - but as I wrote, I don't think we should really
care too much right now.

> I'll post a revised patch (and small revisions of two other patches due to
> the index/id naming change).  In a few cases, however, I comment below:
> 
> >   - but that might
> > be a small price to pay for cleaning up some needed things.  However, that
> > also means that we could just break it a tiny bit more and make things easier,
> > perhaps.  (Yes, that goes a bit against my earlier advice but it really makes
> > no sense (in retrospect) to keep supporting something that we are breaking in
> > others ways anyway.)
> > 
> > See below for details...
> > 
> > On Tue, Sep 03, 2024 at 01:16:43AM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > However, its value was opaque and therefore difficult to use.
> > I would drop this sentence.  I think the preceding paragraph sufficiently
> > describes it.  And you risk confusing the reader concerning whether the epipd
> > was difficult to use in the dtrace internals or as a user (who won't read this
> > anyway).
> 
> Difficult for the user, but even if a user doesn't read this text the point
> still matters for the reader.  I think it's worth building the case for
> deprecating something that, after all, was part of D. Noting that the value
> to the user was poor helps build this case.  I added a couple of words to
> clarify "to the user."
> 
> > > Deprecate the use of EPID:
> > > 
> > > *)  So we rearrange as follows:
> > > 
> > >              old                        new
> > > 
> > >           0: pad (size)                 pad (size) <= buffer start
> > >           4: pad (additional)           specid
> > >           8: epid <= buffer start       prid
> > >          12: specid                     stid
> > >          16: data[n]                    data[n]
> > > 
> > >      So now, we say there is no longer an 8-byte pad before the
> > >      buffer start;  rather, the buffer starts with a 4-byte pad.
> > I am not sure whether this layout comparison is comprehensible to anyone not
> > familiar with this code.
> 
> Yeah.  Incidentally, I had moved specid so that prid/stid were in the same
> 8-byte block so that someone could read it as a single 8-byte EPID if they
> wanted to.  I'm assuming you see no value in that.  So I moved specid back
> to where it used to be and I think this simplifies the description of what's
> going on.  Anyhow, I revised this explanation.  Hopefully it's sufficient
> now.

I like the specid first actually :)  Since it reflects the designation of the
data.

> > It may need a bit more explanation concerning how
> > this is used.  E.g. the size that is referred to above is a 32-bit integer
> > emitted by the perf ring buffer code, giving the size of the data blob that
> > follows.  And this is the reason that we need to do this little shuffle with
> > the padding because (1) data needs to be written to the temporary buffer
> > storage with proper alignment, (2) data should be aligned in the ring buffer,
> > and (3) the perf event header + this size results in the data starting at
> > a multiple of 8 + 4, i.e. not a 8-byte boundary.
> > 
> > > diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> > > @@ -156,12 +157,12 @@ dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
> > >   	/*
> > >   	 * Generate a symbol name.
> > >   	 */
> > > -	len = snprintf(NULL, 0, "dt_clause_%d", dtp->dt_clause_nextid) + 1;
> > > +	len = snprintf(NULL, 0, "dt_clause_%d", sdp->dtsd_index) + 1;
> > >   	name = dt_alloc(dtp, len);
> > >   	if (name == NULL)
> > >   		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
> > > -	snprintf(name, len, "dt_clause_%d", dtp->dt_clause_nextid++);
> > > +	snprintf(name, len, "dt_clause_%d", sdp->dtsd_index);
> > Here (and elsewhere) this should be replaced by:
> > 
> > 	if (asprintf(&name, "dt_clause_%d", sdp->dtsd_id) == -1)
> > 		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
> 
> Hmm.  But:
> 1)  These were pre-existing constructs.
> 2)  The other other two sites used alloca() and handling the free()s would
> require a bit more rearranging.
> 
> So, okay, I updated this case but left the other two cases alone.  I don't
> object to asprintf() but those other two cases would seem to be material for
> their own patch.

OK

> > >   	/*
> > >   	 * Add the symbol to the BPF identifier table and associate the DIFO
> > > diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
> > > @@ -85,98 +85,16 @@ dt_datadesc_finalize(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
> > > -void
> > > -dt_epid_destroy(dtrace_hdl_t *dtp)
> > > -{
> > > -	size_t i;
> > > -
> > > -	assert((dtp->dt_pdesc != NULL && dtp->dt_ddesc != NULL &&
> > > -	    dtp->dt_maxprobe > 0) || (dtp->dt_pdesc == NULL &&
> > > -	    dtp->dt_ddesc == NULL && dtp->dt_maxprobe == 0));
> > > -
> > > -	if (dtp->dt_pdesc == NULL)
> > > -		return;
> > > -
> > > -	for (i = 0; i < dtp->dt_maxprobe; i++) {
> > > -		if (dtp->dt_ddesc[i] == NULL) {
> > > -			assert(dtp->dt_pdesc[i] == NULL);
> > > -			continue;
> > > -		}
> > > -
> > > -		dt_datadesc_release(dtp, dtp->dt_ddesc[i]);
> > > -		assert(dtp->dt_pdesc[i] != NULL);
> > > -	}
> > > -
> > > -	free(dtp->dt_pdesc);
> > > -	dtp->dt_pdesc = NULL;
> > > +	dtrace_difo_t *rdp = dt_dlib_get_func_difo(dtp, dtp->dt_stmts[stid]->dtsd_clause);
> > > +	*ddp = dt_datadesc_hold(rdp->dtdo_ddesc);             // FIXME what releases the hold?
> > Well, you are the one requesting the hold, so you decide when it is to be
> > released :-)
> > 
> > In all seriousness, I believe dtrace_stmt_destroy() is the place you are
> > looking for.
> 
> Actually, this is a short-lived usage by the consumer.  So stmt_destroy()
> would not seem to be the right place and, indeed, I just decided to drop the
> hold/release altogether.

Yes, that shouold be ok.

> > > -	free(dtp->dt_ddesc);
> > > -	dtp->dt_ddesc = NULL;
> > > -	dtp->dt_nextepid = 0;
> > > -	dtp->dt_maxprobe = 0;
> > > +	return (*ddp == NULL) ? -1 : 0;
> > >   }
> > >   uint32_t
> > > diff --git a/test/unittest/actions/setopt/tst.badopt.r b/test/unittest/actions/setopt/tst.badopt.r
> > > index 29e39fd4..e2f6d2c3 100644
> > > --- a/test/unittest/actions/setopt/tst.badopt.r
> > > +++ b/test/unittest/actions/setopt/tst.badopt.r
> > > @@ -1,16 +1,16 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > > +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > Perhaps it would be more efficient to update runtest.sh to support both the
> > old and the new error reporting output, and changing both into a single unified
> > form that substitutes changeable elements.
> 
> I don't get this.  First, there is no reason to support the old output...
> that would be a rather remarkable historical vestige to keep in the code
> base.  Second, it seems simpler and more stringent just to compare to a
> results file in some simple, straightforward way.  You say "perhaps" so I
> just left it as is.

I was more thinking about making the output we compare less dependent on how
things are phrased so that we do not have to update .r files whenever there is
a change in how we output the data.  Except for a test or two that verify the
exact phrasing we expect.

> > E.g.
> > dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > 
> > and
> > 
> > dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > 
> > could both be rewritten using pattern amtching and substitutions to be:
> > 
> > dtrace: error for probe (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > 
> > and tests that are supposed to exercise specific aspects of the error message
> > or that depend on specific details could test that explicitly?
> > 
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
> > > +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
> > > +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
> > > +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
> > > +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
> > > +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
> > > +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active

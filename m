Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C3B288535
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769469905; cv=fail; b=qkRg8k0T1HKzY4wQ/lO2kiIWXtOIzc9VTKtTTOE6Adi9UBmfDo9nnZhabycCrjwZ8P0u2pwZNQ244u2oE3R7O6nUpz9telO192bhHhkfo3DsDljBu1tbEKHRbUWKyXNfkmXgNlEzl+WHpgNRMRK5Lao6AoIFnZJjpgetD5BASdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769469905; c=relaxed/simple;
	bh=EcGDPo/pyxc3E3S9KV70slQY0D5MK4FlfhAyAXWj9cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hTpEqTbN05CbBCc9zvfdKusJ+P+X+CC2uno7umAlth1rUdE6hukg6qyFJ/g3jfvQgr+5NnFmbxQmCxewTaQcIKlk0lqSM5+DWc3wds5lSRE0tVcIZ2srwYGqSOjHGhsKsu6PSP/LCNNHqptjKr2+RUDc/GOw+lmS1dVlPvMAJD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ixkHl9NZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OVPynuQG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ixkHl9NZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OVPynuQG"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QNMFsh206589
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=AKx1/9HDZdDwWqherD
	y25L5BQBjuwKfnP5iP0IhXNUA=; b=ixkHl9NZdPopkLFoQLMo/u9ewrN2DLkDWq
	8ZKvCeoKPx8ACiByPfrAcda8NdTl+oY2usaeviNL9pd52rAQHCJn8Zx719z9MBIS
	KeYYyza/SkXfOvY/u9oqkQGIQNF69ZmLTslTx2P+RJ/o/+bu9qSqka2hPzd1obVR
	peDlcihkuDErOx+9XYDw67xSry40ZaFfyrksI7Rht97Z7zlR8frIlu3g1WAwjyFD
	19my7Ai1Dt8/o9GCl8vZRtU8KCqqH4a2QbPsecjNyDK43jJCiRJyNiGi+G/NXDiQ
	segAE14dvDJaWTUD2GWV5LASuunrvgar1SS6dgazanFRAEWthBOw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvpmrb2ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:25:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60QLmRUX010567
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:25:02 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh8mv67-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:25:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QtG2hW4UGKcSs3ODyOUiCe9PC9iKqSnpedVuFr9KGLduwER6AT4Ln4kOT3dacZFQ45nwcN9mu0I4OcrGwtoSeDWT2JpA6rKhoXhAUY1BOFNjoiQK4Q6ql/N/TtV7y2YlwJefc2FdkHnX7XJPR2haQVoBqg0msAB0nSBI+s/8X/1+tm2qJ/BzT7Go+InueyIppDkJchi13fdqkPd2mZZlr2pGAwGYbfCqSCbnqdlz00gqY5upgdeDN0Mxz7KmxM5YN4XaYRBUPx3Oq5TNC+Lr6Xcb/cVamU9nZQy0FRXC+QWWgscJn3epJ2nbRVy/0Cundl5iRp1JH8br6G+gk52Zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKx1/9HDZdDwWqherDy25L5BQBjuwKfnP5iP0IhXNUA=;
 b=j7AlV4VVv2ZOfJgShNOEo5z1v6EhNBg1MIinQQIoPbvcCuwFmDP7jtYg7JqnJP3tf6Gwdie/7EzZZiFrNqd8YYQ3TpgTav0+8xCj+tpPa5kRqbcBrS8A1QgpId81S6QBkG46GiDX1pvVQRtcYEQ4fmT14WbEd1WR0qmOr0oFgK47o5uKbrzrgo86Ii3HgFRfpuh5vERETASJYNwaVRaBHogxrX64RNArm8KT3DW+XeVUGG+wl3FBR/pIAfyql89YHyig+Mr4mOrbQNKMN9mv5zd8quYU94qcXMpm+vBsbZSj/958B/VDnitpAr15yn7DnUdj3Y+okhShtUSufIEWBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKx1/9HDZdDwWqherDy25L5BQBjuwKfnP5iP0IhXNUA=;
 b=OVPynuQGSNns3TmYbRzRSC/1DoUfDqEsYJ1jhL0wK2q9O92i1d/UVlVI+owGLMrG8xpXjmyaBHi1RIi/WBY/6pbiKMR0tTbuszAw/EdLIIQflwj0/HGVgW2jVzae+9GpYCYAf87iVZfNTmGdIUW4lVdpzCIIpkJCulmXUxYFX3s=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH3PPF079E800A3.namprd10.prod.outlook.com (2603:10b6:518:1::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 23:24:58 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 23:24:58 +0000
Date: Mon, 26 Jan 2026 18:24:56 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 2/2] rawfbt: prvname is not properly set
Message-ID: <aXf3yO5B/gTzjGd2@oracle.com>
References: <20260126225408.20289-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126225408.20289-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH3PPF079E800A3:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2de8f4-4176-40ad-7d52-08de5d321f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pbNxVgv4VUo89t7QjRU9ErzCjbQw//kim7VdvrGfabAEhELyp9c8NJKYx9lb?=
 =?us-ascii?Q?m7/Jdt42uvGOyYWoOZluFZV4eBOtnRaOtpyFlh/xh6WsYyultk03RRaAgZvd?=
 =?us-ascii?Q?XpjCac6B0cgTe+tOyGfYE02jAOgpspNk/+A5FdZYDEuZZJ0Qo0joh3GS0Jty?=
 =?us-ascii?Q?qvSdA0IzXdf2nYvu/0l/rYqRd+Pcb6/Wwgcpczq4Xc4RZW25kgt+8mOLgLSa?=
 =?us-ascii?Q?+nGv1pjO9+Ia3JleVSvrXc5okyHD8mDWExxQb3pon0ruO0UZ/MuNcFfPivXQ?=
 =?us-ascii?Q?TXWRZHzM+U4JMBcgwXNhsQn6nPXfpZjn+dYlaO9GJQWiOHYWnr3+mulFnF+b?=
 =?us-ascii?Q?mlm19Zzqt5YOLg13I7/NT78R6spp2uKsoSLbqUfs2G3MQ9pZ6CHCK4IFqqIk?=
 =?us-ascii?Q?3/WKPbIekkzjuzF63Sc2nJGmMV50mA2yXBh4ANpgD80w2LoAkC0Dk1IvcwCf?=
 =?us-ascii?Q?q/SdtfsYN2fisPpYBhakR0Q96at9uQ1H5Je5OwF5k5V0bIHJJxcVA/j7Vn7T?=
 =?us-ascii?Q?aozUUzvDcA/1Ed9YGRZ/YBAg4l3PnT61eC6fsxy4G/CX88jV2odPwjmXmj+M?=
 =?us-ascii?Q?EM69AJVSx1KeAcdLvtKmVIK8ICYtAbNQG0P2EC1ZIvu4DezxmHzn77jhzF/R?=
 =?us-ascii?Q?GKFjkBKIXPKwDUhkmysCK7dpalHCUepJejB1abMU0J8Z+sIQTmh+MWbknOgj?=
 =?us-ascii?Q?/9YY88zlM7fxrjNcOvp8t8njIYJfV2P3IbC6h6z0DyXlDMvnoggXDsaO+8Ww?=
 =?us-ascii?Q?PvDjWJDNHVWwsygXc8EmRZ4UP0FyiwvH7wWheGNPMO1B/h4poaKugS26GZcO?=
 =?us-ascii?Q?K8VhtZ43z4/fCi9YcWlPi5c7tKYXCN685j94RrQ6xDMLwvpzr+AYbY5d6H/c?=
 =?us-ascii?Q?gFE38jO0w4PdnoGBqOt+7ks3Vq5AvvVSsvCdsCWtBm7ZxXi6/gLPOIQKo9Sq?=
 =?us-ascii?Q?5gCeeBAcqMz69DzjOhcE1uXefS+Dbbf6IjTt7+IS/a40lw0yt0UuDMiTDM9h?=
 =?us-ascii?Q?GWTQV4cIb5GPjaPByAf5lj7b1LQ5sLTv4zEnqN/AnX17ag98BJnKTJYaBWls?=
 =?us-ascii?Q?fLQtWyTym2uwlRrsQcWexF/XwDVFLxG6v3rXV1WLlfN1QPxLKCpUZ9K4qoIe?=
 =?us-ascii?Q?woMPDKdIOCb6PlwacGbu6mDmyFmZ315BThoQYrc8YDnbHoDDihTRP1FCArMz?=
 =?us-ascii?Q?IrCJJTQi6gl2xSxjoNmgqKp3S//229NgQu5Ov8OFQH9zexsCEEonqoFE2sVK?=
 =?us-ascii?Q?VqQc9KJnAvADzgXSdlWDOQs9u3i2IJ0u1rzHitp/6YFFq4D6xIBHu2m/Hfax?=
 =?us-ascii?Q?P9tOW2gG/37GC7/W+C5bthYf/yTQ6WoD9GTkRvO9l8OS71Zxkcg8XZWpOsXE?=
 =?us-ascii?Q?+rHTNkrWh1GB77vv7LbU/9QipplyY7+ltsaJLQJRhZEZHD0hMMMh69RojPzD?=
 =?us-ascii?Q?FaEeXjv8x2FNgLgr6vMBcNwJQVSbRtp8EIxbl+2bzyH30/1//TPaWnVaEa/k?=
 =?us-ascii?Q?hrogGRHbRlVQV4jwGBcSdAGNgCKNm9QTzrLiVk0wCBWIqKDx6UFSDicdKxIx?=
 =?us-ascii?Q?OQ6vIt7ZfetBaYMoiwqN7zbJIVCKuw8kxDOVhPQA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Yq1c4Yg0KeiHVkwgfyjQEkUWlyepRII6/QoE5kRkvr9qGSwXCyprC56rmbY?=
 =?us-ascii?Q?FIdTr98ATfLHTcvPOCk5kvQk9aYUDtJS/FLR7z0ZwcgjMK57qgggoZsEpSe6?=
 =?us-ascii?Q?wbqnmF58LoDWPqYwaDUccRPNTJRf9+iKLSDCwkVjxsGbx/R/HPX42hyQhb7p?=
 =?us-ascii?Q?Ok4ijTriPjTcJXxaf2bnss1LKAc+Nt0riaXdco7jAXSbFozMVd+SJymzO1zQ?=
 =?us-ascii?Q?YeC3QNrt3mH8zUtiWU+VxzTlhtFp9TNb1YjuWxgpRNeNDUe4Uxbriw+6vH5E?=
 =?us-ascii?Q?cWrfAVMCgb+TKN7eSXpYbksROiRDfHbfr8IzKaJ89+W+WweDUreiflFfBXkS?=
 =?us-ascii?Q?spNrorzeTP8VLZd6yuUzW1tpC5ABH3U2lHvO5oJ8gOcYBua0/tirpMEVNwRx?=
 =?us-ascii?Q?MiazzZ9oUuXpYWi8OQydw165Ao47LlUrEKAH2bhHdlBlKBFncvAArdCUPVZi?=
 =?us-ascii?Q?BG+68LJkf2bC+YSE7Bj6my2Va6UPQI2h2s4XvERjoFC1ZpIo10zmqCXAp3Ek?=
 =?us-ascii?Q?LJLdVB60cyOpFVPIrh4MMXTmgNdl/QgmJB/+czk4MLa7zBynl1XPJMM9+h8a?=
 =?us-ascii?Q?vMuBaBqtEpkBDxlE3oxf6oIC3f/ZWn+wOFtyXoH/UHliBmNCPloBcSA7DxCR?=
 =?us-ascii?Q?aqE0gQS+U/CPyUrEBqPaTcQoNQZZziz/c1+1N70sc02cVdTiNZjNzxNViT/k?=
 =?us-ascii?Q?yEjuRO4Yxo3JOWnIXifZqfyT5HyUTtaVODwfbdOR7OPLjR7gzOZ7PPAjfkRE?=
 =?us-ascii?Q?updCEDt9t5SnqLJSE2d2xxxqTJzJ8nZZPVq/Yo6N99rRS8ZvPawPat58ZdVT?=
 =?us-ascii?Q?ZPy0xYX7PloG7AgTSkj4bjrFWlbnfV9ljgUGHl6eq/na+sVOiRQjWc/3L6cp?=
 =?us-ascii?Q?UgvdsHSjMiprWIbPGbBDqhuxik321h0KRuryTTM9u62VUe2iPOB10DIgc2Tn?=
 =?us-ascii?Q?CC0oiqNlQzGI/vkLbWN7ZqRouMEIk9lF/kxXqeiRAZPMSDtY76a6OwLleSS3?=
 =?us-ascii?Q?olkMjdfruelPEzO938xVP4vA093JlzUXTOTwQTA7b3QM7hrkk75b9juraBxm?=
 =?us-ascii?Q?Fy5oAwBKNbGLhs2mchCJdLFzbBQJRk1m3DOVh+YHtn8i6UExBBp0s/X3h8Po?=
 =?us-ascii?Q?Dk6L47wwzXG/22G86xE81S1vV/+CPqtE9crlsfdBnidmOwuz1i8XSLpi+aM3?=
 =?us-ascii?Q?CYBuFQtj0mecqXXKa8Y/7xzN6YGkNYgK9Lxn/hIPhBk323FlQYk/F7o0I3bS?=
 =?us-ascii?Q?p1DsasyqFKN5W62NPn4S0aaqaqk6cg+4ctK96Jz/pLQ+ciRCA0a45Bn9JKRs?=
 =?us-ascii?Q?BWrUf6xYt3Td89qCt4By7FXWieDFp+Q1/vCnNbS5LNkZmpU5jcb4J+HbdLGJ?=
 =?us-ascii?Q?+CpGfjpKBqNokEvXXncVCO0Q1YvoMKITvGj5iDIZ8Y+AJcOsIdX2yPSl66vg?=
 =?us-ascii?Q?DvuzBUSEOjvrZfNVQP0iI91lWeK5Xe8QKpGsFGKtwkevMk0lndXe0K5CYdn6?=
 =?us-ascii?Q?jYIY+xJcOigebduWSWnn6h2gQYY82+BLvmRy0b79+5FMJ3r9yvcWwqJszErz?=
 =?us-ascii?Q?Qy36hAUPCOwFnZieegpdk6cgTkK0vfd55F5TInvS/IV+mdMlAKtSDhTzd3NZ?=
 =?us-ascii?Q?TCuEAZBpsYCMEjLYyizdnT19qmhzUKBeg39Uh1IQR8NBNsfbUK9zL6fcTJAs?=
 =?us-ascii?Q?6cVuhJxoYKY9IPcls5aVxgo/G/5H3hJpzTsqTmRpdR+Y2vuyX3Qj0knIaP6C?=
 =?us-ascii?Q?iIvPSuY3Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	troBNQwOim7Jz38Da3qJIgl04tqcuWggu2g38EzcmNnP7kYFT5CnAmCQ8/3hoy/OIVMsMvu8F/at9SOYmSC5htXORzam3I+H4b5cmCx2lS1ch+hdKdAC/7c+RdpAH04zWb5UE8Zx8b+WyO6PD3AxoDqPkYYA7niKr0TEUfA1sZkwZbw6L+cOJKVdsefwh0qqg2y3oWgZUw58GOT6ZJdIpbyCayxW4x8wENFOmle1UUWDPuyeSKbyiUobyEVKuq89eQ3a/S+T+hTuU0TzUDb4LUj5uZevhxWlUEdpx/DT6sgYjuhQt4l+WVjImfgfd0xnIErATdZKDrRNOTrSVUt6+tTysQr6idKO/3bTZTN3H2lY1WrI9mBGTTnAFa+p2Q0pmNQkXMZ4CKK9XY4PTNEuBuerqJDA2xHk3dBUR5MYQ3eGVoiB+gPx53VLgut7Oy5voqxNgsEvhjof9f8ZCHt2k+s7/IaxlOWwq+CKrbLwPzrlvZvMC5jt8j9qFfhk5OkrJ31X0w6uIGEhkMlnKBDuhFgLU6GbsxXIuf7BbuO/8RbE+/ZaQyFoU5feqUUJhp7EFlhHkEBsqLlw11xElbcc2HqU9aOIhto+gg0JgxEGSRs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2de8f4-4176-40ad-7d52-08de5d321f01
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 23:24:58.4677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtjPUHIKhsq5zxkCTC64S5e9KSq8alv2MG7KUkLH9O6yjYXTADhmkUTyiK/qgYW77V3LhQ1fIKDJ8Z0MCF9cDoMkJc+416wC+zdLlxxyBUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF079E800A3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601260200
X-Authority-Analysis: v=2.4 cv=Q//fIo2a c=1 sm=1 tr=0 ts=6977f7ce cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=VydAl2ixoEANyGNhwjoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: JBDPh4rfKbf8EsFSzEQyt_SiWX7lhVxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDIwMCBTYWx0ZWRfX4yB1VIw5Z2yc
 dna1QNK8lczTRNNtHhywfrs0JiCA7c64cCaad//Lm87GQPZRY2gjNlMGgyPuga/ivqZ9b9Ce3F5
 wDR2CdqVe1tIhbiyoaa0bCTm0NG3hbK8rQdICM73LH2Y4eLCpGG1AiH7Zeg77cRuPJWcKrFnpM3
 hfdKIvnks3L36NbFnfkpKbyOwJ3Sj3TP+ffyNdc9EYFYrCVXN2NKRBucWCz+I/fpjTwbcWRi0jR
 99ASerTq6k22/eagcgDF9CkTee8whqP0sqMXn3FPPRNu2tgZ2Xy9zNM8Sl0uBllMcDSdQAYulfE
 iZ58xcu/4xrP3ONnK15anPD7DOZWz2E//9JNyVIti+aEh4pjtfwwaMkm0LomSkQUuvLjJpUmZ53
 +cZE7vhWtMzkgYlaGuklMVq3+e9VrbG0y/uZl3ZdEbWdgjUG3E5Mjnzs0hZKIUvkc5BuxMo1MqP
 xPu2ngltHFj9KtwXJVQ==
X-Proofpoint-GUID: JBDPh4rfKbf8EsFSzEQyt_SiWX7lhVxy

On Mon, Jan 26, 2026 at 05:54:08PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The char array prvname[] is set for each provider.  It is used in the
> file that implements the provider.  It might also be passed to
> dt_sdt_populate() via a function argument.
> 
> However, dt_provider_tp.h also defines the macro GROUP_DATA in terms of
> prvname.  In turn, GROUP_DATA is used not only in dt_prov_dtrace.c but
> then again in dt_prov_fbt.c to define FBT_GROUP_DATA.
> 
> In commit 0b7c5a632 ("fbt, rawfbt: consolidate code to avoid duplication"),
> the fbt and rawfbt providers are combined into a single file.  Thus, two
> uses of prvname collide.  The in-file collisions get resolved, but the
> cascade of macro definitions does not:  FBT_GROUP_DATA ends up using
> "fbt" for both fbt and rawfbt providers.  As a result, it is possible
> for rawfbt probes not to be seen.
> 
> Notice that GROUP_DATA is always paired with prp->desc->prb.  Therefore,
> simply replace:
>     -#define GROUP_DATA     getpid(), prvname
>     +#define PROBE_DATA     getpid(), prp->desc->prv, prp->desc->prb
> This makes the code more compact and relieves the macro definitions from
> needing prvname.  It also makes the FBT_GROUP_DATA macro unnecessary.
> 
> The format (FMT) macro is similarly renamed and redefined to include the
> probe info.
> 
> Add a test to check that a rawfbt probe can be found behind an fbt probe
> when the probe description has a wildcard provider.
> 
> Orabug: 38842114
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_dtrace.c                    | 14 ++++-----
>  libdtrace/dt_prov_fbt.c                       | 13 ++++----
>  libdtrace/dt_prov_rawtp.c                     |  4 +--
>  libdtrace/dt_prov_sdt.c                       |  4 +--
>  libdtrace/dt_provider_tp.h                    | 12 +++----
>  .../providers/rawfbt/tst.wildcard-provider.d  | 31 +++++++++++++++++++
>  .../providers/rawfbt/tst.wildcard-provider.r  |  6 ++++
>  7 files changed, 60 insertions(+), 24 deletions(-)
>  create mode 100644 test/unittest/providers/rawfbt/tst.wildcard-provider.d
>  create mode 100644 test/unittest/providers/rawfbt/tst.wildcard-provider.r
> 
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 9f1d3e104..1bd405b81 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -239,8 +239,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  		/* add a uprobe */
>  		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
>  		if (fd != -1) {
> -			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
> -				     GROUP_DATA, prp->desc->prb, spec);
> +			rc = dprintf(fd, "p:" PROBE_FMT " %s\n",
> +				     PROBE_DATA, spec);
>  			close(fd);
>  		}
>  		free(spec);
> @@ -248,14 +248,14 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  			return -ENOENT;
>  
>  		/* open format file */
> -		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
> -			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
> +		len = snprintf(NULL, 0, "%s" PROBE_FMT "/format",
> +			       EVENTSFS, PROBE_DATA) + 1;
>  		fn = dt_alloc(dtp, len);
>  		if (fn == NULL)
>  			return -ENOENT;
>  
> -		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
> -			 EVENTSFS, GROUP_DATA, prp->desc->prb);
> +		snprintf(fn, len, "%s" PROBE_FMT "/format",
> +			 EVENTSFS, PROBE_DATA);
>  		f = fopen(fn, "r");
>  		dt_free(dtp, fn);
>  		if (f == NULL)
> @@ -296,7 +296,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>  	if (fd == -1)
>  		return;
>  
> -	dprintf(fd, "-:" GROUP_FMT "/%s\n", GROUP_DATA, prp->desc->prb);
> +	dprintf(fd, "-:" PROBE_FMT "\n", PROBE_DATA);
>  	close(fd);
>  }
>  
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 76134ce1d..ed1bd93d9 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -53,8 +53,7 @@ static const char		prvname[] = "fbt";
>  
>  #define KPROBE_EVENTS		TRACEFS "kprobe_events"
>  
> -#define FBT_GROUP_FMT		GROUP_FMT "_%s"
> -#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> +#define FBT_PROBE_FMT		"dt_%d_%s_%s"
>  
>  static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
> @@ -508,16 +507,16 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  		if (fd == -1)
>  			goto out;
>  
> -		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
> +		rc = dprintf(fd, "%c:" FBT_PROBE_FMT "/%s %s\n",
>  			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
> -			     FBT_GROUP_DATA, tpn, fun);
> +			     PROBE_DATA, tpn, fun);
>  		close(fd);
>  		if (rc == -1)
>  			goto out;
>  
>  		/* create format file name */
> -		if (asprintf(&fn, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> -			     FBT_GROUP_DATA, tpn) == -1)
> +		if (asprintf(&fn, "%s" FBT_PROBE_FMT "/%s/format", EVENTSFS,
> +			     PROBE_DATA, tpn) == -1)
>  			goto out;
>  
>  		/* open format file */
> @@ -583,7 +582,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>  		}
>  	}
>  
> -	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA, tpn);
> +	dprintf(fd, "-:" FBT_PROBE_FMT "/%s\n", PROBE_DATA, tpn);
>  	close(fd);
>  
>  	if (tpn != prp->desc->fun)
> diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
> index 897415459..193795974 100644
> --- a/libdtrace/dt_prov_rawtp.c
> +++ b/libdtrace/dt_prov_rawtp.c
> @@ -56,7 +56,7 @@ static const dtrace_pattr_t	pattr = {
>  /*
>   * The PROBE_LIST file lists all tracepoints in a <group>:<name> format.
>   * We need to ignore these groups:
> - *   - GROUP_FMT (created by DTrace processes)
> + *   - PROBE_SFMT
>   *   - kprobes and uprobes
>   *   - syscalls (handled by a different provider)
>   *   - pid and usdt probes (ditto)
> @@ -89,7 +89,7 @@ static int populate(dtrace_hdl_t *dtp)
>  
>  			*p++ = '\0';
>  
> -			if (sscanf(buf, GROUP_SFMT, &dummy, &str) == 2) {
> +			if (sscanf(buf, PROBE_SFMT, &dummy, &str) == 2) {
>  				free(str);
>  				continue;
>  			}
> diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> index fb024b078..f9de2cf85 100644
> --- a/libdtrace/dt_prov_sdt.c
> +++ b/libdtrace/dt_prov_sdt.c
> @@ -54,7 +54,7 @@ static const dtrace_pattr_t	pattr = {
>  /*
>   * The PROBE_LIST file lists all tracepoints in a <group>:<name> format.
>   * We need to ignore these groups:
> - *   - GROUP_FMT (created by DTrace processes)
> + *   - PROBE_SFMT
>   *   - kprobes and uprobes
>   *   - syscalls (handled by a different provider)
>   *   - pid and usdt probes (ditto)
> @@ -87,7 +87,7 @@ static int populate(dtrace_hdl_t *dtp)
>  
>  			*p++ = '\0';
>  
> -			if (sscanf(buf, GROUP_SFMT, &dummy, &str) == 2) {
> +			if (sscanf(buf, PROBE_SFMT, &dummy, &str) == 2) {
>  				free(str);
>  				continue;
>  			}
> diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
> index f131b1e02..406609d1b 100644
> --- a/libdtrace/dt_provider_tp.h
> +++ b/libdtrace/dt_provider_tp.h
> @@ -18,13 +18,13 @@ extern "C" {
>   * Tracepoint group naming format for DTrace providers.  Providers may append
>   * to this format string as needed.
>   *
> - * GROUP_DATA provides the necessary data items to populate the format string
> - * (PID of the dtrace process and the provider name).  GROUP_SFMT is like
> - * GROUP_FMT, but for sscanf().
> + * PROBE_DATA provides the necessary data items to populate the format string.
> + * PROBE_FMT formats that data.
> + * PROBE_SFMT is a format string for recognizing PROBE_FMT data in sscanf().
>   */
> -#define GROUP_FMT	"dt_%d_%s"
> -#define GROUP_SFMT	"dt_%d_%ms"
> -#define GROUP_DATA	getpid(), prvname
> +#define PROBE_DATA	getpid(), prp->desc->prv, prp->desc->prb
> +#define PROBE_FMT	"dt_%d_%s/%s"
> +#define PROBE_SFMT	"dt_%d_%ms"
>  
>  typedef struct tp_probe tp_probe_t;
>  
> diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.d b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
> new file mode 100644
> index 000000000..f73b33f24
> --- /dev/null
> +++ b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
> @@ -0,0 +1,31 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: rawfbt probes can be found even when a wildcard provider
> + * description also allows fbt probes.
> + */
> +
> +/*
> + * We expect to find 5 probes:
> + *   BEGIN
> + *   fbt vmlinux do_sys_openat2 entry
> + *   fbt vmlinux do_sys_open entry
> + *   rawfbt vmlinux do_sys_openat2 entry
> + *   rawfbt vmlinux do_sys_open entry
> + *
> + * We want to validate:
> + * - the FBT and rawfbt probes are all found
> + * - the script executes (dtrace could attach to the probes)
> + */
> +
> +BEGIN,
> +*fbt:vmlinux:do_sys_open*:entry
> +{
> +	printf("success\n");
> +	exit(0);
> +}
> diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.r b/test/unittest/providers/rawfbt/tst.wildcard-provider.r
> new file mode 100644
> index 000000000..f7b429211
> --- /dev/null
> +++ b/test/unittest/providers/rawfbt/tst.wildcard-provider.r
> @@ -0,0 +1,6 @@
> +                   FUNCTION:NAME
> +                          :BEGIN success
> +
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/providers/rawfbt/tst.wildcard-provider.d' matched 5 probes
> -- 
> 2.47.3
> 

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A6B1D9340
	for <dtrace@lists.linux.dev>; Mon,  7 Oct 2024 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728316376; cv=fail; b=pSYI51AIM8P/t8EZqLAExk5pGeIFfhHg7wvrLGtJCC9CYCa91LEJ+fHHGVHvcjKzKIPUk6XyWwFDk1H2ck0E3TAFEZrH2pIodDbjZz1bkGDbXC9Jtv0JDp/lOVckgIhaNej30N8QcVRDGNZsFRDPY8rgJxnavAxe/bgIY0sMK9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728316376; c=relaxed/simple;
	bh=04VFoEd3ROIJKwlg1sAJcntlQRESvpg3rcuD43Mx190=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rdy9gthhrDXs56OU849GIs+kDMso4JmvKB3Jzkehtq9zH3LC16Q14+NE02AsWcIYQQlHhS0h7U0IJl1dHzAOjbK4iPnTOUi87I6ruCIVY3u98k9b6DUxtlRSucnbdI2aWU0PU8G/so55X9EZ6bpIlNNMFQ3QM6B4f3BqIN9m8iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cJpO2B1E; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j8lDneer reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cJpO2B1E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j8lDneer"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497FMeAb030896
	for <dtrace@lists.linux.dev>; Mon, 7 Oct 2024 15:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=NA6tYOpj61teXhtr47/znvDs0/Hs1OFJGGXtq1hJ6+8=; b=
	cJpO2B1EtW5skt2+Kr97bee7DRf5n7Jcx+TXES/8i+qK7Gxr94B0Q3MqU7wBxOiV
	v53USgAz8Ygew4/3o6TuyvLfdzM+01LiZowHREcQG6Ojdal6GIjIDJXoS38dzP6t
	z4VDds7hl17VFBrx2tMUTErUGvaOFCiUafOAqfihhmwCbOExytSoI2QLEmsgamYW
	AkRCucP6UrVL4ZIbIjCHC3DoJm7RpPpb8B0zG7yaGh40M9N6KP4aaJxf0yfcx6jH
	NF67uOZXTDJhX7l42wprRZOUGytrzQroXqJA5dJKwJuFC1XfxXJCTDe0SafEYChq
	kbWty0pnXdF3y+KEtjGPsA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 423063kqfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Oct 2024 15:52:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 497FiP5B011494
	for <dtrace@lists.linux.dev>; Mon, 7 Oct 2024 15:52:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uw5y936-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Oct 2024 15:52:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aihoJRmrxaPUXhWHe8yxUD2oQnZ6hQNiDA9eTbOa/p6bEES6BAlLjxCtIP6B6Ja09bVYjhZ5OimNQVl8L2wv565l8R2s0E25r17XVoUmJtgKwTNiUe0TeJBm+FW1U5+S8jj9eFAEbRJw83bB74oVnncTd/L6LrI8IMQ6fewEXIKT7wt6EX72Kp1dd57Pp8Fsdcj690bEVO1+7NzKZgjhnmeHf5uuKuFJqdLaERfcIu6jJMWboD0ZK2TFKwclofFrAlda7L6X3qX7lNoGh9MaQ0KVgR7RA6WHq2MiGcXXGuELGYdA490uI8blYLwX0cSsWY7nn6+WKrZmwjzAC2UW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lm19VBuv6UXqJj+4YUa9MuWiVY6r8rzMwuDTobgcfEM=;
 b=AbcV0QGT7Hb1oCU30w+3n9eJG8oMELCi6cqYzQgoN3no8SwYvU1UHjptIjKoDyUuigjGIEgwOtdc3X3fe408owOBAZ08n7qldJBEoD1xY5LDcbrbzxe62rTSa/VUmm/AUTa2gxW1OW6HkI2UdFhSHVN7SbcvuXmHw5ZDp1fBnQyFaKy4j4fWuqkzGcLDI/aKzCtecg6j1twfhcClgSfIHqm7vnX6cDr7CuGJVP51dWCj8K3t0ojz3ANCQYD7YTu2Vlc5rTZ/UmSiptBizgRLbSlWdDZ1GkQ8rmdjH9g108F0WXUVCggorkq8YxpBbHuKDsBBcemKBsTUtUMuipK/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lm19VBuv6UXqJj+4YUa9MuWiVY6r8rzMwuDTobgcfEM=;
 b=j8lDneertN1YhfM6wdTNHzz6u0BdAanSMDt+jFf+Af5d9qnyJti1IJlOzXzcj18y0PnxTCJkEDQTpvllz9QxRLMt7XvfPe1O1Dy+Ja5SwtaFzMzreBNOQfEWOZv0adTvcl6fBAZFD7xtgia8L3RyRFyzkr+8VGKeVw2DczIF5Lk=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH7PR10MB5747.namprd10.prod.outlook.com (2603:10b6:510:127::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 15:52:46 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 15:52:46 +0000
Date: Mon, 7 Oct 2024 11:52:43 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 07/19] Create the BPF usdt_prids map
Message-ID: <ZwQDy3K+BJw6NYRk@oracle.com>
References: <20240928021525.8987-1-eugene.loh@oracle.com>
 <20240928021525.8987-2-eugene.loh@oracle.com>
 <Zv4lwups32GXQsr2@oracle.com>
 <5cae817c-e793-c56a-209b-1b40d320c39e@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cae817c-e793-c56a-209b-1b40d320c39e@oracle.com>
X-ClientProxiedBy: MN2PR11CA0009.namprd11.prod.outlook.com
 (2603:10b6:208:23b::14) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH7PR10MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: 276884d2-da2e-4b1d-f385-08dce6e81670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?yIFJQNKFqFRemwJ5n91OsE2tbcP26Lg7PjBGDwozcwzKGeW9Gi8rlCLiKl?=
 =?iso-8859-1?Q?x83QWyMVThFqE4MtABTK1RMiMKMX0HwABxJx0ieZv4U8vM2l5gSy9LOquW?=
 =?iso-8859-1?Q?dYgu8zmS2nF6cfEgcjTBN2/fgeJGa4K6iT16oidz6zAyd35uHE7089sC1/?=
 =?iso-8859-1?Q?utxFh5AdUBV2+d8OBSckYlAYczmTCtsP0ostY0JhqKXJgaAuw9uNfa+ikX?=
 =?iso-8859-1?Q?CYvWLYhov4rdnuI+TvcsiBWNyXp5aLi5S8IKKRED60TTfRff0vaUerpT/B?=
 =?iso-8859-1?Q?n/A1vrqph1jY0gfAXnArrijvKaAtNKGFC4SbFCTHFa6wwXjIxKbFWSBUz3?=
 =?iso-8859-1?Q?T+s29p3Z5CcGGXBKAbWVGuN3y8z8s6Ot404YKItJcvB4e+bpimJzlzL7pk?=
 =?iso-8859-1?Q?lAFkQyumAttMqpyBLPPK8C9Bpu2AH/zTt8k/XiQGXq1oWEqSutkep1Do3d?=
 =?iso-8859-1?Q?9qWbBzCuwiIf+RmCu2aEyPEK7LOrfFvuYEi8tX+/Frzb0hm7KTEfdxU22s?=
 =?iso-8859-1?Q?MTSFmTdpjtiegUptKJFqSF34nZwoTJOK3VruRnRVAfSMbtfAi5IOHfvo29?=
 =?iso-8859-1?Q?E0QMjli6ry+H/Tt9ks8erPTzma5BNja724E3Xcg8v7ObXt5HX+gjujgELG?=
 =?iso-8859-1?Q?+IXpJUpWIFEEjhO1+LEqoRuqDz2Qe1bUF4Zug1jrm7NWXeSaeX/8MzYiZQ?=
 =?iso-8859-1?Q?J9SMQur2RINzTmT1RDgvUuzC/dhGbxErpcWvCqwiKXPRnFNjZ9LWJABS7c?=
 =?iso-8859-1?Q?TUcfJZb3GuoogQimDZ7SMqtUBzIj38mIUfvUk+LdbWcvlXu1ka5CGGz3xP?=
 =?iso-8859-1?Q?S3YrEpGwQLH2CnbPkTRzeCpr1EwJrt/ZjFOLPF6kqu4p0x3yL/54BiAkIn?=
 =?iso-8859-1?Q?dXm/cuHTf72c/pwiXPaVGi/F3FUAfs4PX6VzsDjWnYRl2iw2ufi2uU/0sA?=
 =?iso-8859-1?Q?iDHbqhxrdBmSMfcfwvS82zK3/nFy89wdYMYqmEE8woq4cW0PXc6lMRPWUM?=
 =?iso-8859-1?Q?2r9EZXh8SmTopQ1o4nGA/iv4PcoafQAd92eY2eBoFNVFs/dzv86nDSm7Wl?=
 =?iso-8859-1?Q?6Ng9KNDPWcKHHsghmFuxTrCQAZCvxD7VwQhL3NDVDo7ovdDmd7zfoeF7wn?=
 =?iso-8859-1?Q?B/bSn3IMx3GbTBxqfNteHZxZNNBOpFqGOC1T2gdjfJyaAuuSqFNvAtWC/T?=
 =?iso-8859-1?Q?IbutkcV4TRnli2dT0URRz/KHX3/WyLqRUAACorv6a6EKR5YSaNdu5OZrIV?=
 =?iso-8859-1?Q?+aJeiOKfMDijmJW2bOOzC/qydIf0mNk6EYSz2YKsKWiFWLN8iiqWK5WkuI?=
 =?iso-8859-1?Q?9+U7L/X8tcYNZl8VcIuMrhadug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?PKrJtGhCB91l9TUjTul0LjbTzghNacycawjKFQBZlctSOIMlC6UZm3OPvS?=
 =?iso-8859-1?Q?CWuNtdw7koWpdNFcbzPZ4PjLbm7Hzvo63OWIjJkp8pzgcGRlOe1Lty9yDu?=
 =?iso-8859-1?Q?7ZoHHTz3sE1ZDkLajUIODbRlXTuXDLNg9SN8styB/9Uxtrq7JQrqn06rMX?=
 =?iso-8859-1?Q?lCWuGTopxV7RNBV6q0qEQhpEzG7VwJ/5W+n+z8MAcgPFYbyk1LqT4zcIDJ?=
 =?iso-8859-1?Q?FpAVcJxubIFLP/5aO3ttHSCKwpb3sQU1sI+RpaJEbsrUxTIqXGzGCOtXxV?=
 =?iso-8859-1?Q?JlLlQ6X6P6yxQd72EcS/dpTWeNliDoAREPxbFm8Y6ywCRtFVDEStoIixHA?=
 =?iso-8859-1?Q?2mXHs/Ih5BvE/m9fD/tzHiDS8l8iyxEjlwrH4HcZK1Zw/3pbvPyBT/TH34?=
 =?iso-8859-1?Q?Bng0nVBUKkFSQTtvzkV5OM4mo56fPfLlHsZb9LZANVxv0Ko/Ytsb6l7NIX?=
 =?iso-8859-1?Q?Ez4NA+OkA/iFLu08o7DPQeU04awATbcfMZjV6L5w1yyVCu/mnX08+7b039?=
 =?iso-8859-1?Q?+2RcjhRplM4wVCaWZjoOfMdWNWNvC6VE9mlkYGeQY/OTwckNxOWYXYYG2p?=
 =?iso-8859-1?Q?0oYyMHqMy54T2ZaqeO9watI67Ulps2xVuB2x2pstGmQqBlUi2yo5WWNZoG?=
 =?iso-8859-1?Q?di/1Jl/JqQ8g14rFbzXzTogRvaDx0ahHODOdwth7MyJS+qDZmDlHbZHKSu?=
 =?iso-8859-1?Q?R37bPWoiE/h/2Qa/fl9kYqWPH2rSUmaqaEOF3idw6dd0x+jkrgFNp5uf9K?=
 =?iso-8859-1?Q?7xn9GmoTa8LoTlV2iYIfDa07v5gppvMp65tRY4gPq/nLOr1UOodddIvKDO?=
 =?iso-8859-1?Q?50RBNiqXd/S9Qasb78g16oiIgTVjSABmEs+aQ8s2aypJF9HQU9CXNrdhmY?=
 =?iso-8859-1?Q?JfhZXDb/oSktkblsZ+ZdzmnXvX9igQV2xBRr0Uc1UZ8sN4SLarZR5f3dPx?=
 =?iso-8859-1?Q?LNd8znF6NgsPjgJfRpWbYVott+RfFf4sBxNmH05IrPalN8v7uvPKKVZFi+?=
 =?iso-8859-1?Q?qpKpgTgd4UZ4pNeANzhVwhWp6D67VXp6wdCMwmrdx9LKQTJMLDONUsNCSW?=
 =?iso-8859-1?Q?9SSYDhaGYnQwlSPrevrdwYA5LIBYVokNXW/T+K8yO1Mjs785U5B52OFaPk?=
 =?iso-8859-1?Q?msJk4EReQNE3jU/W+vftMvlnP8MiqtHSFGXtNyuA7GacFV0z6mU6hR2YzF?=
 =?iso-8859-1?Q?fFI8x1kM+IMCdHgbcABuRbHEHokDcOnB0FhtxvyJ5cYWf/AEXfZ/fhxlfU?=
 =?iso-8859-1?Q?Ablf5nekgDxiBuDQZE0xvFTRgsiKOx4w7iQlxlwPMdO3tAGOb8zr5cgaRG?=
 =?iso-8859-1?Q?Q6OpSkdPGdd+yuTfv9vHB1mdnAlfM0chfUPeki3WFcwvbIuWzc8o6Ji3OC?=
 =?iso-8859-1?Q?NY4UAeYd1RnfTymRdENCuvLQD3yEMOgvV7Hq0OTHQ8nxNospAqD6OV3Doh?=
 =?iso-8859-1?Q?fF3WVS7ljtdiSVlnOBfoIK3lziHQ4bqSVGs+T+AxbKbsaayv05aUChPnGq?=
 =?iso-8859-1?Q?QgaZDee3oxALl1nv+1MlByeAHXPTFGns9teZR3v3C8zJUUen/3hYyRPr4F?=
 =?iso-8859-1?Q?avvbnQBX7nZDxXACcjUmBt09Ih54ss2CzESdoLZYHmfwIWCpc9ve1sqye6?=
 =?iso-8859-1?Q?+82RQuKQIiAXN9bnXXihR9j6hFa+QiXKLDMP2qtI/nmWkvt1yd9Gb84Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IeuEx0xPTx1kNr8cCvhhybGvxx95sfeax6QnQbrPH/m3VdTdhhFF5Q9+ycH4peKWecmXFEuFO9eRCGj4gmjwarQy91SyiBcGZjUnR+PPd1/uBfH7YY9eltP5BVwF/6G+7+Z8HohtoECBVbNn1u0BQJDxZVzxjH6Z0tTntVPOSwdN/Twc61fT0P9sUofA+1Y1pzkXxER11w1HYTbtjOWWXDQRdjOaOhMSrHSiPZOAzSX1qq/sSDXk5snUdTYfzZ8DMl11CSVyj+EyXf+7FH2lc8YE89e67IrG3D0kzoN509R+9IxKyY3mWVdvLOSVkrhZhmLR8TuQIBfFoUtMbDxZshT+x0ZM7WvPJnmP5PlIExj0Y1WRereUNEtuF7y1e/QxUVcXEjTSXSECkCc01HvTpXh5hFlsfFhflFgom2/E/JqyqI4q1aNm9l8xkmQW335j0fgqL7lhtcRrCht5MOsImvHxwuHoyhxZb0br4mL8BKDMwRM0sXE5NPZUBvfKToCPJ/otITh8IVSULWKTjgmJq4W+6FN5G/uoHr1pwYaHnoQIzgANs5nfoDasYY5FZONXqZ5OdG8cIcN7S6qcfoNMDLWPN41sb9yKIjKxhgd5HoU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276884d2-da2e-4b1d-f385-08dce6e81670
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 15:52:46.5037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSiwPfDP6huVZ4flRjNvjZ2jmnJRpadZaDbU0WDUyLagNnR70BzoRn0TrMtohd0R/jXI4QpNdNuVczvH0pMKHOnAjSWhXjb9bEuGnb+rInQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5747
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-07_08,2024-10-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410070112
X-Proofpoint-ORIG-GUID: ij9Z8QE5Eg9CGTc5X7lRt2QZ3V59yi7m
X-Proofpoint-GUID: ij9Z8QE5Eg9CGTc5X7lRt2QZ3V59yi7m

On Sat, Oct 05, 2024 at 09:11:51PM -0400, Eugene Loh via DTrace-devel wrote:
> On 10/3/24 01:04, Kris Van Hees wrote:
> 
> > The main problem with the current implementation is the fact that the strtab
> > BPF map is being updated while it is being used.  That is not a safe operation,
> > and can have unpredictable behaviour depending on the actual implementation at
> > the kernel level.  We cannot cuont on it being safe.
> > 
> > I propose introducing a usdtsize option (or whatever we name it) that sets the
> > number of USDT probes that we can support.  It should be used for the size of
> > the usdt_prids map.
> > 
> > In order to be able to provide the data for probeprov, probemod, probefunc, and
> > probename, we need to have a way to store probe name elements dynamically.  That
> > can be done using a usdt_probes hashmap that stores a string (128 bytes max) and
> > is indexed by an int.  The bvara code will need to know to consult this new
> > BPF map to get the data.  I can see two options:
> > 
> > 1) increase the probes BPF map by usdtsize extra elements, and set the highest
> >     order bit to indicate that the value for a probe name element should be
> >     retrieved from the usdt_probes hashmap.
> > 
> > 2) add probe name element key values to the usdt_prids map
> 
> We usually want to access this by prid, and usdt_prids has prid in its value
> rather than in its key.

Ah yes.

> > Approach 1 uses the existing the mechanism for storing this data, but adds some
> > (very minor) performance hit to all probeprov, probemod, probefunc, probename
> > bvar lookups because we need to check for the highest order bit.
> > 
> > Approach 2 means we have an alternative place where we store the probe name
> > element data, but it remains localized with the other USDT probe data *and*
> > the performance impact is limited to USDT probes only (if the prid is not
> > found in the probes map, we need to look in the usdt_prids map).
> 
> How about this.  There are some probes that are already known when we create
> the BPF maps.  We simply remember how many probe IDs exist at this time. 
> Thereafter, if we have a probe whose ID is greater, its name elements go
> into a new hash map.  In get_bvar(), the first thing we do is look whether
> the probe ID we're looking up is old (less than the number of initial
> probes) or new.  That tells us whether to look in the standard, static hash
> map or in the new, dynamic hash map.  Sound good?  I have this version
> working.  If you agree with the approach, I'll clean up the patch and post
> it for review.
> 
> Put another way, when we create the BPF maps, we memorize the current value
> of dtp->dt_probe_id.  I call this dtp->dt_ninitprobes, the number of initial
> probes.  Thereafter, we use the traditional BPF map when prid <=
> dtp->dt_ninitprobes and the new dynamic hash map otherwise.

Yes, I think that works fine.  You probably could even just name it
dtp->dt_nprobes (meaning the number of probes that is created statically),
and introduce a NPROBES symbol that the relocator will fill in with the
dtp->dt_nprobes value.  I assume you assign the dtp->dt_nprobes value when
we start probing (e.g. when the probes BPF map is created)?

> > On Fri, Sep 27, 2024 at 10:15:25PM -0400, eugene.loh--- via DTrace-devel wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > As USDT processes come and go, the overlying probes for an underlying
> > > probe will change.  Hence, we will move to a scheme in which an
> > > underlying probe will walk all possible clauses it could call,
> > > deciding at run time (using a bit mask for the overlying USDT probe)
> > > which of the clauses to call.
> > > 
> > > In this patch, we create and update the BPF "usdt_prids" map.  This
> > > is a hash map, where:
> > > 
> > >    *)  the key (size: dtp->dt_usdt_pridsmap_ksz) comprises
> > >          - the PID of the firing process
> > >          - the PRID of the underlying probe
> > > 
> > >    *)  the value (size: dtp->dt_usdt_pridsmap_vsz) comprises
> > >          - the PRID over the overlying USDT probe
> > >          - a bit mask indicating which clauses should be called
> > > 
> > > As processes start up, we also add new overlying USDT probes,
> > > requiring updates of the BPF "probes" and "strtab" maps and of
> > > the list of enablings.
> > > 
> > > The underlying-probes "update" function is called sporadically.
> > > The focus of this patch is the function.  When it is called can
> > > be tuned in future patches.
> > > 
> > > This patch guesses certain sizes very crudely.  These sizes should
> > > be handled more robustly in future patches:
> > > 
> > >    *)  The allocated size of the string table.  For example,
> > >        new provider names have to be added as new processes
> > >        start.
> > > 
> > >    *)  The number of entries in the BPF "usdt_prids" map.
> > >        There is a little relief here in that, as processes
> > >        terminate, they can be removed from the map.
> > > 
> > >    *)  The size of the bit mask -- that is, the greatest
> > >        number of clauses an underlying probe might call.
> > >        This is relatively easy to extend;  nevertheless,
> > >        that work is left for a future patch.
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   libdtrace/dt_bpf.c         |  43 +++++-
> > >   libdtrace/dt_cc.c          |   2 +-
> > >   libdtrace/dt_dlibs.c       |   1 +
> > >   libdtrace/dt_impl.h        |   6 +
> > >   libdtrace/dt_prov_uprobe.c | 278 +++++++++++++++++++++++++++++++++++++
> > >   libdtrace/dt_work.c        |   3 +
> > >   6 files changed, 331 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > > index ad11d178e..4acf6e494 100644
> > > --- a/libdtrace/dt_bpf.c
> > > +++ b/libdtrace/dt_bpf.c
> > > @@ -841,7 +841,8 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
> > >   	int		fd, rc, err;
> > >   	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
> > > -	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strlen, 8);
> > > +	dtp->dt_strmax = dtp->dt_strlen + 1000;            // FIXME pad some arbitrary amount to account for new USDT probes as new processes start
> > > +	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strmax, 8);
> > >   	dtp->dt_rosize = dt_rodata_size(dtp->dt_rodata);
> > >   	dtp->dt_zerooffset = P2ROUNDUP(dtp->dt_rooffset + dtp->dt_rosize, 8);
> > >   	dtp->dt_zerosize = 0;
> > > @@ -899,6 +900,7 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
> > >   	if (rc == -1)
> > >   		return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n",
> > >   				    strerror(err));
> > > +	dtp->dt_strtabmap_fd = fd;
> > >   	return 0;
> > >   }
> > > @@ -936,6 +938,44 @@ gmap_create_probes(dtrace_hdl_t *dtp)
> > >   				dtp, "cannot update BPF map 'probes': %s\n",
> > >   				strerror(errno));
> > >   	}
> > > +	dtp->dt_probesmap_fd = fd;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * Create the 'usdt_prids' BPF map.
> > > + *
> > > + * USDT-PRID information map.  This is a global hash map for use
> > > + * with USDT probes.  It is indexed by (pid, underlying probe ID).
> > > + * The value is a probe ID for the overlying USDT probe and a bit
> > > + * mask indicating which clauses to execute for this pid.
> > > + *
> > > + * WIP.  Just make up some sizes for now.
> > > + *
> > > + *     How big is a probe ID?  Sometimes, it's a dtrace_id_t.
> > > + *     And uts/common/sys/dtrace_types.h gives us "typedef uint32_t dtrace_id_t".
> > > + *     Meanwhile, libdtrace/dt_impl.h has "uint32_t dt_probe_id".
> > > + *     So either uint32_t or dtrace_id_t is fine.
> > > + *
> > > + *     How big should our bit mask be?  Start with 8*sizeof(long long) bits.
> > > + *
> > > + *     How many entries should we allow?  Start with 1000.
> > > + *
> > > + * Note that for a given (pid, PRID) key, there can be at most one
> > > + * overlying USDT probe.
> > > + */
> > > +static int
> > > +gmap_create_usdt_prids(dtrace_hdl_t *dtp)
> > > +{
> > > +	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
> > > +			 dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz, 1000);
> > > +	if (dtp->dt_usdt_pridsmap_fd == -1)
> > > +		return -1;
> > > +
> > > +	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
> > > +	if (dt_uprobe.update(dtp, NULL) < 0)
> > > +		return -1;
> > >   	return 0;
> > >   }
> > > @@ -1045,6 +1085,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
> > >   	CREATE_MAP(scratchmem)
> > >   	CREATE_MAP(strtab)
> > >   	CREATE_MAP(probes)
> > > +	CREATE_MAP(usdt_prids)
> > >   	CREATE_MAP(gvars)
> > >   	CREATE_MAP(lvars)
> > >   	CREATE_MAP(dvars)
> > > diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> > > index 4202771a9..12104fc21 100644
> > > --- a/libdtrace/dt_cc.c
> > > +++ b/libdtrace/dt_cc.c
> > > @@ -1045,7 +1045,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
> > >   				nrp->dofr_data = 0;	/* FIXME */
> > >   				continue;
> > >   			case DT_CONST_STBSZ:
> > > -				nrp->dofr_data = dtp->dt_strlen;
> > > +				nrp->dofr_data = dtp->dt_strmax;
> > >   				continue;
> > >   			case DT_CONST_STRSZ:
> > >   				nrp->dofr_data =
> > > diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> > > index ba4d4abef..924cf11e4 100644
> > > --- a/libdtrace/dt_dlibs.c
> > > +++ b/libdtrace/dt_dlibs.c
> > > @@ -66,6 +66,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
> > >   	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
> > >   	DT_BPF_SYMBOL(mem, DT_IDENT_PTR),
> > >   	DT_BPF_SYMBOL(probes, DT_IDENT_PTR),
> > > +	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
> > >   	DT_BPF_SYMBOL(scratchmem, DT_IDENT_PTR),
> > >   	DT_BPF_SYMBOL(specs, DT_IDENT_PTR),
> > >   	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
> > > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > > index 340dc1960..1d1248766 100644
> > > --- a/libdtrace/dt_impl.h
> > > +++ b/libdtrace/dt_impl.h
> > > @@ -282,6 +282,7 @@ struct dtrace_hdl {
> > >   	dt_strtab_t *dt_ccstab;	/* global string table (during compilation) */
> > >   	dt_rodata_t *dt_rodata;	/* global read-only data */
> > >   	uint_t dt_strlen;	/* global string table (runtime) size */
> > > +	uint_t dt_strmax;	/* global string table (runtime) size, allocated */
> > >   	uint_t dt_rooffset;	/* read-only data offset */
> > >   	uint_t dt_rosize;	/* read-only data size */
> > >   	uint_t dt_zerooffset;	/* zero region, offset */
> > > @@ -389,6 +390,11 @@ struct dtrace_hdl {
> > >   	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
> > >   	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
> > >   	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
> > > +	int dt_strtabmap_fd;	/* file descriptor for the 'strtab' BPF map */
> > > +	int dt_probesmap_fd;	/* file descriptor for the 'probes' BPF map */
> > > +	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
> > > +	int dt_usdt_pridsmap_ksz; /* 'usdt_prids' BPF map key size */
> > > +	int dt_usdt_pridsmap_vsz; /* 'usdt_prids' BPF map value size */
> > >   	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
> > >   	void *dt_errarg;	/* error handler argument */
> > >   	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
> > > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > > index bb172ace2..d99915fa2 100644
> > > --- a/libdtrace/dt_prov_uprobe.c
> > > +++ b/libdtrace/dt_prov_uprobe.c
> > > @@ -37,8 +37,10 @@
> > >   #include "dt_list.h"
> > >   #include "dt_provider_tp.h"
> > >   #include "dt_probe.h"
> > > +#include "dt_program.h"
> > >   #include "dt_pid.h"
> > >   #include "dt_string.h"
> > > +#include "port.h"
> > >   /* Provider name for the underlying probes. */
> > >   static const char	prvname[] = "uprobe";
> > > @@ -63,6 +65,15 @@ typedef struct list_probe {
> > >   	dt_probe_t	*probe;
> > >   } list_probe_t;
> > > +typedef struct usdt_prids_map_key {
> > > +	pid_t		pid;
> > > +	dtrace_id_t	uprid;
> > > +} usdt_prids_map_key_t;
> > > +typedef struct usdt_prids_map_val {
> > > +	dtrace_id_t	prid;
> > > +	long long	mask;
> > > +} usdt_prids_map_val_t;
> > > +
> > >   static const dtrace_pattr_t	pattr = {
> > >   { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
> > >   { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> > > @@ -77,6 +88,9 @@ dt_provimpl_t	dt_usdt;
> > >   static int populate(dtrace_hdl_t *dtp)
> > >   {
> > > +	dtp->dt_usdt_pridsmap_ksz = sizeof(usdt_prids_map_key_t);
> > > +	dtp->dt_usdt_pridsmap_vsz = sizeof(usdt_prids_map_val_t);
> > > +
> > >   	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
> > >   			       NULL) == NULL ||
> > >   	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
> > > @@ -123,6 +137,269 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
> > >   	free_probe_list(dtp, datap);
> > >   }
> > > +/*
> > > + * Clean up the BPF "usdt_prids" map.
> > > + */
> > > +static int
> > > +purge_BPFmap(dtrace_hdl_t *dtp)
> > > +{
> > > +	int			fd = dtp->dt_usdt_pridsmap_fd;
> > > +	usdt_prids_map_key_t	key, nxt;
> > > +	usdt_prids_map_val_t	val;
> > > +
> > > +	/* Initialize key to a pid/uprid that cannot be found. */
> > > +	key.pid = 0;
> > > +	key.uprid = 0;
> > > +
> > > +	/* Loop over all entries. */
> > > +	while (dt_bpf_map_next_key(fd, &key, &nxt) == 0) {
> > > +		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
> > > +
> > > +		if (dt_bpf_map_lookup(fd, &key, &val) == -1)
> > > +			return dt_set_errno(dtp, EDT_BPF);
> > > +
> > > +		/* Check if the process is still running. */
> > > +		if (!Pexists(key.pid)) {
> > > +			dt_bpf_map_delete(fd, &key);          // FIXME:  bpf_map_next_key() iteration restarts each time we delete an elem!!!
> > > +			continue;
> > > +		}
> > > +
> > > +		/*
> > > +		 * FIXME.  There might be another case, where the process
> > > +		 * is still running, but some of its USDT probes are gone?
> > > +		 * So maybe we have to check for the existence of one of
> > > +		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
> > > +		 *     char *prv = ...pdp->prv minus the numerial part;
> > > +		 *
> > > +		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
> > > +		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
> > > +		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
> > > +		 */
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * Grow the string table map.  It includes the string table (which might
> > > + * grow due to new USDT probes).  It also includes the read-only data and
> > > + * the block of zeros, but these remain fixed.
> > > + *
> > > + * FIXME Is there a danger of the BPF map update colliding with map reads?
> > > + */
> > > +static int
> > > +grow_strtab(dtrace_hdl_t *dtp)
> > > +{
> > > +	size_t		sz = dtp->dt_zerooffset + dtp->dt_zerosize;
> > > +	char		*strtab;
> > > +	uint8_t		*buf, *end;
> > > +	size_t		strsize = dtp->dt_options[DTRACEOPT_STRSIZE];
> > > +	uint32_t	key = 0;
> > > +	int		rc, err;
> > > +
> > > +	strtab = dt_zalloc(dtp, sz);
> > > +#if 0
> > > +	// FIXME do something
> > > +	if (strtab == NULL)
> > > +		return dt_set_errno(dtp, EDT_NOMEM);
> > > +#endif
> > > +
> > > +	/* Copy the string table data. */
> > > +	dt_strtab_write(dtp->dt_ccstab, (dt_strtab_write_f *)dt_strtab_copystr, strtab);
> > > +
> > > +	/* Loop over the string table and truncate strings that are too long. */
> > > +	buf = (uint8_t *)strtab;
> > > +	end = buf + dtp->dt_strlen;
> > > +	while (buf < end) {
> > > +		uint_t	len = strlen((char *)buf);
> > > +
> > > +		if (len > strsize)
> > > +			buf[strsize] = '\0';
> > > +
> > > +		buf += len + 1;
> > > +	}
> > > +
> > > +	/* Copy the read-only data. */
> > > +	dt_rodata_write(dtp->dt_rodata, (dt_rodata_copy_f *)dt_rodata_copy, strtab + dtp->dt_rooffset);
> > > +
> > > +	rc = dt_bpf_map_update(dtp->dt_strtabmap_fd, &key, strtab);
> > > +	err = errno;
> > > +	dt_free(dtp, strtab);
> > > +
> > > +	// FIXME do something
> > > +	if (rc == -1) {
> > > +		strerror(err);
> > > +		return -1;
> > > +		// return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n", strerror(err));
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * Update the uprobe provider.
> > > + */
> > > +static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
> > > +{
> > > +	dt_probe_t	*prp;
> > > +	dt_probe_t	*prp_next;
> > > +	int		i, prid = dtp->dt_probe_id;
> > > +	uint_t		old_strlen = dtp->dt_strlen;
> > > +	dt_pcb_t	pcb;
> > > +
> > > +	/* Clear stale pids. */
> > > +	purge_BPFmap(dtp);
> > > +
> > > +	/* Update dt_probes[] and dt_enablings. */
> > > +	/*
> > > +	 * pcb is only used inside of dt_pid_error() to get:
> > > +	 *     pcb->pcb_region
> > > +	 *     pcb->pcb_filetag
> > > +	 *     pcb->pcb_fileptr
> > > +	 * While pcb cannot be NULL, these other things apparently can be.
> > > +	 */
> > > +	memset(&pcb, 0, sizeof(dt_pcb_t));
> > > +	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
> > > +		dtrace_stmtdesc_t *stp;
> > > +
> > > +		stp = dtp->dt_stmts[i];
> > > +		assert(stp != NULL);
> > > +		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
> > > +	}
> > > +
> > > +	while (prid < dtp->dt_probe_id) {
> > > +		dt_bpf_probe_t pinfo;
> > > +		const dtrace_probedesc_t *pdp = dtp->dt_probes[prid]->desc;
> > > +		int fd = dtp->dt_probesmap_fd;
> > > +
> > > +		dt_probe_enable(dtp, dtp->dt_probes[prid]);
> > > +
> > > +		pinfo.prv = dt_strtab_index(dtp->dt_ccstab, pdp->prv);
> > > +		pinfo.mod = dt_strtab_index(dtp->dt_ccstab, pdp->mod);
> > > +		pinfo.fun = dt_strtab_index(dtp->dt_ccstab, pdp->fun);
> > > +		pinfo.prb = dt_strtab_index(dtp->dt_ccstab, pdp->prb);
> > > +
> > > +		if (dt_bpf_map_update(fd, &pdp->id, &pinfo) == -1)
> > > +			assert(0);   // FIXME do something here
> > > +
> > > +		prid++;
> > > +	}
> > > +
> > > +	/* Grow the strtab if it has gotten bigger. */
> > > +	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
> > > +
> > > +	if (dtp->dt_strlen > dtp->dt_strmax)
> > > +		assert(0);               // FIXME handle this more gracefully
> > > +	if (dtp->dt_strlen > old_strlen)
> > > +		grow_strtab(dtp);
> > > +
> > > +	/* Review enablings. */
> > > +	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
> > > +		pid_t		pid;
> > > +		list_probe_t	*pup;
> > > +
> > > +		prp_next = dt_list_next(prp);
> > > +
> > > +		/* Make sure it is an overlying USDT probe. */
> > > +		if (prp->prov->impl != &dt_usdt)
> > > +			continue;
> > > +
> > > +		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
> > > +		/*
> > > +		 * Nick writes:
> > > +		 * This is a general problem with running compiler-adjacent things outside
> > > +		 * compile time. I think we should adjust dt_pid_error() so that it works
> > > +		 * with NULL pcb and dpr at once, probably by using the code path for
> > > +		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
> > > +		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
> > > +		 * already handle this case.)
> > > +		 */
> > > +		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
> > > +
> > > +		if (!Pexists(pid)) {
> > > +			/* Remove from enablings. */
> > > +			dt_list_delete(&dtp->dt_enablings, prp);
> > > +
> > > +			/* Make it evident from the probe that it is not in enablings. */
> > > +			((dt_list_t *)prp)->dl_prev = NULL;
> > > +			((dt_list_t *)prp)->dl_next = NULL;
> > > +
> > > +			/* Free up its list of underlying probes. */
> > > +			while ((pup = dt_list_next(prp->prv_data)) != NULL) {
> > > +				dt_list_delete(prp->prv_data, pup);
> > > +				dt_free(dtp, pup);
> > > +			}
> > > +			dt_free(dtp, prp->prv_data);
> > > +			prp->prv_data = NULL;
> > > +
> > > +			/* Free up BPF "probes" map entry. */
> > > +			dt_bpf_map_delete(dtp->dt_probesmap_fd, &prp->desc->id);
> > > +
> > > +			continue;
> > > +		}
> > > +
> > > +		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
> > > +			dt_probe_t		*uprp = pup->probe;
> > > +			long long		mask = 0, bit = 1;
> > > +			usdt_prids_map_key_t	key;
> > > +			usdt_prids_map_val_t	val, oval;
> > > +			dt_uprobe_t		*upp = uprp->prv_data;
> > > +
> > > +			/*
> > > +			 * For is-enabled probes, the bit mask does not matter.
> > > +			 * It is possible that we have this underlying probe due to
> > > +			 * an overlying pid-offset probe and that we will not know
> > > +			 * until later, when some new pid is created, that we also
> > > +			 * have an overlying USDT is-enabled probe, but missing this
> > > +			 * optimization opportunity is okay.
> > > +			 */
> > > +			if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
> > > +				int n;
> > > +
> > > +				for (n = 0; n < dtp->dt_stmt_nextid; n++) {
> > > +					dtrace_stmtdesc_t *stp;
> > > +
> > > +					stp = dtp->dt_stmts[n];
> > > +					assert(stp != NULL);
> > > +
> > > +					if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
> > > +					    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
> > > +					    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
> > > +					    dt_gmatch(prp->desc->prb, stp->dtsd_ecbdesc->dted_probe.prb))
> > > +						mask |= bit;
> > > +
> > > +					bit <<= 1;
> > > +				}
> > > +			}
> > > +
> > > +			key.pid = pid;
> > > +			key.uprid = uprp->desc->id;
> > > +
> > > +			val.prid = prp->desc->id;
> > > +			val.mask = mask;
> > > +
> > > +			/* linux/bpf.h says error is -1, but it could be -2 */
> > > +			if (dt_bpf_map_lookup(dtp->dt_usdt_pridsmap_fd, &key, &oval) < 0) {
> > > +				/*
> > > +				 * Set the map entry.
> > > +				 */
> > > +				// FIXME Check return value, but how should errors be handled?
> > > +				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
> > > +			} else if (val.prid != oval.prid || val.mask != oval.mask) {
> > > +				/*
> > > +				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
> > > +				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
> > > +				 */
> > > +			} else {
> > > +				/*
> > > +				 * Nothing to do, it already is in the map.
> > > +				 */
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > >   /*
> > >    * Look up or create an underlying (real) probe, corresponding directly to a
> > > @@ -782,6 +1059,7 @@ dt_provimpl_t	dt_uprobe = {
> > >   	.probe_info	= &probe_info,
> > >   	.detach		= &detach,
> > >   	.probe_destroy	= &probe_destroy_underlying,
> > > +	.update		= &update_uprobe,
> > >   };
> > >   /*
> > > diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> > > index 40913a0f1..0efad3633 100644
> > > --- a/libdtrace/dt_work.c
> > > +++ b/libdtrace/dt_work.c
> > > @@ -368,6 +368,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
> > >   	dtrace_workstatus_t	rval;
> > >   	int			gen;
> > > +	if (dt_uprobe.update(dtp, NULL) < 0)
> > > +		return DTRACE_WORKSTATUS_ERROR;
> > > +
> > >   	switch (dtrace_status(dtp)) {
> > >   	case DTRACE_STATUS_EXITED:
> > >   	case DTRACE_STATUS_STOPPED:
> > > -- 
> > > 2.43.5
> > > 
> > > 
> > > _______________________________________________
> > > DTrace-devel mailing list
> > > DTrace-devel@oss.oracle.com
> > > https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel

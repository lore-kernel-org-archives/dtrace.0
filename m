Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F279202F70
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913585; cv=fail; b=KlG6bgiHphLQRpb2Gmz3qFcO8Bq2SzAq3l9zUN2BaIQpxl0gbd22YiX52UTWWT6eO7VNPbX88x60roPR7jNOGWlcKXJ3KyZugtqli4EkwBB9vnt4AOqNfwFh8wLFCYodOoQNoWUn9GPASyLEMi8KZfvisZRCI+e+4ZLWX2OJLNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913585; c=relaxed/simple;
	bh=ocyMFVuehwEohSacQZ0ly6ONY9jDHjpp/mtVVGJC4Cw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IIHRcEekclxCWWwwnteBsbqRb/GZLYgJwIYuNK7XECdFJ0uxkCS7pI7hUOI8O6BmU0TiuOrX3GJu933K41s+qeq1ppWi12MdT4zPRUCrdMkoknG/3WOqY3ZHvFgFYJJpo1Mf6J/eIlpmcmuon69q9DmSWcYSSpI7qFJRTmMlQZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OTgMshL2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=X0Netzx8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OTgMshL2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="X0Netzx8"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QINKG7014249
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=gk9mqWvNa7ICah2IPg
	iVXgtTcZ2sDRKKD/b52ieewUE=; b=OTgMshL2GZ9MEVMvH07lOtADPccvxZ1J1W
	t9vBwXv4Pa0Vijm90XVq/pDGzGtNFNpbR5YUs9YPukTiNXMl4QFSlMFcgcBf+bgk
	uaWrpwowFrOuizznYZiWVJ5UASGk/KkOD1w3nhAoB+TahGmfrUZA4XX1EZVrbrtG
	el3lX/q0dASEx6YU22AeEJ1GLTzAYlDjQThbb6zZln+NngeawuwI+F4bnB7Elojz
	JUnIL6LsOEKQ2g4FWb7UAmmSoJvoWis3RpMaBUqjd/A0eokHd0C3tlbTnlqVxgI2
	41Hegi+e/RhObMTDdwpuOvgHwmkNaiRfDcizzw87UvGBd707AqmQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dxrur7d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QISgH0010046
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:21 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49dawmc24v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yySBuYUzdxralqsywW9AnQd7tguRoug8Qfdg2zJPor1czWudqoa8sqfXJ+Kd0/J8J0EA2AK4PDW85zaODxJF878vPBL74SD0grTiIALzYtf4salHr29LqaLxIRq8YVF2NJVxnNKTRnoEJBkd4Xr8hKYrw/Wm883buWWzfsD9l+r5AtVJYd2Lof11TNGHLJDwfIw8dCPD0o9B4dMVafuHHlfbUca/tlrlvU2xZYZOjDCIWsgZKjT4fE+wdKKyBZR8wswwpYVF5k+ThiRcdu4PNC7CLC72/gX2aaQqaurCeprP5/mi4ZwfWjd7HcXXpZksu3d/5rz6VluF0zUAgBoLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gk9mqWvNa7ICah2IPgiVXgtTcZ2sDRKKD/b52ieewUE=;
 b=oAuHu/cTuYGa31cQ0UQvdLxA6BTJ8HCOWwjzaTrXGs+hSAshJHOqycJPTSk8inGFsMsagWxg65tlFFYQh1EFlEh4Y1AYm/dhdL8TsxVZ8uXhyQupnTr8PcgPqt8pxUaJ6R3fsRefRT/wmgIl74LkryaXZoLGohuz0B4eNIx/LOV0L50WBnMX858f3P/sOADi9WgEPbEWCQcoBFw83AYTbaEb0P9ZppN3Bd4lSIC+vY4WJktxE6DeocdkjaQwnzvM4rsUnPY858DjTFfpmWhUG+aW/+GPfwfHw+/7/sM+aomLBCOFDQAc1piJB7t0uHIl+sAtFV1nBs7/saW4TnxUCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gk9mqWvNa7ICah2IPgiVXgtTcZ2sDRKKD/b52ieewUE=;
 b=X0Netzx8r+hMfoVEm1jY3eba5/Za3ngbDLeurQ4iYVcxJ+w2uMWqxuryTJ2VDEoCpuskPnyqmUeNL8TF5qx2519pR2iXEytOuoSv9EUrYOpNxBcsNyh08l3fhND2/NvXOMVBxVcQmRAw2d/f3KqjZ+nV1h4cNMuLXFfrP5XY3dI=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by DM4PR10MB6111.namprd10.prod.outlook.com (2603:10b6:8:bf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.13; Fri, 26 Sep 2025 19:06:16 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:15 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 11/20] doc: Fix anchor links for how-to/
Date: Fri, 26 Sep 2025 15:05:48 -0400
Message-Id: <20250926190557.8485-11-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|DM4PR10MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: f69fb547-3a9e-4a8c-c314-08ddfd2fc477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jMJDgHV8A2wdzXEn8R3qluvr/xhH3HSj36pumTmkPtCEwqd/XCCmOHWzmGF0?=
 =?us-ascii?Q?SnwVIJgBgQEdN37R4slK4Of7hDGLVGlsssNAhL1XRr3wiuXc4Px4X1Dlakij?=
 =?us-ascii?Q?3v8f/tksV6NVWjpFnqBFrMnzufBU+J5OYX3FQ1UH1llEe6ppJYclY8UsUivN?=
 =?us-ascii?Q?YSflHp77TNMS7pDj0o9BuVjZJMhDQ/hTSkq2rhHLHOaIBqLC01INAzxgIj/N?=
 =?us-ascii?Q?SLPhnIjxUn3JStf3b4gE+NPXZHtcDeAFAHD9+GOu9erqXYvwtl5D/S5FTHf3?=
 =?us-ascii?Q?K77w6s+hRfYnpV3Y492PFiDq6QV9mAOIKv4IUS2je+L4lcps8j1v3DqQ/5I9?=
 =?us-ascii?Q?mLFnsxDb1e0LqxAQ9068bWUuafF74HJr2gKxQmw49WyWp04lORYbcK00+z4G?=
 =?us-ascii?Q?TGr0nPO/NNZQUdL8ALXNtIi7YoIvKYDvQXwcspXXHXK1d6Kgb1Y9R2UnBsSq?=
 =?us-ascii?Q?PqacJ3P8BAMT+Hp0k4I6vgC2LRUBdZxZhl/WS8GJZrwaSuZRaYsPdgyYZMeT?=
 =?us-ascii?Q?U8yjZOOrmpM+uk/LwzxnCrQy8Mp3CJujWhhyS/24KSl1t3e5qxswxjmcAYTf?=
 =?us-ascii?Q?bm0rw8PcVArbUSTpHDuBHGtZ80iR3VIw3h2O8FGZ8HGd4HrkkrFf1kYOuGB/?=
 =?us-ascii?Q?EbHoTGo2tOS4vFXaRLwNjjlDdi9SA2dDB9c8dnb5odJoYj/IPZdQCWPh0kSk?=
 =?us-ascii?Q?teyJeqOLy04Hw1Z4C8K6j/9Hh4mU5Je8QouIjNVacItLVOfmANkeSvJBXeAd?=
 =?us-ascii?Q?IXIxVXUS62G6+pz1tue2eKtggWtVKVKN6oGyUEmxgkVolK0LmEgidV63xTBO?=
 =?us-ascii?Q?xaeudEcL0/D1XztuVNNXjSTY4mmzpi2ou9MYgzIPHbVStGnRAg79NwuRlF1U?=
 =?us-ascii?Q?EqHsqVwtpJJlQeQcJWmBcAnthrlZa8ho/ev52kYKQzNSJSo5llRoHo0AP7Kf?=
 =?us-ascii?Q?JCgXCHBSD6yXCe4l3ELhqizMNEwqQlPeoyKJLS9KtxENjpL60QCaSxi7UUcR?=
 =?us-ascii?Q?a42VgJemOe0ai6v6JpPEDycl3jzbGLIHYxS5ScwB9id+ZztCJfPjMPSQSD04?=
 =?us-ascii?Q?CsqW+9U8uUQw2Li9jFF9kwocTVuYVtYZkuATzx/4KNZNxkXCmsxp19QFb3Tw?=
 =?us-ascii?Q?4mutiNM4bSWr86gvamHtyt+55k89T7GZOOoCBL0UVUEwJ7tHvjNdR50Id5ED?=
 =?us-ascii?Q?vnqq9H3rmfe5Rz999XINYaLbjkr+pfwL0MPoZMYCjY9iVnp45VF/gMfjBHdP?=
 =?us-ascii?Q?SZEWNrPXRYoOdKJ5wAiZc6kTEvHwHw1WgpWYZZLICywwOVL5gmjcixzf59X3?=
 =?us-ascii?Q?X4Wvbe/YVBy3Y77ddQsTmRAAs0Cn8+b3zYvqbe6Cv14Tvg7ELSuapfKG9GqH?=
 =?us-ascii?Q?SruEdSkpVnfl1kTONY0siGTmQAM6ZJWMVHYM8zho2vH4eQt+MMihLZykK9n5?=
 =?us-ascii?Q?+sj4y+2dVnXw7rpo+hHWHDDT9D47AmPZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WZYsFTLCQpdGTAMGix5qRmZzzmPcQVJeC3SHRSvHYONTJ2xXr6JSlCVNPpxi?=
 =?us-ascii?Q?6lrTNBOIfEXpUqtA9nDarpLivwS4FTjliVSbt5iz9u0cfsRcy0LOoBD8fvPK?=
 =?us-ascii?Q?snfdNX6AhlG6ssJxPJ21VKuaWKjaSRFbsV3LtnfkXSMB2nH5CB/b+PDTY4+Y?=
 =?us-ascii?Q?SJTRNBd6cTdR7aVL//PGnB1XHB+Roo+7aNJT4qWzkmZ0ahR5xDjWBLHkh2os?=
 =?us-ascii?Q?YqeAklb1v09kDg2D6oeMgBmoQcwAX3ODdIgCbXVtrVSVCDxl5GxJIMSsQwri?=
 =?us-ascii?Q?Lln78KA1JBLq2zviQxwGaMBYtPjkMH+woJkKPQjNiaIss2B7TibGDNtf+htF?=
 =?us-ascii?Q?WFeOzKqITO2KMWnujJVwYM2f/Mz6IcQNvk5PNYeaOzvJxM6of4xN1AniJHPn?=
 =?us-ascii?Q?G8neZonM6ByudW4qSGTFLKIm0UhVG655BjzYqRLQRDBhvH9kf1GuXQVNvA7I?=
 =?us-ascii?Q?haRo8fobFFOR+Rilbisyh4jAzVERv2EDm0zvYJUwA1LU71W5SQgPRX+o4Aqm?=
 =?us-ascii?Q?FZkwt4DT+rUpgWknqq5bF031hlrUA55dqxe2xgwOx3xt4OzeoL9vwte0wNUT?=
 =?us-ascii?Q?+hKPO6cuPq74JL5wfj09n/0nCUdif7yJ2i6OFsrksG8X16UGQqWkr1ID3VOV?=
 =?us-ascii?Q?DjVVK+fcp96a7fcQ86TMFcKYgdRqK+5zvNFGyBaOdgkkzz1TVFjEMs52Ll+/?=
 =?us-ascii?Q?JCF9ZBb8sKJOFyhlo00O322Bl5VoOiL5weAfkhx1weBRS50fCJuGFlHUHWiJ?=
 =?us-ascii?Q?4iD1n1sZHybpnhVh3GTkQGtUsZjzK8qrUErBAh224o6Z0Ur2jClPmHEcZf9e?=
 =?us-ascii?Q?dEDZQ6s15Om+wkEFoGZnWQpLL+tyEvSpTLG9EunrVIVS4qGIOFmMWEH5UhhC?=
 =?us-ascii?Q?C3i56IZGp50bCv2Ui9m6xXzvZ2yCf+Dv7oAev9IPpGBnL7ELJUmXtk0cvvLm?=
 =?us-ascii?Q?Izl1NjAEC0hfwQeulUgkzM1zNcasZ3T/XCcAvLUkV8sm0bOV+q+nzfs6kFky?=
 =?us-ascii?Q?eCOl5kNr2Bq0EJEBP+kdFi/hlEwZGBfS0TFBmVvEaZXDhJbDjhcGNSIzKYtJ?=
 =?us-ascii?Q?lVHEbNnwqBbGODhtgPosXFgQ99JUWYofBSkpb6ToKnQvb0ZG83Y97pC3XEci?=
 =?us-ascii?Q?KYzrsmJOSK72vIQkWxl61MGEAZ+M4qfk16FVVOU1ADHTtp+qz9u58eOpFO7f?=
 =?us-ascii?Q?2yli0PDpgUTR+EdTufnyKD5mV4MOeqKCkT2hq1hnWB6lC5p6AicOhuq1lPV/?=
 =?us-ascii?Q?jzmCAoJubSjmAqEITKWzdbPvr7eWUPAMWCCW5lwLHppZ3ZoPg0CPIhjtsSS2?=
 =?us-ascii?Q?1G1l576vCaeBWMYZopbWPCMQDvbIBl1tuCeoTdOT6VnX7BP7bcDbGz4aViOJ?=
 =?us-ascii?Q?53rtkeXEF7hUzR+N64XxBovGjjR5elLkrU30BloYOn2rYYJj5TH5VmPHZ34J?=
 =?us-ascii?Q?E/aqtEhdQO5r/FafayXdaLMIh6x/jBBF4Fe2t3iokCSAk+UV5tnF3WdHEVuV?=
 =?us-ascii?Q?cuHikg1wYyHM0crJbQ6AvV8YbsfqnvVho3IMxTuI7iPIuyISER6/6C3SQPfo?=
 =?us-ascii?Q?MYsQ00ixYo8dqWnaeTAeKov4ercwQ6WBLX4v+Q4F?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	h5koMuvF7X4kudI5ehiuH1NlputnSpE09+ec45M4gQ1PF6Q1wsdElv6uqWyS0BMQWYrHA7+6tUwMWMWJONtNJyXQR3dQbXvvljB664MAt+bfFH3YUYUWhIXef/k7My9caUj0f/SxyOpbLFI3spJvxJBoW6n31tcLsDUTybIqhN2OJ5iuHJI+rWzypSlmnGfc2mmZU0IeduytYcucrVEyE7D/FoRVpsnwWLI5mBTixM2mSWFReRih+hIAlRwLEp8LVDR5ZMY1Fs/216s45iICFEjXIOMK5ciPADlhXsN2Dv2Q+hLHSj19S/Z32x0TOEwlO5f7L8LjVs2EMdIRrgsQcodkWF5X2Cpp1/OxyNoCr/ReTvToO81kvxu1s3zB021pIAEAlfhurQUg0z2Q6uvW4WfYFlD/C7EDXZcfUEutTldLaZ6vZG4FSc8Tz8i4TyMUrPtJEqIMs/tEzH5yoBBftq526eBt1mg+i4OYsU99Cst+vPz40np4/CuayHaWMZIln29amlvWwtnoD0qWNPEXhAZ4u3abc4rLaUPKFNAGgvNiEAsO1Lb51C/LcGqc0yn+3cgDCZ6bOZVRQd9vc87cLked0sCEs8kIonVU3zl+Fk8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69fb547-3a9e-4a8c-c314-08ddfd2fc477
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:15.9566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tshcBv1C3ucAFmf6t050Q/hnZ+xrlI7NMPqX2Pv5/DIqCx3SpQ9aW7XwdvZf38nUVcTTyiDq2NRYiJU6v4DCUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509260172
X-Proofpoint-GUID: 0ouJ0XvbFZHzkTSVxfdeUZ2mPJtPcWY6
X-Proofpoint-ORIG-GUID: 0ouJ0XvbFZHzkTSVxfdeUZ2mPJtPcWY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE1MyBTYWx0ZWRfXzWSdRD8lSTVs
 suzHsjkZXuyW0l9XhWFiFf8kWKsVD64I9C9Pj1dTz+7QWk7ntKMGd4++nm2C6gzsgwkRqPEEfQf
 dKs33jqiK5Yd5MOVH3WYd15jTGpiPcoE0aJPCx1UH8fRjfxO1iK5klsfVRErt7yPBY4azNfcaky
 NiQAZpL2zlLZSif0Zs6tzHn5eJenwsOTcZDN2WBqQWlZzp+kCygwV5ar+GuYmNaAyAxSfft023L
 /MeAdsb92BgA471KVYnp2INlk0imfSZCc7Zk30dNmVfLdq0wWfnKKORpWhaJ4alb3J0fb4sON9r
 nrhOK318jtG1gCOC/2pDaAgGmwTLtLb0c0g4qFEU7b4eoUI4yb36uzdPq3GQm870yfTae1T//Sy
 D9ctQUHFPhpw3DKm8U80hV/2OODpouS66KGQhqT64XWD2pIDgB0=
X-Authority-Analysis: v=2.4 cv=duLWylg4 c=1 sm=1 tr=0 ts=68d6e42e b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jrLqvFmj13w0y_fqXkgA:9 cc=ntf
 awl=host:12090

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/how-to/dtrace-howto-install-dtrace.md | 12 ++++++------
 doc/userguide/index.md                              | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/doc/userguide/how-to/dtrace-howto-install-dtrace.md b/doc/userguide/how-to/dtrace-howto-install-dtrace.md
index 83de8f905..a8f227715 100644
--- a/doc/userguide/how-to/dtrace-howto-install-dtrace.md
+++ b/doc/userguide/how-to/dtrace-howto-install-dtrace.md
@@ -4,7 +4,7 @@ The following instructions provide steps to install DTrace on different Linux di
 
 **Parent topic:**[Get Started With DTrace](../how-to/dtrace-guide.md)
 
-## Build and Install DTrace on Gentoo Linux {#build_install_dtrace_gentoo_linux}
+## Build and Install DTrace on Gentoo Linux
 
   ```
   emerge dev-debug/dtrace
@@ -15,7 +15,7 @@ The following instructions provide steps to install DTrace on different Linux di
 ## Install DTrace on Oracle Linux
 
 
-### Install DTrace on Oracle Linux 10 {#install_dtrace_oracle_linux_10}
+### Install DTrace on Oracle Linux 10
 
 1.  Enable the yum repository.
 
@@ -38,7 +38,7 @@ The following instructions provide steps to install DTrace on different Linux di
     ```
 
 
-### Install DTrace on Oracle Linux 9 {#install_dtrace_oracle_linux_9}
+### Install DTrace on Oracle Linux 9
 
 1.  Enable the yum repository.
 
@@ -61,7 +61,7 @@ The following instructions provide steps to install DTrace on different Linux di
     ```
 
 
-### Install DTrace on Oracle Linux 8 {#install_dtrace_oracle_linux_8}
+### Install DTrace on Oracle Linux 8
 
 1.  Enable the yum repository.
 
@@ -86,7 +86,7 @@ The following instructions provide steps to install DTrace on different Linux di
     ```
 
 
-### Install DTrace on Oracle Linux 7 {#install_dtrace_oracle_linux_7}
+### Install DTrace on Oracle Linux 7
 
 **Warning:**
 
@@ -111,7 +111,7 @@ Migrate applications and data to Oracle Linux 8, Oracle Linux 9, or Oracle Linux
     ```
 
 
-## Verify the DTrace Installation {#verify_install}
+## Verify the DTrace Installation
 
 Check that DTrace is installed to the correct location and verify the DTrace version.
 
diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index 8a0050819..72a9bf16e 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -2,12 +2,12 @@
 
 -   [Get Started With DTrace](how-to/dtrace-guide.md)
     -   [Install DTrace](how-to/dtrace-howto-install-dtrace.md)
-        -   [Build and Install DTrace on Gentoo Linux](how-to/dtrace-howto-install-dtrace.md#build_install_dtrace_gentoo_linux)
-        -   [Install DTrace on Oracle Linux 10](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_10)
-        -   [Install DTrace on Oracle Linux 9](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_9)
-        -   [Install DTrace on Oracle Linux 8](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_8)
-        -   [Install DTrace on Oracle Linux 7](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_7)
-        -   [Verify the DTrace Installation](how-to/dtrace-howto-install-_dtrace.md#verify_install)
+        -   [Build and Install DTrace on Gentoo Linux](how-to/dtrace-howto-install-dtrace.md#build-and-install-dtrace-on-gentoo-linux)
+        -   [Install DTrace on Oracle Linux 10](how-to/dtrace-howto-install-dtrace.md#install-dtrace-on-oracle-linux-10)
+        -   [Install DTrace on Oracle Linux 9](how-to/dtrace-howto-install-dtrace.md#install-dtrace-on-oracle-linux-9)
+        -   [Install DTrace on Oracle Linux 8](how-to/dtrace-howto-install-dtrace.md#install-dtrace-on-oracle-linux-8)
+        -   [Install DTrace on Oracle Linux 7](how-to/dtrace-howto-install-dtrace.md#install-dtrace-on-oracle-linux-7)
+        -   [Verify the DTrace Installation](how-to/dtrace-howto-install-_dtrace.md#verify-the-dtrace-installation)
     -   [List and Enable Probes](how-to/dtrace-howto-list-and-enable-probes.md)
     -   [Create a DTrace Script](how-to/dtrace-howto-create-a-dtrace-script.md)
     -   [Use Predicates For Control Flow](how-to/dtrace-howto-use-predicates.md)
-- 
2.47.3


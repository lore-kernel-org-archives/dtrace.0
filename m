Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9891A4F3C
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755554845; cv=fail; b=UxKuKv3QsCVUzKnky1AyrTg08HBWD8nJFV9naN0AGIfIO4DxFkv1WTnYoks/w4P3MxYew0FeIuVKvyPvY8FzbGHYf57iF9+gucKIPWlBDV81JYcvjNAaoHtIKocuqRkBwpFz+zdGV+P+iDw1uIPqcK6oMX0rZeMGEQtkPGgI0BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755554845; c=relaxed/simple;
	bh=TaoB0xtyJ4qTxbaeIG5ci3MkQ616heVLwQUF8cZgy0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wj8hEDTWq2krAppTJgZBkk71Zn4OkVemTt8GfFEozlZFl3cLlye8ZrBM3K9Q+8ygCx8GK9RMVED4bY5g6RJ+mt9GaK4CmZD53p0ALoAXH3vcg4g8RLAKI27tcqES9Hek28B/OQZ4zinx+1MA23fnz2TffgN0iNlmMwXM8yj3ECI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=djXKu4e6; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rV9hQgEF reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="djXKu4e6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rV9hQgEF"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IJgMVY019383
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 22:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=vCee/zgKiivNze1EEcXDJcQnEzke8QMbuDIX5ek53EI=; b=
	djXKu4e6be15ZIibyIX8X2NLTqMKY/0MNR9wzvEcWop0EUurRMbXOW53ULNPqjQZ
	F7tCmuui08NpvFJcwxZ5s+y3KDTdty+EFuy27qC1aEVpi1p89ficHF4E8QwvX2ui
	8TbdgJh5Lv1T7O+gW/tpdia9dB+PTdvM6wBvjWaZe5aQeY+V465xjWJ2EjZz6UJS
	0RNCnhIt5B6iVB0Cd8DMxpB/ffJd3DGFj6gBc9L6OfBKxh8wf1tqLVk4PxEsPsHM
	iWWuuVlNiKM2R4MN0BisQoNU85cFkuwFy92JI3dSl+0f/ErRq0aAdoceleOqRNtS
	EySmJjv3AgVJOQDpP08veQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jgdfm2p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 22:07:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57ILe7NV010450
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 22:07:21 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48jge9v56e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 22:07:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/PADW+xsPN44eAZfouR4tGj1cl8BbaDbNlPG420n/7KbrnNln5NPXZdh2LJgRcYMAVbQ2Ra62Z20Xwyc+ExtvldnxSvMe7bpBkWgxVZiP1Yqh50+26pozZsBHrs6Q5yYcyqi2K0N8XA80stgPq/RP7xCX1b0bInzR1AbsgXl3z2qr90DDzH5ehcvjZO6YNEwKZMjQC912dG4iTdADvSk6ryOWFCmLoHTx6malgXhccKKpbUd6kKxV5Ppe7gIjXVDxYvD7xsPsXi1HGnj9ROjdBMPfxeTNMYWYypTOa4DweJX/6dTWqvF/A0fD31++ekgPcMHQRn9ffYD9+jLpPQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpFdLk+mLQk/UabBhE15/T+FTIA8BBoz3Sx/GdyuKfM=;
 b=PpInw1bsZk2NIg3kQE/pEUV8CTxvd6/DWMEtGMREBHYRYhPAjbmStU7BKgF1NBeb1fcccYLOlwdK7nzIhYnH2HgShONXTqVcbCA+5FdwJPL8d5MPZCjSRYnqHeN3Uvt1sQnoxQJ3ODxllwYluyxpcaqo56RV7DheMU4anwng7CeHEAU5owdZiWG5nTQ4oDRiB6xeA0tfMy3IL4Je0oz60qvFIH9vWddzRyWn6VWo4ngSGZgp5OEKwmsRzFvcJybjhLHiuqe6+DTreAF/fv+CW45ygqReAtbh4eZg3jbeWJQWmYxZTSdLM8hORZ4ANFia02omiZ4yIxZQw/Xp2RxI/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpFdLk+mLQk/UabBhE15/T+FTIA8BBoz3Sx/GdyuKfM=;
 b=rV9hQgEFXvGJZzssEVLgxiVlWa8X+1fWC4hbcw6O+PvdpRMrnNd3WAUuHPuijC6u0Ungh182qoaDz//N8UaFVHq5HAyRdbw5gEkRbVCCVIkVcbcTdYB1a8dNjw315zD8PhKhldAFRxI2jdUlhvfyqLONI6A8mhwycS4PfdMkCEw=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA1PR10MB7712.namprd10.prod.outlook.com (2603:10b6:806:3a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 22:07:17 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Mon, 18 Aug 2025
 22:07:17 +0000
Date: Mon, 18 Aug 2025 18:07:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/2] Refactor the versioning handling
 system (consolidate data)
Message-ID: <aKOkEh23LF+/efB3@oracle.com>
References: <SJ0PR10MB5672EB3042EB4FF38F34FFD6C237A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <0a298885-a398-8de6-8001-03ca7fc2ecbb@oracle.com>
 <aKOXcCwgy/DEXqI3@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKOXcCwgy/DEXqI3@oracle.com>
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA1PR10MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aee3d76-169a-40ae-9ab6-08dddea39868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?3Y7jaIX60Obz1XGpIDEigLiJW3xZWpfgJc2pvGOW7ycU9DODwShS+lTWxA?=
 =?iso-8859-1?Q?D5rtYtf+HCb3ODrOnnUW1skptO254vVKiVB/I8wvi3Cy0SntghKC9H/8bi?=
 =?iso-8859-1?Q?tMooo8Ye1Gy9YXCRnSdyxcTVSBY5Mky3ImImT6J5pbQWrl7oMoGYoCOHJ+?=
 =?iso-8859-1?Q?FuzEvSrDNf+YmuQwDXDDOen0SvCUmkNNWeJ2Mv1m+S7dVrL9Ks+HLgHVCb?=
 =?iso-8859-1?Q?RV4D1sdolq6LCKPhh0ld1+6km2aptF/Ez0hHvrLRHBz8yAptOUAUUlWF0/?=
 =?iso-8859-1?Q?SwY55+xi6+t8pqg5ZooNFFqRU/FVnMtekAo9HxacKQRYSeiv8uG6G18yWK?=
 =?iso-8859-1?Q?KBSEAC/p3IZE4Rxt5DsOc8ZrLeMtbmkiYQ+I7BwmzlPAZTHXslBz394hEq?=
 =?iso-8859-1?Q?MBvV2/uJ7ouSSl7jHN/cFCAf+3q6k93M69SYFETwiw9ahbJmoFNo7Adnds?=
 =?iso-8859-1?Q?c6PRWM17tERjVE1fjq0IqGa9mfhwNEm+s0RD3DE1C+C6ygDqAvsg2EGSMh?=
 =?iso-8859-1?Q?9U1fOy2y9Et7ckQZflsZZac5uixu69lAWcPtFFCBWBa7J5bOREzds83UVC?=
 =?iso-8859-1?Q?32Dr4WthtRx/vTLupPijrA8kywiJhehY7YD4eV/kE01mCj5wspGj30M+Zs?=
 =?iso-8859-1?Q?kh+HHp5qd8BW6OB+glO81SEZJD+Iir6Vbn/67YwcksmK2lT4/RiArZUrWU?=
 =?iso-8859-1?Q?6EiBFcSopd80XZxfJuI3ryDbIuJezymsfNIvNjVbtFNqepW/aIfSKCl9uR?=
 =?iso-8859-1?Q?hvmOAXohrVUTx+m9mIikXv+LyVLKQ+NXMKhNANpGNoPrL9aT8HYEnnouYV?=
 =?iso-8859-1?Q?RQ+zXTGOegoVr7AMsQ9jete3pNljyw8HTtRPja95zU56ZD1kBcwToUVsXn?=
 =?iso-8859-1?Q?6Q6jz8zoZ6erjWaJoB5lMyfnSofrcg5bAUi8RpYaguWGO6v1fJYbSu7juQ?=
 =?iso-8859-1?Q?I7qpln1E3R2PNYJjUinIc7v2KliuRukUJjcHbvex/pfefQblwALrUt6xBv?=
 =?iso-8859-1?Q?rkfu3HUXOWJu+rVJzhdMhh9fxW6aEsWn+GkKdvoTJUOBAFNdoj+ZzWxNjY?=
 =?iso-8859-1?Q?L8wCGoEc4W7mQhlcrF3zm7R8TJhTUluBETt902TcIDfKKXuzAuhUsjiqXP?=
 =?iso-8859-1?Q?p0j457m40B5nDVf14ADYcF1HJyWKnmMZ8fvRwwh1MGGtL3ON9nweo9gRVr?=
 =?iso-8859-1?Q?ju9E65CjsUmapRawGwNE3QLoIfCyXuSCeYEtZVTLOQegjoZRZDUfJAkVX+?=
 =?iso-8859-1?Q?MvsY2KjOYbW6flXkr5zSk1jxw2OYMIFmOQN6GLY7sVuuvdoXzl/psTLW7E?=
 =?iso-8859-1?Q?YzbQjLYrvk+G5IQ9r7e+r/7ffj3yhQuAweG1iZtuPFYaLW2cWHRnqVLdTe?=
 =?iso-8859-1?Q?Gx3f55pj6y8+4O46w12vcoPR1fRD0GvEpUFKaipT6eW5xYtZ5mtV07BUw9?=
 =?iso-8859-1?Q?GJNIRBj2JD+62R4P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?1gGnNWE5YC1wFuyMmlmi/mcrw1rXpsgmAUp/CasHdcploeagb9Di1SuivH?=
 =?iso-8859-1?Q?uTgSwrj5QLU/Ekd+JdNi/ZaM4OjH/npuBWjTVisuOkVzcAL6iO+cYR20Su?=
 =?iso-8859-1?Q?8i9snCoLnPcUidj7Yuo2CEZPeciGehfpbTJvKEXK45dooJtxvcr2j9igj1?=
 =?iso-8859-1?Q?uioMG7QON2Eatm06om8azeUBpra+YjZAU3wRJG10O6JwlBqT3iujNHZlu7?=
 =?iso-8859-1?Q?Vlwg8UdJOAhgmp+H3fSVu6OIhYFdWaHaljACR8wM9Ezi/GzwajziMvHa9d?=
 =?iso-8859-1?Q?GwG9kwl8DFRHcCwMHTsFHsPbcgk+wK2JklUkxQccwRnRg1mnUPj16pZ4Eu?=
 =?iso-8859-1?Q?QhxyeaoHzGdaplvYKhv+39UOETOBy5W/ee7qTbPBJF+DjZtG2qHHQ8A60E?=
 =?iso-8859-1?Q?SHIlEp0W4WOd0My8+eqDvSjxlulunCy/JB3xIyWEKIIjRHYW9hgQUZwT/a?=
 =?iso-8859-1?Q?tVYNJJR+VuGBEt5YkBXHuhi+u5rDONjPXQm4kItmAx5pjWb7cEg3xUCL2m?=
 =?iso-8859-1?Q?xd5tns4lYkD0tDn8Hcxhb4R4o7kvCR4niOnL4KyIEeyvfF/UVSSntcox+1?=
 =?iso-8859-1?Q?njjjZFhd/nrqFXIUavz6a6J2np27p860P7Z7o8Z91aJMwUUTDNRZZtu5o1?=
 =?iso-8859-1?Q?vrss2KMblNbaJelEIBlft6P2T1HKZWEDnML/lEkB3/hlcXMzYfzvUj2pV2?=
 =?iso-8859-1?Q?G88xq6OFdfq3JcwPMfe4ZjHZyjC/Z3OUrJSu5KE7lffXxcqfNH7Qb3zchf?=
 =?iso-8859-1?Q?m3pnfXHU1IZzm+KwJ6dR+K5m15TQ0ZktvllY+d8+rJ36m7busqL7BglxET?=
 =?iso-8859-1?Q?mgeUc6Ra9q9xN3pXlZXIm9dfzPfxwbsZSzFyqyWtYnZZc8PdTWRH9OwSwH?=
 =?iso-8859-1?Q?xLn1pbFEisYCHaSYsVQV7+VP8n3v7W7vzajdNxi48e3iaP9NEUIpCgenvX?=
 =?iso-8859-1?Q?e37lIyKHqR0rMcg1Sv/xDd2KoWnNkiLLg1CIj2p/39yjfrn+maDbn5IE/E?=
 =?iso-8859-1?Q?q20cMYiCpfyhUldlZ07w+ssLXhCJF5QGBR4TtMyimx0Mid8U2DvCdrK/9r?=
 =?iso-8859-1?Q?Y2TU6jT56tQZKPtHTlZOdni2jmjRa0zFoTtAeqkXsRkKF0t3TYzDUCi5Hb?=
 =?iso-8859-1?Q?Mdd1/NNnN4mNHOY9kNSoYnpvf95cO+dY5qGKNrNyyg9pWpgqV5ZwsoPP8k?=
 =?iso-8859-1?Q?3yG9gRU/Bw74UMMAScPGOvOyegvjZRVkKPu6QAaKEPlb5dgtno9nbZglXj?=
 =?iso-8859-1?Q?/ZhAj25qCAlE2nn8U/2Hb2REEGH47nWh+MqIXu/mSndXaFdI1kmec5eBAA?=
 =?iso-8859-1?Q?zNUjfFd0Ax6u+uPG/D+tIF6MqgRuR4bEMX4/gHnWIf2fBVY3mVRQGVr2Tg?=
 =?iso-8859-1?Q?2c+Dd/U8NZn1UAsNNTcvqYJmR0jt7fNvuOedO5CMGoT7zb77031Oeyd8xa?=
 =?iso-8859-1?Q?E1jyMdVBkc7pJdfsBZ1xvRR7CgRlI2yD0qjz4q9/omAeNjlBq9vfo2Eiwh?=
 =?iso-8859-1?Q?8glMgfabx2zZ4sKSzzSXryVBmXgV4o9WzXc3x/II4iRWRDkrQ9gPFj0XNV?=
 =?iso-8859-1?Q?gOEmPK/z04foCeisZqxFpfxPx2VjI/aPlAmx/qFGNj2Muoyaxk9z/SNSsU?=
 =?iso-8859-1?Q?37gI/IxSZeAodDNjFExgf+RJl3EOioMiaiWFTFntnbwT3Yi2Lrse2Pfw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pfTKpmM6YSRxiFAStpgKmhlVPCEjB+lkFky0VgdHO6Ge1UX90xdNVk0NCbhlhpJrdiJOjHBXJ/qrOdQZrSZhvZTaSUsRX5il5YtnIWG4ew8Eo2e8jH5ZkI7RvgI79IBTxKcHK8k+VdqCny6c78BSCFLTJ+GhPplAEVkSwMYUCkOQFnpldTwlnP5Vl5NWVva0JZWKtIFh3W/LXmVfbhyyvgHJyRLu7by53bgEn0Kxs9+AKvSp8A/E7b9Ospwo+q3o8KbUMVz6XBYTGUkt4ctb5gdUo6HZ5fsUSKWtd2RSGBYQLKIs3tFABwnDQPk2f4B9IzzDRSbY12+r3+erxiu9qn03OBSIfTwybB0WNzAmDOPQ2N4h6Mfjnu2cf9POG3d/pyFHKuSkbMMW4u6vELyYJ2DVS9Qd5/mKJQS97EFvEuH/MDiGl3tuS1iMQY/h4yJiccTcn7U/QtyT5USFQtdE3iov2m9RAVSLgppCu3TVecu8EfRsFQ166apiVGoZU/M/Hda8RPDnuJu42oTOf+kAa4+pzm70WTxKH5V/Oo/3e6bTePwVPeVf7cA9zfUFXIbHOTs/I5fjJHwgcVAWljjDMyXVHvLZ/WzcVPkZbekiR1w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aee3d76-169a-40ae-9ab6-08dddea39868
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 22:07:17.6306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8DnxGOF7SGDDcKa9HjhRFJUS6ttttmCGMseAuviOx/4UShEbCIztsJhS+CYyzy03dz2zDM6DTNj3lbf3wqawwkwSOX/wUREPjxtsSTyTbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7712
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508180207
X-Proofpoint-ORIG-GUID: iGwqVSREIBeHoXNDrxgEeRSECoByPUSv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwNyBTYWx0ZWRfXz5QqqMU4AfKo
 MNF+i5BgPqgyCa3thadQgTIoWd0T0wS2pAH8Aa2+vJoWEBNOs7TIFnF2NrwmDeeoHiNR+eKQny9
 o4FNHgxQgCa4Z5POG1uoH3ta30OVncPaDmeJEwI3Km2aF9hod+8sTJQZS/h0m4m+ZG7gJI6+WpX
 11Qhly4jck5JrAWxBb/bsK2uRXxtD9CtFRKR1D5mkVZix1vHrp/rjoOPnzMoomis8poE+udkF7l
 rEhAAu+9bb/d0mfhqDfqJuzMHf+p/83f23n5EN6H6MGvYVMQg7mnLedarZsW+M0aJczOxy8Q84V
 U7ZI8k+N1diipcnE4DlxU4QdoCXwjKGQJK/QuijKfHzVnUI93+TUa5ifjwV54OtaIY6STACw82u
 mwJayI/gpo+8GGjDgLD0YRorvgqBlVniF5pX+SvNfG5j3xiUKlRCxh1vp7C3dKMw3eSGnxyH
X-Proofpoint-GUID: iGwqVSREIBeHoXNDrxgEeRSECoByPUSv
X-Authority-Analysis: v=2.4 cv=OK4n3TaB c=1 sm=1 tr=0 ts=68a3a41a b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Do7MQc0RpImlgiPvtPcA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12070

More replies below...

On Mon, Aug 18, 2025 at 05:13:20PM -0400, Kris Van Hees wrote:
> 
> 
> On Mon, Aug 18, 2025 at 04:45:31PM -0400, Eugene Loh wrote:
> > With this patch, I get test regressions:
> > 
> >    test/unittest/options/tst.version.sh
> >         Diff against expected:
> >         -version is 2.0
> >         +version is 2.0.3
> > 
> >     test/unittest/dtrace-util/tst.APIVersion.d
> >         Diff against expected:
> >         -dtrace: Oracle D 2.0
> >         +dtrace: Oracle D 2.0.3
> 
> Test with v2.
> 
> > I did not run the test suite, so I do not know if other tests also fail.
> > 
> > Should something be done in libdtrace/Build with
> >     libdtrace_VERSION := 2.0.0
> 
> No, see Nick's email on this a while back.  Library version is a different
> thing.
> 
> > Should something be done in dtrace.spec with
> >     Version:      2.0.3
> 
> No, that should be done separately because it is a distro-specific release
> thing.  That should remain separate because (1) it is hard to automate its
> value, and (2) we have to change the spec file for each release anyway.
> 
> > On 8/15/25 23:46, Kris Van Hees via DTrace-devel wrote:
> > > Rather than having multiple data items that need to be updated whenever
> > > a new version is released, a single entry in versions.list will now be
> > > all that is needed.  The mkvers script generated the necessary defines,
> > 
> > s/generated/generates/

Thanks.

> > 
> > > and is also used to return the most recent release version to be used
> > > in GNUmakefile.
> > > 
> > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > ---
> > >   GNUmakefile             |  2 +-
> > >   libdtrace/.gitignore    |  1 +
> > >   libdtrace/Build         |  7 +++-
> > >   libdtrace/dt_version.h  | 83 ++---------------------------------------
> > >   libdtrace/mkvers        | 68 +++++++++++++++++++++++++++++++++
> > >   libdtrace/versions.list | 67 +++++++++++++++++++++++++++++++++
> > >   6 files changed, 147 insertions(+), 81 deletions(-)
> > >   create mode 100755 libdtrace/mkvers
> > >   create mode 100644 libdtrace/versions.list
> > > 
> > > diff --git a/GNUmakefile b/GNUmakefile
> > > index 7ad857f88..03687bf3f 100644
> > > --- a/GNUmakefile
> > > +++ b/GNUmakefile
> > > @@ -14,7 +14,7 @@
> > >   SHELL = /bin/bash
> > >   PROJECT := dtrace
> > > -VERSION := 2.0.3
> > > +VERSION := $(shell ./libdtrace/mkvers -vrelease=1 libdtrace/versions.list)
> > 
> > I think to most readers "release=1" means, well, release 1.  How about
> > renaming the variable.  Alternatively, just say "-vrelease=t".

Sure.

> > >   # Verify supported hardware.
> > > diff --git a/libdtrace/.gitignore b/libdtrace/.gitignore
> > > index cf124ba1d..ebf6ac9b2 100644
> > > --- a/libdtrace/.gitignore
> > > +++ b/libdtrace/.gitignore
> > > @@ -3,6 +3,7 @@ dt_errtags.c
> > >   dt_grammar.[ch]
> > >   dt_lex.c
> > >   dt_names.c
> > > +dt_versions_defs.h
> > 
> > Great.  But dt_versions_defs.h should also not survive "make clean".  So
> > that also should be added (in the appropriate place).

Will do.

> > 
> > >   errno.d
> > >   regs.d
> > >   signal.d
> > > diff --git a/libdtrace/Build b/libdtrace/Build
> > > index 164023bbc..a3c3a2e1a 100644
> > > --- a/libdtrace/Build
> > > +++ b/libdtrace/Build
> > > @@ -73,7 +73,8 @@ libdtrace-build_SOURCES = dt_aggregate.c \
> > >   			  dt_work.c \
> > >   			  dt_xlator.c
> > > -libdtrace-build_SRCDEPS := dt_grammar.h $(objdir)/dt_git_version.h
> > > +libdtrace-build_SRCDEPS := dt_grammar.h dt_versions_defs.h \
> > > +			   $(objdir)/dt_git_version.h
> > >   SHLIBS += libdtrace
> > > @@ -129,6 +130,10 @@ SHORTKERNELS := $(foreach kernel,$(KERNELS),$(shell printf %s $(kernel) | sed -e
> > >   $(libdtrace-build_DIR)dt_errtags.c: $(libdtrace-build_DIR)dt_errtags.h $(libdtrace-build_DIR)/mkerrtags.sh
> > >   	sh $(libdtrace-build_DIR)mkerrtags.sh < $(libdtrace-build_DIR)dt_errtags.h | sed -e 's/\\n/\n/g' > $@
> > > +$(libdtrace-build_DIR)dt_versions_defs.h: $(libdtrace-build_DIR)versions.list
> > > +	$(call describe-target,MKVERS,$@)
> > > +	$(libdtrace-build_DIR)mkvers $< > $@
> > > +
> > >   $(libdtrace-build_DIR)%.h $(libdtrace-build_DIR)%.c: $(libdtrace-build_DIR)%.y
> > >   	$(call describe-target,YACC,$(libdtrace-build_DIR)$*.c)
> > >   	bison -o $(libdtrace-build_DIR)$*.c -d $(libdtrace-build_DIR)$*.y
> > > diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
> > > index 8dd252b08..5c1528266 100644
> > > --- a/libdtrace/dt_version.h
> > > +++ b/libdtrace/dt_version.h
> > > @@ -13,83 +13,7 @@ extern "C" {
> > >   #endif
> > >   #include <dt_ident.h>
> > > -
> > > -/*
> > > - * Versioning definitions
> > > - *
> > > - * These #defines are used in identifier tables to fill in the version fields
> > > - * associated with each identifier.  The DT_VERS_* macros declare the encoded
> > > - * integer values of all versions used so far.  DT_VERS_LATEST must correspond
> > > - * to the latest version value among all versions exported by the D compiler.
> > > - * DT_VERS_STRING must be an ASCII string that contains DT_VERS_LATEST within
> > > - * it along with any suffixes (e.g. Beta).
> > > - *
> > 
> > The comment about "any suffixes (e.g. Beta)" disappears here.  More
> > significantly, the ability to have such suffixes seems to disappear.  Is
> > that a notable loss?  The loss of capability should at least be noted.

There is no loss of capability here.  While we can't use arbitrary version
strings anymore with the new setup, it is simply a string that is displayed and
being able to give it an arbitrary value is actually more likely to cause
confusion.

This ability has not been used in the entire time DTrace for Linux has
existed so I don't think it warrants pointing out that change explicitly.

> > > - * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
> > > - * explanation of these DTrace features and their values.
> > > - *
> > > - * When adding a new version:
> > > - *  - Add a new DT_VERS_* macro
> > > - *  - Add the new DT_VERS_* macro at the end of the DTRACE_VERSIONS macro
> > > - *  - Set DT_VERS_LATEST to the new DT_VERS_*
> > > - *  - Update DT_VERS_STRING to reflect the new version
> > > - *
> > > - * NOTE: Although the DTrace versioning scheme supports the labeling and
> > > - *       introduction of incompatible changes (e.g. dropping an interface in a
> > > - *       major release), the libdtrace code does not currently support this.
> > > - *       All versions are assumed to strictly inherit from one another.  If
> > > - *       we ever need to provide divergent interfaces, this will need work.
> > > - *
> > > - * The version number should be increased for every customer visible release
> > > - * of DTrace.
> > > - *  - The major number should be incremented when a fundamental change has been
> > > - *    made that would affect all consumers, and would reflect sweeping changes
> > > - *    to DTrace or the D language.
> > > - *  - The minor number should be incremented when a change is introduced that
> > > - *    could break scripts that had previously worked; for example, adding a new
> > > - *    built-in variable could break a script which was already using that
> > > - *    identifier.
> > > - *  - The micro number should be changed when introducing functionality changes
> > > - *    or major bug fixes that do not affect backward compatibility -- this is
> > > - *    merely to make capabilities easily determined from the version number.
> > > - *    Minor bugs do not require any modification to the version number.
> > > - */
> > > -#define	DT_VERS_1_0	DT_VERSION_NUMBER(1, 0, 0)
> > > -#define	DT_VERS_1_1	DT_VERSION_NUMBER(1, 1, 0)
> > > -#define	DT_VERS_1_2	DT_VERSION_NUMBER(1, 2, 0)
> > > -#define	DT_VERS_1_2_1	DT_VERSION_NUMBER(1, 2, 1)
> > > -#define	DT_VERS_1_2_2	DT_VERSION_NUMBER(1, 2, 2)
> > > -#define	DT_VERS_1_3	DT_VERSION_NUMBER(1, 3, 0)
> > > -#define	DT_VERS_1_4	DT_VERSION_NUMBER(1, 4, 0)
> > > -#define	DT_VERS_1_4_1	DT_VERSION_NUMBER(1, 4, 1)
> > > -#define	DT_VERS_1_5	DT_VERSION_NUMBER(1, 5, 0)
> > > -#define	DT_VERS_1_6	DT_VERSION_NUMBER(1, 6, 0)
> > > -#define	DT_VERS_1_6_1	DT_VERSION_NUMBER(1, 6, 1)
> > > -#define	DT_VERS_1_6_2	DT_VERSION_NUMBER(1, 6, 2)
> > > -#define	DT_VERS_1_6_3	DT_VERSION_NUMBER(1, 6, 3)
> > > -#define	DT_VERS_1_6_4	DT_VERSION_NUMBER(1, 6, 4)
> > > -#define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
> > > -#define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
> > > -
> > > -#define DTRACE_VERSIONS	{ \
> > > -	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */ \
> > > -	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */ \
> > > -	DT_VERS_1_2,	/* D API 1.2.0 Solaris 10 Update 1 */ \
> > > -	DT_VERS_1_2_1,	/* D API 1.2.1 Solaris Express 4/06 */ \
> > > -	DT_VERS_1_2_2,	/* D API 1.2.2 Solaris Express 6/06 */ \
> > > -	DT_VERS_1_3,	/* D API 1.3 Solaris Express 10/06 */ \
> > > -	DT_VERS_1_4,	/* D API 1.4 Solaris Express 2/07 */ \
> > > -	DT_VERS_1_4_1,	/* D API 1.4.1 Solaris Express 4/07 */ \
> > > -	DT_VERS_1_5,	/* D API 1.5 Solaris Express 7/07 */ \
> > > -	DT_VERS_1_6,	/* D API 1.6 */ \
> > > -	DT_VERS_1_6_1,	/* D API 1.6.1 */ \
> > > -	DT_VERS_1_6_2,	/* D API 1.6.2 */ \
> > > -	DT_VERS_1_6_3,	/* D API 1.6.3 */ \
> > > -	DT_VERS_1_6_4,	/* D API 1.6.4 */ \
> > > -	DT_VERS_2_0,	/* D API 2.0 */ \
> > > -}
> > > -
> > > -#define	DT_VERS_LATEST	DT_VERS_2_0_1
> > > -#define	DT_VERS_STRING	"Oracle D 2.0"
> > > +#include "dt_versions_defs.h"
> > >   /*
> > >    * Interfaces for parsing and handling DTrace version strings.  Version binding
> > > @@ -112,8 +36,9 @@ extern "C" {
> > >   typedef uint32_t dt_version_t;
> > > -extern const dt_version_t _dtrace_versions[];
> > > -extern const char *const _dtrace_version;
> > > +extern const dt_version_t	_dtrace_versions[];
> > > +extern const char *const	_dtrace_version;
> > > +extern const dt_version_t	_dtrace_vers_latest;
> > 
> > What is _dtrace_vers_latest for?

Oops, left over from a previous way of trying to do this.  Removed.

> > >   extern char *dt_version_num2str(dt_version_t, char *, size_t);
> > >   extern int dt_version_str2num(const char *, dt_version_t *);
> > > diff --git a/libdtrace/mkvers b/libdtrace/mkvers
> > > new file mode 100755
> > > index 000000000..c45617773
> > > --- /dev/null
> > > +++ b/libdtrace/mkvers
> > > @@ -0,0 +1,68 @@
> > > +#!/usr/bin/gawk -f
> > > +#
> > > +# Oracle Linux DTrace.
> > > +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > > +# http://oss.oracle.com/licenses/upl.
> > > +#
> > > +
> > > +/^\s*#/ { next; }
> > > +NF == 0 { next; }
> > > +
> > > +# 1.2.1	D API 1.2.1 Solaris Express 4/06
> > 
> > Solaris Express?  Is this a vestigial comment?

Ah, I had that in there for my own purposes when writing the script.  Removed.

> > > +{
> > > +	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,2}$/) == 0) {
> > > +		print "E: Invalid version string: " $1 >"/dev/stderr";
> > > +		exit 1
> > > +	}
> > > +
> > > +	n = split($1, arr, /\./);
> > > +	if (n == 2)
> > > +		arr[3] = 0;
> > > +
> > > +	code = arr[1] * 0x1000000 + arr[2] * 0x1000 + arr[3];
> > > +	versions[code] = arr[1] " " arr[2] " " arr[3];
> > > +	next;
> > > +}
> > > +
> > > +END {
> > > +	n = asorti(versions, idx);
> > > +
> > > +	if (release) {
> > > +		$0 = versions[idx[n]];
> > > +		if ($3 == 0)
> > > +			printf "%s.%s", $1, $2;
> > > +		else
> > > +			printf "%s.%s.%s", $1, $2, $3;
> > > +
> > > +		exit(0);
> > > +	}
> > > +
> > > +	for (i = 1; i <= n; i++) {
> > > +		$0 = versions[idx[i]];
> > > +		if ($3 == 0)
> > > +			printf "#define DT_VERS_%d_%d\tDT_VERSION_NUMBER(%d, %d, 0)\n",\
> > > +			       $1, $2, $1, $2;
> > > +		else
> > > +			printf "#define DT_VERS_%d_%d_%d\tDT_VERSION_NUMBER(%d, %d, %d)\n",\
> > > +			       $1, $2, $3, $1, $2, $3;
> > > +	}
> > > +
> > > +	print "\n#define DTRACE_VERSIONS { \\";
> > > +	for (i = 1; i <= n; i++) {
> > > +		$0 = versions[idx[i]];
> > > +		if ($3 == 0)
> > > +			printf "\t\tDT_VERS_%d_%d, \\\n", $1, $2, $1, $2;
> > > +		else
> > > +			printf "\t\tDT_VERS_%d_%d_%d, \\\n", $1, $2, $3, $1, $2, $3;
> > > +	}
> > > +	print "}";
> > > +
> > > +	if ($3 == 0) {
> > > +		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d\n", $1, $2;
> > > +		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d\"\n", $1, $2;
> > > +	} else {
> > > +		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d_%d\n", $1, $2, $3;
> > > +		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d.%d\"\n", $1, $2, $3;
> > > +	}
> > > +}
> > > diff --git a/libdtrace/versions.list b/libdtrace/versions.list
> > > new file mode 100644
> > > index 000000000..8986d2007
> > > --- /dev/null
> > > +++ b/libdtrace/versions.list
> > > @@ -0,0 +1,67 @@
> > > +#
> > > +# Oracle Linux DTrace.
> > > +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > > +# http://oss.oracle.com/licenses/upl.
> > > +#
> > > +
> > > +#
> > > +# Version definitions
> > > +#
> > > +# These definitions are used to generate dt_versions_defs.h.
> > > +#
> > > +# The generated file contains:
> > > +#  - DT_VERS_* defines that are used in identifier tables to fill in the
> > > +#    version fields associated with each identifier.
> > > +#
> > > +#  - DTRACE_VERSIONS which is used in dt_versions.c to populate the array of
> > > +#    valid DTrace versions
> > > +#
> > > +#  - DT_VERS_LATEST which has the value of the most recent DT_VERS_* define
> > > +#
> > > +#  - DT_VERS_STRING which provides a string representation of the most recent
> > > +#    DTrace version
> > > +#
> > > +# Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
> > > +# explanation of these DTrace features and their values.
> > > +#
> > > +# NOTE: Although the DTrace versioning scheme supports the labeling and
> > > +#       introduction of incompatible changes (e.g. dropping an interface in a
> > > +#       major release), the libdtrace code does not currently support this.
> > > +#       All versions are assumed to strictly inherit from one another.  If
> > > +#       we ever need to provide divergent interfaces, this will need work.
> > > +#
> > > +# The version number should be increased for every customer visible release
> > > +# of DTrace.
> > > +#  - The major number should be incremented when a fundamental change has been
> > > +#    made that would affect all consumers, and would reflect sweeping changes
> > > +#    to DTrace or the D language.
> > > +#  - The minor number should be incremented when a change is introduced that
> > > +#    could break scripts that had previously worked; for example, adding a new
> > > +#    built-in variable could break a script which was already using that
> > > +#    identifier.
> > > +#  - The micro number should be changed when introducing functionality changes
> > > +#    or major bug fixes that do not affect backward compatibility -- this is
> > > +#    merely to make capabilities easily determined from the version number.
> > > +#    Minor bugs do not require any modification to the version number.
> > > +#
> > > +
> > > +# Ver	Description
> > > +1.0	D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS
> > > +1.1	D API 1.1.0 Solaris Express 6/05
> > > +1.2	D API 1.2.0 Solaris 10 Update 1
> > > +1.2.1	D API 1.2.1 Solaris Express 4/06
> > > +1.2.2	D API 1.2.2 Solaris Express 6/06
> > > +1.3	D API 1.3 Solaris Express 10/06
> > > +1.4	D API 1.4 Solaris Express 2/07
> > > +1.4.1	D API 1.4.1 Solaris Express 4/07
> > > +1.5	D API 1.5 Solaris Express 7/07
> > > +1.6	D API 1.6
> > > +1.6.1	D API 1.6.1
> > > +1.6.2	D API 1.6.2
> > > +1.6.3	D API 1.6.3
> > > +1.6.4	D API 1.6.4
> > > +2.0	D API 2.0 Linux (BPF)
> > > +2.0.1	D API 2.0.1 Linux (BPF)
> > > +2.0.2	D API 2.0.2 Linux (BPF)
> > > +2.0.3	D API 2.0.3 Linux (BPF)

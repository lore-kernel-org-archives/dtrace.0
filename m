Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253F12F3E
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 05:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736485666; cv=fail; b=UPgAqsEyjuS+Xi3kTyLMSm9USXBiZmzcuC+a41NbgqjYaV90A40F1wRKtdJY75W7XGUaAUpG2wyKzo14eBWpNGCr9QfzobYfzD/ZcRtEUTGnd3/Yrz/O330fu+BmU6XDSK+q6o/IvpdV8D8ampRiGlYj0PpIFKaBupinzsxRJBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736485666; c=relaxed/simple;
	bh=o2aZWqT3I39XpSo+UWB4+WgfCtbd1ifLig+5QGwIvSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MzEWucrBIfXeeP80JI+zTDmZgeOTyfA4MAFR+ueVWc18NrIma6qSDsiXuk/30P3zLJmGOvu3otRyVxZaVsZhGM18+cPLlQSP03ot5jdnu+aiTgqNxqj1ZPMoi4gWufctXBMlt5zgq6jumXefNqs+LkDYiWWd9IswchCm2iiNJtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mAMEWlga; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NF+k6YMS reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mAMEWlga";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NF+k6YMS"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509NfrZS020699
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 05:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=IbJM3DSBWhx3zjhzAL5HWZMIj9N3A0qPY2fJ45ROYYY=; b=
	mAMEWlgapXo0GPDpQ5zJLVpeXRbk1S+X12XCe54Y2fSDBJAaJzcgLjXup/UMFIGh
	zW/zplbgAJ0luTs5wrlJ14YNxyK1KoADjoPiZ7VIlghV/cQxFXaDnAzPkgQ4AL7Q
	4BaRYSHI/fGzlLxzQPI+DczfNX7tuTQo/nUkDDWovOBchUPAmFN0Ujn88WChVMz+
	HGER1YUCST/vBb5YPqyFHuxgtdI+9Kmk0QgP70rsistPEl80/pKc93Vfti0q+G8r
	jjhroz3pM697BHcLoCf69J3c/31USSKeuH1BWz3lS5q24+GD5gu3Y7qVcMYtIptW
	SlU+CRFGhYIgjlcSC6I+nQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442my60ppx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 05:07:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50A4k8oW011115
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 05:07:41 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuebu731-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 05:07:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2lpihaQyzjuQNU4zJIJmmz6fGFggYfDLDE1XOqQuvTbCv1kPyk9oGW5DvDrU31h2WDOKT1B3bJKDoUuCL5r3e1oxTUoYJ+Y4px0eA1ISWBiYXVoSWQiEc/j/+5Tcxwtk8RygJ9qucYbLsm1/pTxrne5sQACOLfLJ4hBvIvG3EviUDWzjnYxKxmRLyBNiwTnYIGq3PyoPq+H4KqcLnER7D3i4yv+S88ZZIhgO2ZOyzE5uUS/ObUWzEDKWgPFomXK+cgAsljfL8fhvfomLCx23yuXSB/7tI2HWBShXeiiQQC1oyA4WMf4IwfaueDGQWzmQS8R/arAjoozWkpoNTFKLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67eMZKsWZs1p2UgbrqKax+kRvk6lIOScnlaIuCmj6uc=;
 b=WKebJLVVWXvACvsyeHhuUx/GVs0rpOgC/88BsxdGsyCjNDr+7ZQVwwh0M/mi629hqETk4s2FqWPJiJPwHQd8Qk4eiM6gvfyoC0PNCydTjFKAngKhxtViEfOo2ztR5oES3rnwSdvIYyManbyjMITNtjF6OvMs2dt2OUJ44vITFO6XLQE7N10LXSZUgbyenACKKES4Qc6GiZQyHQFbBZPnO4rpqwqEaM+Dg/sC+hXJxSUP6zIK0uYvKbjdBAJHAz7Uq0UK9q/Q21JeIFSc330lvOh9FIoULQtaYt1lQPmfGTbagv3JCFdQ5jx0QUw66VTICP+AfxPNfHKZSHFTCtNM1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67eMZKsWZs1p2UgbrqKax+kRvk6lIOScnlaIuCmj6uc=;
 b=NF+k6YMS43kFg2qfiNRoWxeXdq3iMworZgLFmyknLIWPgQyddhpCNvcvBgZSbugX4XN9gvR/Rn7JkmbxgqHEpGUyvkn5pJKDMuxLy25R0lZ14Hgl1XAjNVBt4efKCJCP12s2VA7ruCw3Mug0gwYwomTRSRVYtdC19f2U6MbNfTw=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA6PR10MB8111.namprd10.prod.outlook.com (2603:10b6:806:446::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 05:07:39 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 05:07:39 +0000
Date: Fri, 10 Jan 2025 00:07:36 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 6/6] Add support for pid function "-" with
 absolute offset
Message-ID: <Z4CrGJ8Muw1qXDf1@oracle.com>
References: <20241220222716.18511-1-eugene.loh@oracle.com>
 <20241220222716.18511-6-eugene.loh@oracle.com>
 <Z4Afgp96zlq1g5Jf@oracle.com>
 <68af528d-8dbd-f081-835a-d92b42e3045e@oracle.com>
 <17bc480b-3785-7b7e-9df9-601d65038df8@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17bc480b-3785-7b7e-9df9-601d65038df8@oracle.com>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA6PR10MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 856b7b63-e4bf-48a0-b9fe-08dd3134b4a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?sQJjSgKTU2V9YmHwgsmqO68TdNXoARiPao8pLl1W/Cyu4RqTJ/XF25fkH8?=
 =?iso-8859-1?Q?/0vYu9orkUG2urr8jJ5gfjlm6Av/9vuYvypNXmtQwQ4GkSKWP+NlaiTspF?=
 =?iso-8859-1?Q?N9LYFDDW0BvHuVH0LI7073OqWe/wSV4breBVadHdu8FPjoH1VVj3n6eD86?=
 =?iso-8859-1?Q?Cm2+LpCdIpI1kXGYR6uYFtkWZg2ZhjOWinUFbzcMI5LXvFUVMLqkcdu/ob?=
 =?iso-8859-1?Q?hjlLiP1oa2uu7nRDsTRj4w91/vCoGfDXeMHnlZO4D0rb5RSu1VtdYmS+IK?=
 =?iso-8859-1?Q?JGFhhqpRQgPe8mXLdMH0hSkY9u/eApch013xbLFPXhU7815D4AhnTUhwEj?=
 =?iso-8859-1?Q?asisx9IGtDW88M6Io+fauN8W71i/eLrlOkK3wLEIVu81YBCD7iexc+JxFm?=
 =?iso-8859-1?Q?nDpUQx1S2C+mzE1u0iyrHCVobqdTmTdOvulvGedg1CKqYm6bR7c3i2sdqF?=
 =?iso-8859-1?Q?MgRjWZpW1veL7VtjDaJfdWkfkBt6t+FQVNuN3RkIMwTCrCG+2cFkdFB9fs?=
 =?iso-8859-1?Q?BnGUUbRQck+BEw2uLCozpekVrAUvSNXqkb27q8MVZPwKfyx8McasTcnoEO?=
 =?iso-8859-1?Q?+IE77rqX+VFsw/vJs+biHHcqcCl8Ax7poBJlN8V3TGBPQOGKu3F8wIcF8T?=
 =?iso-8859-1?Q?erGrgSuiR0HzEhDymcY7LzJzuQMYdhThK8qhCGCmofaAwhT06xQOCe5nue?=
 =?iso-8859-1?Q?51l8Q+sribSV3IdPIqlRRP9bIWd+McvfXqrFxcAhjFQo3Q0K8r2kmw/1Wz?=
 =?iso-8859-1?Q?YzZ/JFXBvny4YUqueF0qF43KZ7M1G1mkp/F6LgGb+ZikM0je4O9ksLYK+P?=
 =?iso-8859-1?Q?ZylypUnf4jJbbaHioosQRhWCrdFXrR2u5g66L/fPkEAxq4d6JBDCNVPPpx?=
 =?iso-8859-1?Q?tGylwKCLMgznPeo9KC/Iyrxz7e0kupxE+roPq63FDav0MhC9KkVoh3Vbei?=
 =?iso-8859-1?Q?jAnt8gg0yw2FS/cr1x3zCnZRLw40zupcwYpfv6MAchB7+o94YcMO88GNlh?=
 =?iso-8859-1?Q?6PTJi5sprtkClDNtq8dMNgO7RS0x44cytUCctecvLRHYlW33Kk98B+1bV8?=
 =?iso-8859-1?Q?frId7vFIs/LdnsTmNP7daC1enwFoAoUYKam7UojzsZeRhxgSL3zS4erBuv?=
 =?iso-8859-1?Q?rCIRhNNrnIcwoTutAeru9HhMv+uxCgBAXN/9cxLw4POrbx/3MdDPLAS+37?=
 =?iso-8859-1?Q?t7AtypJ7Syj9Xqv4j7V87GeAP3718l1yKm3r4yVK6pXHmiBkAQ+eYl3JBU?=
 =?iso-8859-1?Q?MmhuE3M7gUb2zy3GTb9z9BblL8Lvazl25viRNcg7CMwIujCXDSatrYt81A?=
 =?iso-8859-1?Q?gX2I70ht9VIAWPQtW5fZDjKCz/KGrLgyd14jAXYOUpUQXWNKno4v6MnVJo?=
 =?iso-8859-1?Q?oDklQeIjvLYQD4+SD5ukKDaOjfOsVw/csSV9YpXqDi/ZpmSu/yqoCds5Fm?=
 =?iso-8859-1?Q?7z68XYNiRx3mS/Ry?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?hNIyYMxX5BoOsAG1zR6VKR2CECZd3Xn9Drtr1C6kPj8CwSEfZ2xGckc71Q?=
 =?iso-8859-1?Q?58+2TSFq0gbZFCkrXEvS5E3p+dgN+kc/TRhSST1uwAj/X4/Yt9auR/i8Kk?=
 =?iso-8859-1?Q?0UvDUXh+0I3sAYozaANB9KBiwI5L4gloAV8vhc5fXSIIVMujB+SQ2bT6e9?=
 =?iso-8859-1?Q?+BHIBoKljVpiGstmHEPInLYOA8BkdxZOq11qlry++vSchpmOviUvL+BxO3?=
 =?iso-8859-1?Q?HxGlLyykBb2zod58ydlTIlRTECfTuaRhaOWLRfzQJXMRDWnJi8g6g9PA26?=
 =?iso-8859-1?Q?r9D4IgeXajKuVxaRdFzphhCvrDpMM9Sk8outSM/hjA5IA5Inltf2OteT7H?=
 =?iso-8859-1?Q?z9qnV1yvofPfqT/Bgc5zuULyddym2dJvGcni7vgeo8vjJ+V5NUn08kD/5U?=
 =?iso-8859-1?Q?IH1+CGA+HLTfg4PFAIqzVmeYQLvgfRNCQZ+H+EQq8CWqoziHSsV2rmZBTS?=
 =?iso-8859-1?Q?MrhMhE/IkQFgXlAWVPiQQoJt6h5zyoFkdVL25G8jhaFy5GZxZDn8k69BKG?=
 =?iso-8859-1?Q?XYUIZKDhnXNpoqEqh82b6cd9m+s1goqL0veVDwOkRCWO0pTdPpwzzTpZyl?=
 =?iso-8859-1?Q?MHkd3F9jIbl4eSs8a9fPm05gCeXpxVPhcQcNl7YYchvdBE7Yewu36RE0Bz?=
 =?iso-8859-1?Q?Z46aECw0/tO+uMggzL0ns+5Af54O6ncIHzWPcx4dkiLcUhaLer3b9JsT1W?=
 =?iso-8859-1?Q?aJe7hBsB7e3Afz1VMOtI+gQSu19eM6+5GYgCaTNageQL5NdFy2Hua0Heta?=
 =?iso-8859-1?Q?uliGKz4hQZy9clOZ9X3Qd3v2Xx/eCoZpIv5oViEY6sTGwffp/uN966zzyA?=
 =?iso-8859-1?Q?PA2E/03yoYiVS499nvbAJonjKRBv5oJVq63F3bRQSbERpzVUP2IylHy7ll?=
 =?iso-8859-1?Q?IPk9ZXhmDp4cV7lTangvsKnqvO5IpQMb8ui1SQLqBMGG0jSML2FWPHdw5+?=
 =?iso-8859-1?Q?/PSSxlTYvnBXdcp5F7IL/qH6/LCyiirPmHifl0oC7Om9pOeC3aFBQtNWFu?=
 =?iso-8859-1?Q?T8KhP4nXCwSv8YiF5G5hCaqizwiVRf1YfLcFh7R74R0DX8Ti1nDmuzNclT?=
 =?iso-8859-1?Q?k2lSN93oitcuK3PzHEfpVYuQJB6whz8b3vplE1skxDjiUrmIGV+m8289qG?=
 =?iso-8859-1?Q?3K81a8dVNU7q6sDUSzWbE+ABoUy9Vofsv5Jmf7nICt2H6sbOVio8iy/qgx?=
 =?iso-8859-1?Q?vuQi1j1pqP8c6arAAXL2kPsMITwEnbJPPrmr8qmOW6icxYS9CC+02lfMEE?=
 =?iso-8859-1?Q?UbQR73TZ3BJTcz/ZsqmpWAoKCvP1EX1E5ck/LjlPwSWSYk1vx40GbkGPdT?=
 =?iso-8859-1?Q?fBacJcC7EM2YWrtGjzTT257J1wVWGl/SqljBch2TuWXowbQR6MgiHhglYo?=
 =?iso-8859-1?Q?0SLwpDDUrIEowA4LhqwkDFzuyocURPNioN/LXvlFze2Et1dt6xgaDosdNx?=
 =?iso-8859-1?Q?bo9VwMSzS/Yrvto8Qu3FaWX/fTySpyoz0LXBYsr/hrhTCpfUjyzcpWQBs8?=
 =?iso-8859-1?Q?hzIwiT8dkZAn8Oxw0V+lw/0LAXcwtAHGYtAfNlvFwHe1Vx+8YlubnnIJ/n?=
 =?iso-8859-1?Q?lTyX70G2eh3lhYZuuvYu2CDkZ2ZH+gAcUTVcuxtTgLx/lCRTzAQLN/u+HH?=
 =?iso-8859-1?Q?W+HBAGytz0qn5WvaHcpI/VLgn3eBDMQSaET0uZ34SHIVEfUPYEb3gSoA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qPGw20GVjRQ44VnVZD7VT3mFB967lBMLpqEjmahoISzXFO4uSvtIN+O87gkmrqFi1i1+KlRQgbEYHhpifNhPZ5cmpMgUExV9OBITnVMw11kUFtNeIQL3SR+a5vRHypRJnJTQvheETAVjMS4sHw6I2LO+gruSOjPWUKCEtPNHEsISmu68JmVYtjAvoE24Bqj3joWmVx6oDoUGWdmcAhkIdfEEnxDtFgi+r4SW0IwrUHMvCIOPd3hvD3JlDh8B2t7c4T81RhJb0WUp3h629g26fGPVsGfWxYamWxo5spwadXIPfK+pDt49R1RqhCud73Kv0F7DNSmQcv/mWEU+FGHZGHKgoH4r6oWGmX0PZey20LQQG8ZvmUWfxCZBEDXSM8IJQYd6UOxwAlunN4C4fPaf+3lGMiuoo5Q2tG0I6likZBA+7sVf9pEIPiou2Xo+/kqjk3TpMSwpeP4VToXQ+O9taDhIUlc85+WjYTLUIeyO/thtz7Xj3vgi0AWs/a+IhOr0AS7xM1dpsNiFB6YdyYzGrmLIrtijvBB+PTUpw79lz8LUQ/G6ilEEJwNnqCPbV6cBcoK/HsDbGyeCukbYkQSyGgtiVK3T17ajaKUkdEdxONU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856b7b63-e4bf-48a0-b9fe-08dd3134b4a6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 05:07:39.6578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptoaXCd8NQ+Neiqm+nxQX/bRNQsA4KIpE+3X42I076c4y1pydc5POIPRR8++h9ChQwiCGpwKRR4yORO3ThlNKAIuiYag3/0drqbUCS0ys5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_01,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501100040
X-Proofpoint-GUID: voDh-N78EH-EJQYYOO9z6KQ016iH_RsK
X-Proofpoint-ORIG-GUID: voDh-N78EH-EJQYYOO9z6KQ016iH_RsK

On Thu, Jan 09, 2025 at 04:00:42PM -0500, Eugene Loh wrote:
> On 1/9/25 15:52, Eugene Loh wrote:
> 
> > On 1/9/25 14:12, Kris Van Hees wrote:
> > 
> > > On Fri, Dec 20, 2024 at 05:27:16PM -0500, eugene.loh--- via
> > > DTrace-devel wrote:
> > > > diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> > > > @@ -47,6 +47,7 @@ typedef struct pid_probespec {
> > > >       /*
> > > >        * Fields below this point do not apply to underlying probes.
> > > >        */
> > > > +    int pps_absoff;                /* use "-" for overlying
> > > > probe function */
> > > Why use this?  All you do with it is record that func is "-", and
> > > then later
> > > in the pid provider, you actually use that to force the function
> > > name in the
> > > probe description to be "-".  But that function name in the probe
> > > desc is (in
> > > the pid provider) already coming from pps_fun, and the code was already
> > > assigning func to pps_fun, so it would be "-" anyway.  So the
> > > pps_absoff seems
> > > to serve no purpose, and you could just rely on pps_fun being "-"
> > > when needed.
> > 
> > Yeah, good point.  Let me see if I can remember/understand/explain
> > what's going on here.
> > 
> > In essence, the problem is we have to pass two function names: "-" (for
> > the overlying probe) and the actual function name (for the underlying
> > probe);  up until now, they were both the same.  I tossed around
> > different ideas for this.  E.g., pass two function names in. Or, get the
> > actual function name inside dt_prov_uprobe. It seemed to make most sense
> > (given the alternatives) to pass in the actual function name and add
> > this flag to say when the overlying probe's function name should be
> > "-".  Does that make sense?
> > 
> > Note that pps_fun is not "-".  Although we set it to func ("-"), the
> > code that processes this case then fills pps_fun in with the actual
> > function name.  Again, one option is not to do this until
> > dt_prov_uprobe.c, but that introduces some other hassles.

Ok, I see what you mean...  because we rely on underlying probes, we need to
track the function name that the absolute offset falls in in order to be able
to determine the underlying uprobe that the PID probe maps onto (especially
since there might be another probe on it already).

However, as far as I can see there is not really any need to have a function
name on the underlying probe.  After all, it is actually a uprobe that is
identified by dev/inode/offset where offset is an offset into the mapping at
dev/inode, i.e. not relative to any particular function at all.  So, not
having the function name associated with the underlying probe would make more
sense than what we are doing now.

And if we drop the function name from the underlying probe, we suddenly no
longer need to carry it across for absolute offset probe, and this entire
two-function name thing goes away.

> Hmm.  Having said all that, maybe another (better?!) way of solving this
> problem is to add another probe type to pid_probetype_t.  Maybe
> DTPPT_ABSOFFSETS.  After all, we already have this problem of a "special"
> name for the overlying probe while requiring the "real" name for the
> underlying probe:  we have that problem for probe names.  There, we solve
> the problem by checking the pid_probetype_t.  So maybe that same approach
> should be used here, for probe function.
> 
> Let me know.  If you agree/prefer, I can revise the patch.
> 
> > 
> > > >       pid_t pps_pid;                /* task PID */
> > > >       uint64_t pps_nameoff;            /* offset to use for name */
> > > >   } pid_probespec_t;
> > > > diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> > > > @@ -182,8 +181,50 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const
> > > > GElf_Sym *symp, const char *func)
> > > >       psp->pps_fun = (char *) func;
> > > >       psp->pps_nameoff = 0;
> > > >       psp->pps_off = symp->st_value - pp->dpp_vaddr;
> > > > +    psp->pps_absoff = 0;
> > > >   -    if (!isdash && gmatch("return", pp->dpp_name)) {
> > > > +    /*
> > > > +     * The special function "-" means the probe name is an absolute
> > > > +     * virtual address.
> > > > +     */
> > > > +    if (strcmp("-", func) == 0) {
> > > > +        char *end;
> > > > +        GElf_Sym sym;
> > > > +
> > > > +        off = strtoull(pp->dpp_name, &end, 16);
> > > > +
> > > > +        psp->pps_absoff = 1;
> > > > +        psp->pps_nameoff = off;
> > > > +
> > > > +        if (dt_Plookup_by_addr(dtp, pid, off, (const char
> > > > **)&psp->pps_fun, &sym)) {
> > > > +            rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
> > > > +                 "failed to lookup 0x%lx in module '%s'", off,
> > > > pp->dpp_mod);
> > > > +            if (psp->pps_fun != func && psp->pps_fun != NULL)
> > > > +                free(psp->pps_fun);
> > > > +            goto out;
> > > > +        }
> > > > +
> > > > +        psp->pps_prb = (char*)pp->dpp_name;  // make sure
> > > > dt_prov_uprobe uses it
> > > > +        psp->pps_off = off - sym.st_value;   // make sure
> > > > dt_prov_uprobe uses it // dump this
> > > > +        psp->pps_off = off - pp->dpp_vaddr;  // make sure
> > > > dt_prov_uprobe uses it
> > > > +
> > > > +        if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp,
> > > > DTPPT_OFFSETS) < 0)
> > > > +            rc = dt_pid_error(dtp, pcb, dpr, D_PROC_CREATEFAIL,
> > > > +                "failed to create probes at '%s+0x%llx': %s",
> > > > +                func, (unsigned long long)off,
> > > > dtrace_errmsg(dtp, dtrace_errno(dtp)));
> > > > +        else
> > > > +            pp->dpp_nmatches++;
> > > > +        free(psp->pps_fun);
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    if (gmatch("return", pp->dpp_name)) {
> > > >           if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp,
> > > > DTPPT_RETURN) < 0) {
> > > >               rc = dt_pid_error(
> > > >                   dtp, pcb, dpr, D_PROC_CREATEFAIL,
> > > > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > > > index acf1c914f..ae4b262ac 100644
> > > > --- a/libdtrace/dt_prov_uprobe.c
> > > > +++ b/libdtrace/dt_prov_uprobe.c
> > > > @@ -735,7 +735,7 @@ static int provide_probe(dtrace_hdl_t *dtp,
> > > > const pid_probespec_t *psp,
> > > >       pd.id = DTRACE_IDNONE;
> > > >       pd.prv = prv;
> > > >       pd.mod = psp->pps_mod;
> > > > -    pd.fun = psp->pps_fun;
> > > > +    pd.fun = psp->pps_absoff ? "-" : psp->pps_fun;
> > > >       pd.prb = prb;
> > > >         /* Get (or create) the provider for the PID of the probe. */

Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6385F281368
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 20:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766177577; cv=fail; b=Fm1YmPEUETD2XlkDGyHgROKS3io9VUz6x9zEOV08NpQxwjqNWBuZPZezVxNs3/pHgNciGJZcpEfCPRScNsSOHTbsOTcpw5FSv7Hq99pO3EpDgIie9hJbHqImZriP3K8EVMGdPZaRoD96fQKHE2kbsbGOEyiEKG0eZdi9NURFbnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766177577; c=relaxed/simple;
	bh=9gwvPRqM7rmIxlg90Uc/BajI26MOHPF7SYUaCBSgjBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k2ObTb+URl5OLVQl7h3D1TjoxyZzaNeMfjwRxuWUoSoH4nO7oFzduf5eRx6R768xlOgTf0Zsvt3AhpuqDQPG8yhYnDhMkFbrcg2IPD9JCaW5I0gHE0DvZqBxym91WNF1Lr0tYTd+YvfxVX7WeTRQotfdyugf8aLPqItGI5fifwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k9OHjdJo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IcXmqzm+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k9OHjdJo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IcXmqzm+"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJJCHnr229116
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 20:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=xQ5daC3i/ZCiGmPsd8
	GAXU1EX7ihz9RjVyM8VQ2TJLs=; b=k9OHjdJoThsIHGh09Sj6yF52GMUKrEQ/Pd
	xCpYsIK60mIH4EAJOhdBmkkXv+30zjoojp/S3h1xPOocVrIpeY1NN9FtcG60wXD9
	5NZFz8cVpRO/D23mFHp0/0jMLfTqvC3VTRMBUMiaf1ZpiCRJYBPz9J22HFRRkzFa
	ASA8A9Aew66oz+/xT54x5KNivaJuHk6gsqmHPIbTnnU4x5SdDV4ASUZmE1X2fvT/
	sLOW4Bm+OVggR0BxeY/WsaSvRldWV0xcVtqBuQYHEilJW8/qCvVQ5gRQsZT2Wwoo
	a8UTJSs8cnzMe8g//4K6ZAgZ+Fi2/3QlSUWHaA2V6KHP46qA9Q/Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2chrmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 20:52:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJJFKo4023894
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 20:52:53 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012040.outbound.protection.outlook.com [52.101.53.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qteqx81-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 20:52:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwSB93Ib1pm3+yN0UgP6kleLGuYSSScujOmYnOTUuebHXqkkbVVZVaLEt3KC/4KTRFPp8wXiak8TQ+NGBlinlXFI83NPnD1Fre7jL10GQu9onPg4iKe9W1eT0tTMoq9/LwKWJoM+PMIvY96BFV1zSlzT9lybXnIRBfLp9oh1wmMbRvRsU/hMRrrOLVv5Y9ZOTOnFTAzFxmqBiv+3LqZY5cTbrF3yW/rfoj4K+1VWj/okmOVlsZul8whM65RK7gkyiu7KL+Dr2gg0M7aM2BEtNyu1PKJo8R1LDllc3u/moDq1+Y/JxpxilWxEOs9AA7Pdwf4aRo5Pvwcb/J3AEgNJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQ5daC3i/ZCiGmPsd8GAXU1EX7ihz9RjVyM8VQ2TJLs=;
 b=H18FxoXFWopwAXQZ5ZhmWkM8VibniBaSN5Lh7Cxvt6Dm1SMYXPtwFfPZN/uV2Pr7d+qK13GGgng0YKASI6LXiLGIhJ9dMGlDBmjL/hDwJFJGQlNP29LWbyRW+gpuWCuqV5nMuWWiUFWruZR1s51fWYOGaaL7NM9mC4DvmOBqVwA+luf1cr44dAOvMkEv3uKTba1fZvs/Boh4QZJCU+O37FsIFnNyapl8D+zkSM+nzrI4gXClajS8+dXcjVnDwmWBXOn8YZqip/Q0JzDXyCQ/8+xkoouw3y6EpstkvGfSwPZmgPOHoJr05hi0RyNHeiBvy4v5x1qnYGb7HBomCPnekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ5daC3i/ZCiGmPsd8GAXU1EX7ihz9RjVyM8VQ2TJLs=;
 b=IcXmqzm+BKGD5HrLmTOvbg5Lz5pf61K+HVMso4YM3Fh2owl6PaoYTEyBh2odnF+c1Dri0rWmebyy0uv7Db3UlOrrs4at45HxG+EfvMKqdz7UC1/7RfZRr/bWFm0OrMpwdmWDIclPWDLp/rsz58ZPXXw7heYzivhtpRmiogRMQX4=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH8PR10MB6411.namprd10.prod.outlook.com (2603:10b6:510:1c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 20:52:49 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 20:52:49 +0000
Date: Fri, 19 Dec 2025 15:52:46 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 3/3] doc: Clean up list of unimplemented functions
Message-ID: <aUW7Ht8zDQ9H9HWc@oracle.com>
References: <20251219173636.16078-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219173636.16078-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH8PR10MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: 366f6b82-3668-4d36-342b-08de3f4091e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CoDJeDPl65Ar+Q1u5Pw7K0o4fpnd50xlxQ5Tp1cDQIcuYPcNNlW5naU8bRGg?=
 =?us-ascii?Q?V2h+u0nhA51UOu9KZsVuiujcavKN/NdaJ/lKlsCM3NKB3RW9qnPI7GYSIk/m?=
 =?us-ascii?Q?Al3PbfXfp4BO1fiEtSsikexe1oRKt0ghwRSVUr19O0b/j0nsw5v/qwn44uIJ?=
 =?us-ascii?Q?to+DbXEARa6anJBLYZ3Twy92Kk+2x7VCWhPeTBuGW2YvGku5T5+u2uvtqhL0?=
 =?us-ascii?Q?1AOCOGYAsVFeR7D5VXko1ZZ26HgYhHSf+MkUo3YpnP8vt9yKuxvVeXrG4e5T?=
 =?us-ascii?Q?IheTeqJfgxBOyn6HwF0DxR2h9J+QE7cMgEvv7XZ3pW+DdMD8zSVV+aDpfRh1?=
 =?us-ascii?Q?sF166E6dnE0meqapjJx6L3pRsy5VETseT/3+u5IIO+sl5c+pmUd3qU7mQCEl?=
 =?us-ascii?Q?+MAlKFI5SyqPp7TjNlwUrgrqgRlIbK6YoaPAmBnux+cqYzHe8BT0s9vCQxL6?=
 =?us-ascii?Q?Da2fg0jz6CKDAbUMLaIwKvL8XI73dKYY77HcEznkMK6opSWgzEiwl3g9ueFQ?=
 =?us-ascii?Q?qeIcO469kLA0VPpk0jHdmBOdfNmfFvjNM93WQ/BOmO1+kjGIHtsSFGzvUtxq?=
 =?us-ascii?Q?iEyu8Uve8V8GuaVe9/N/u4JJP0tdT7KbFxZOniOcNVLgyCaYljvpn3KL8rKw?=
 =?us-ascii?Q?yPUwps1Ie+zkChZdJns6IsuGL+/j1sueHxOaMJOWLZP8YuOQnPmcbVDWhGMY?=
 =?us-ascii?Q?bEJf55OxK8TuSJvLETjXbBSl/PIea+j8Ucdd64QC3r7pSdComSSa5KSPElkv?=
 =?us-ascii?Q?ctKFgkAioAS+aZxNHsHED9pGdWznyPGj0RXt0vM4LXR9ew3XitDwHe3SQeIJ?=
 =?us-ascii?Q?6rgELgldPuFG4M5AWlVgxipwC6E8I/fMO+RQ1cqJqdhgX6MBQ0vmNcw9ZB8C?=
 =?us-ascii?Q?ipklVK3zUSbkATvI3ewSmNgqWa1KNpO2UGrfgeAE81gJM4+1p/DoBxKU01f1?=
 =?us-ascii?Q?z2XKMNr+94cbjKPCCiSS8ATdTtx6kLER0oH7oU1RWxQKoHIFp3MSBd83Yp4K?=
 =?us-ascii?Q?YCQIT4iJ/JD72gJ6m1lXmXPpVeC3vHERs96uq4MrofZjXhfeGYxmTyOSTXz9?=
 =?us-ascii?Q?YpCnjk2spCqHLSB6w2HcS77DLIENnp76VPobv5wJidZaSupdU4Nrik8M+xtv?=
 =?us-ascii?Q?VI7JHK+1VLBpTX+GaHAwxmJib2H4PmCyHmMfY2PlFmcid6JbMZ0R5F2+yLdG?=
 =?us-ascii?Q?jwppYcSX7mEwxcwtOWaLNIGJ0gDvdzYU7a+OTXGzXkthB/T08QO1AqsQe9Gl?=
 =?us-ascii?Q?EdGTIm/RhS5le90HbA9oht1S3spG2v0VyAGTvAaaiNTa3126CK5ch6v+VyNv?=
 =?us-ascii?Q?UoCz1GUZTeKfnNGUceKG7brFc4CeeWbMM9TDg2tcyBcOQlnZLiRDJqP4kxrA?=
 =?us-ascii?Q?kpTTenTrN5MAaIFo+BBmE1JJF2FL9r2yQTZTHEgBZk4lGdq5fsu5sV2F/Ktf?=
 =?us-ascii?Q?QuN2u4v4cz8f2fwChiLPN53NHk/cXlij?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B1tUq0398Byym3COmV64wDV2JEVrIgG8+EyYP6GSqa2ualhY8NEDKY+2uixC?=
 =?us-ascii?Q?6RfV9rqfryT/Rut1WepIrU69HWa105HUO/1JxyL55hjrNIUfykK1MqIYHWJO?=
 =?us-ascii?Q?Pbi96LigM0USiznn0eS8PmMGRzGkqBzeHx5I+yYZgY9a71Y/wTU0+69QQ6SC?=
 =?us-ascii?Q?cG386yUvx2s05vY1HnIE01+EDP46W2LN/LU9S5z5quSS832dUILf1y9t6JHQ?=
 =?us-ascii?Q?SE45k+nM0uPVjmJtK/rl4a3uZm0qoRvA60K02rlIs2dF2r50WZrGqOSK2djL?=
 =?us-ascii?Q?m7u4obqea3kW2zT5eaQIhqn/c3wJ3oKyRf+7P7kJlFNq6KJwBmsmn7/NPp34?=
 =?us-ascii?Q?AwuOuoGRf7KXd1Y94pbcoK700fpI6+1S3yWWlFkl+BvBZ3E1JA/XLYgXsg7x?=
 =?us-ascii?Q?73KbDyvWIybJSk5NaD7eX8hba60iNssFQpqoodjS/a1Xxe+QAhhn/ETtMH+6?=
 =?us-ascii?Q?d7oLFaBU5ePAlfkjOj1KzcZbMAtTa8yiYzccSIX/KqfJ1tiLoTFFW/lf4Gvg?=
 =?us-ascii?Q?RBXFtpEaA/quMUHoRH7wHuLSYJ7YgaTntsxs07n1QQxU2GQ4UipBPIBr68ec?=
 =?us-ascii?Q?P/gDUEibWJChqBUHKKTivyiTmOEw13s6Vb1p0GEit7MYZRyFQqXei0pfG3lx?=
 =?us-ascii?Q?G2MHo+gPDBh2m/4xryMtptNPCiJCUc8qXArr/zY257xgq4629jGunP4MfQ+k?=
 =?us-ascii?Q?ZxWHfjX19Fu0rhspo2MDm0O7mPly90BmeJO9C9V+iLOWRKFm4UIAg0xLNy54?=
 =?us-ascii?Q?4g8jYE5ZjO6uN0OOxpXDOcj87de5mD7pbvVM7y1owe5o5U9QeO6pOlTGPKLO?=
 =?us-ascii?Q?uzxVz1lqKvLYPE/wtsaBvm1asXbjiPPXOfwwX9nAXik+GP40kXnraXmh9HBS?=
 =?us-ascii?Q?rGtCjoVdYs42Tau8DSZjpOonFdMAROAyDaBt1uh1zOOwRMYwII40RHU8Yrhf?=
 =?us-ascii?Q?CgSKMHyipLXswO9JW0lMMsEZjUxRXg4uTOh4QQgN0v/D8rcmlghgu+S61nmL?=
 =?us-ascii?Q?LC6TJxdBPm3Q+XaxVBwPh49+4eRYLODmN5KPKqNb7GENf+60zMwx6MS99XTR?=
 =?us-ascii?Q?ASrUnUbQimW5XbqpKTLpA2RUkOau+AzODjNyGJrwOS3GtmLkEJiqemN1lcyN?=
 =?us-ascii?Q?9uBmv5tRytA+72mrDRLn+hhN20cG8iRvxavOQPY2qIR5E9njcs5HF3VjfK+Y?=
 =?us-ascii?Q?bdz/cUmlPrULLUr2swPhQtvNgY4cXhZOZFkDrVliLKC92JfdiqIo5zG30hab?=
 =?us-ascii?Q?LE7MEMYiLCZhX2qTiIJX1tpCANtVnRtCX9cnJuFw0ZSsguLGfHNLuyKHYBwN?=
 =?us-ascii?Q?JniKNgTqVmxXocbyAqFHnR7TCH8zcqBI/8XGGvPGPqJGXjIcOqH0aQIGphOy?=
 =?us-ascii?Q?0j9RaUnz7XA/XlUOIaxWzXnAZFoqCtoknAwkQKGPuy7rBrsp3D6K4V6k3yHX?=
 =?us-ascii?Q?SzEVFHuSmxHoLdkSpym5T7l8/8lHzaTb1NpUu6Su1sTOSeU64RQ5fazJKDcq?=
 =?us-ascii?Q?Z18h7htoTaRSAK843lOW7gYmGBriwR7ZmFac4zGqStRwspXjoBAQ7K5tkjGk?=
 =?us-ascii?Q?qQCVDYjpMLspfN6/PQG9SmbihnLbk+lXgE/vaHbdlLwG2KKwrPSDvP5qPfgv?=
 =?us-ascii?Q?hOShD7pozAVI3v/p/B79hOf6eO/IXITa1snwqB2vpiUz6PzmPLACF41kFFes?=
 =?us-ascii?Q?gwUa/CH4uPQNAiSa6ogXd9aFZTy7W9Q7n2kzFp91JFWkAcrZKIhzupbQibqO?=
 =?us-ascii?Q?XmDWJQaimA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T8H2ALrXs8Or/xSttFhxvsp4or3sgIGcgCQ/0LfY+vqRCat42EXpH1SiTLVVS2xe8tBxdzeToA4/YfhpLHWCVVR4J4yipzrq5REluvf55xsklLcdZZAho5tVgvT6Wzt1TJnmf2SHzQ0pVmY71ECLV0VXv16X15vkEqRe6vqEdqI+dULSONMUlrver+is+DZvbYubdJbj3jo/NPR+Yw1fv+/Jt/3gEufdIAbM5ty76Ap7KAsn1k3JlaCgWQXy0BItkORlqCjKDPCOGNkPJpMW/To+5D9Ifluvqj2icHn0ljfZSTUmKAI1fF2OtwosueH6kv2IKgZILUab+mOYULq97Ij+HJDArkNeSE9Aaas8hQPDXmzQhu9SS8oHtxp4ccGUvbBuhigkI/ZzAt0G0OxQ7BBAc8phSKonDANtryrQ1jKLxM5mIbyodCmt9/XXeDmHSMXtEVhOB3Oc5PdLcTsHO8thXdbbKsAl5YakPw7EroHMv/OrW31H7k1hcGwAyPF1stPk5cYsIfitjpmlVSF0EmA6SAbIk08kmLDr32QmOWgPiZc6MlkGhLzDfFAOm85upCdazGzUOHJyruFsdLTNSOgytWRgT1JI5QXEycfriK0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366f6b82-3668-4d36-342b-08de3f4091e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:52:49.2916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59SxyoLxSeo5Sj7U+s2671kcV3ZG6SO5XJIrriFjfazNmzBUJyyjwgULZsZzYn8NxRBh6MYEpBT4zHZ4Ni58xlnj8qs/xnU+ty3bwQqJIM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6411
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_07,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=909
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512190175
X-Authority-Analysis: v=2.4 cv=YJmSCBGx c=1 sm=1 tr=0 ts=6945bb25 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=JrYVi1yn5T0_F3HHEI8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDE3NiBTYWx0ZWRfX5fM+ZdL2Lq5O
 5B+BrVyY9T6Xo83v3erOGf6r04wCrDY0cAHoXztSo3NIdcKCDXiFdacZ5U9HAtZyImMbiPoY+6Q
 bPYi1KIFJZgYi544XM4Qv8hQ1c0tT6YggdHXDIC2DpItX1GjfERkkbDs5MpJ7i1vJxhW8Yn3ANu
 Q4nGPBNmjCv9g57RCG/Bzw6asUNid+tW6G88jSDkzJsBxk9I+UOhqwEyvMgTmQ6snbpfhbxcq2s
 tcdI7phywce+q+fNonj5PYAkgmMtIjqJmuhWy+q8Pf5WBA+3gSganMViMksDe4nvtaVjaXL2eUz
 9iTM8wQfng2kABOlH2ENZrQ0GA0q/jV/eSmDRgaSXraWJeXrKdaZoiZ98CZSUQJjMPY45R6+ioj
 Vasd++UT1Q/wm9yNkkYfb1O1QlMuS/t9QeeAdRL4zlobzy3V6AHe464mIV/9oHZmckZPlJ+qwd9
 GRLYWli0+sA/AL9G5XA==
X-Proofpoint-ORIG-GUID: VCf60hMRM5BpLHW1B56LSvPGAXQT_0Pd
X-Proofpoint-GUID: VCf60hMRM5BpLHW1B56LSvPGAXQT_0Pd

On Fri, Dec 19, 2025 at 12:36:36PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The case of dpath is tricky.  First, it is actually called d_path() and
> it was always meant to be used internally.  Further, it is in fact
> implemented, but only as a stub that always returns "<unknown>".  Just
> remove it from this listing and remain silent on it.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  doc/userguide/reference/unimplemented_functions.md | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/doc/userguide/reference/unimplemented_functions.md b/doc/userguide/reference/unimplemented_functions.md
> index f69600b56..5f30c9385 100644
> --- a/doc/userguide/reference/unimplemented_functions.md
> +++ b/doc/userguide/reference/unimplemented_functions.md
> @@ -6,25 +6,12 @@ and some functions are not relevant to Linux and might never be implemented.
>  The following functions are not currently implemented:
>  
>  -   `breakpoint`
> -
>  -   `chill`
> -
> --   `dpath`
>  -   `ddi_pathname`
> -
> --   `inet_ntoa6`
> -
> --   `inet_ntop`
> -
>  -   `msgdsize`
> -
>  -   `msgsize`
> -
>  -   `panic`
> -
>  -   `pcap`
> -
>  -   `stop`
>  
> -
>  **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
> -- 
> 2.47.3
> 

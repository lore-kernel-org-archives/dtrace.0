Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48026F285
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 20:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760732369; cv=fail; b=qjHMnmRlPeu0DlF8Y5clLIrz19Mw3C94wSjSwi8t6WNBPqaiuuKEj8fkI8w4WxYbGqltqXn2EC+3dxK4GftIJEkq8GlMFfAQ+aVqMl401McyjK6zw2BJWxakDyUtJgzHRLn7i95UF9sZYoUNxAoEpAno9HKplxkzIZOdfDeb33k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760732369; c=relaxed/simple;
	bh=FFggNgjWasxiza/hH7r2RGJaT6H/yqceMKUQAG0M28k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sx8s2VxB41fRgA1IHp9Wscv7KKlaZSNRuvT5SM23VQgUBg+lpanD2n6NGn6j/RF2xhLGyp3Qcs3E8v1cZen14fP3h0Dzhwiz8HtuBl8DAePVito7vbMIrgbirQwCFUjBtRi2v92bu9M6GLBIzniV9Dc/r1Kfh0AWlwvA+XILZhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ab2GcGQn; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qfYopcUj reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ab2GcGQn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qfYopcUj"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCeHOR020407
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 20:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=TR+u6FkznVQOUlFvrO8opOoa5I2ttqnEmjzR4ZgEQHs=; b=
	ab2GcGQnpP6NR1kupz78aZDE1JndWvBB0QvBnrdtqG4ZCKW/5J01IgWKynAS4asg
	E6CVO0mub4ZHw2cYAMjjVUyIBam3aYTmzzC+rUsaDml2M/008c9gXymfLks2UNvc
	DYwOXUYKlJf2pbn3s1y4hCYpv8HkUg48qtByHMrVheaGXjlrnTIAE1aprC5nIayF
	zHoIf10HXOhfDDCbGqMIl6GTJiAL7yiZRotM8kfgHyTI+Cq0EIQ/EDHhnCu78SKA
	KFPzpfYINvrnjxRxS9ySCRsIB6xd1RHpvQDx8w9BvGsWJkfooE7aa7kni3jkGutN
	s4SYN3F4iVx6chIrmr4EvQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qe59kpqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 20:19:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59HI6QHN017959
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 20:19:25 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012011.outbound.protection.outlook.com [52.101.48.11])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpdahhv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 20:19:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kE1t8VVd7UOHwvOJYml/5gzJi+rYqgTwYWTS+Ge88AhUVI+5kvU+E34ivELPomGMS7gNSfuR1sA7lnOg3Hcp7RFIsQdCHJyyoKPtTtYO5a/B9CQI9jQj97iA+Ta7+FM8fKY1Xne0QjxjrGFSghDbjmy3IyRrMIoz1SEJsxygxIaVSGTGmI3dr3SswOXLfKt+UpIHTSbLOnAwrEfCp2XAgOK/56UjwjZaNt0TVQrhkgYm4FZOJhBXL5zCB5QRfxJn1xYvLsl6Bj30VVPHikB3FIfbiUd9nJXWncFmSlR4bnUa2/Wy83P5Vis45MRoVDVbEmszphHlRv0SNrfzvWc9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDf2lmfwLNRU06p8jyGoBy01vNgaXnoE3l7jYfRJdh0=;
 b=c8cYicOO6kzAGhk64v28PjR4fhhJfctxJYp9JMfBxrukCit9ZY7Az4uR61ZjeTl5iN+mR0ArubOdCQtb958ThJlZhd7DiawlHHVPguqQHV8gUWcI0bYeVis7meip29Hpj/y9W4LL31vvue9a8tZlxGLEZNLB5Ab5KCpc2xzUEleSmd0Px8dt6vmN9IOsdqMiuWToUo2PhfS3L6b40vW4auGeksepapvVuiZzogjU7JueHRcaAeirgvhUjkCngUKZvP31pjnoRU1j/dPirpZ23UZgdxhrPJl0DLZ/LWpO6mXflN8QYfDv7S0rgZu5iIktl276WQKzSkXkyqQLxqZdeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDf2lmfwLNRU06p8jyGoBy01vNgaXnoE3l7jYfRJdh0=;
 b=qfYopcUj7GOuqznBDu7hqVXqMpW5ewRmgBA+yf7c23ffgK0NYDEoblW34LJq28Agzm1AkLwGdPdI0BJplrenFuO0Vg1TDl9CWouONkcuZIXr+w9GCfLKGGVVkDgizyLk4Tsr+vuIJoEh7sTQ7nQSaRkvLtI2cu+S2Lyp9lg2/Oo=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by DS7PR10MB5118.namprd10.prod.outlook.com (2603:10b6:5:3b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 20:19:20 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9203.007; Fri, 17 Oct 2025
 20:19:20 +0000
Date: Fri, 17 Oct 2025 16:19:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Clean up stack_fbt test
Message-ID: <aPKkxTXIB/sTCKMK@oracle.com>
References: <20251016205641.15446-1-eugene.loh@oracle.com>
 <aPHf07N4ISwnhK7K@oracle.com>
 <87c44286-dd57-9368-da23-b2121febdc5c@oracle.com>
 <aPKB5Qd4L6aBoSe9@oracle.com>
 <1bbff8f3-e10a-2d65-87c4-ccbc9bb9a579@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bbff8f3-e10a-2d65-87c4-ccbc9bb9a579@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|DS7PR10MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: 7383375d-1845-4710-e93d-08de0dba74c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?UeOY9t5FgzLD9NUZ0KvLOmV7fCr8ORYaIH+b13SuS9Rgqc/Xme37LD9SbC?=
 =?iso-8859-1?Q?rZEcpo6j5dZiRYcJhALIzkEtaTxIBr0htFT69B6bdzB1SL6pJWCu4XxmlH?=
 =?iso-8859-1?Q?sOQrT5hJISEbmErQbEBjdrDRohhQhHGDxquWOq+c3DSkCa3ovKzg86n+gl?=
 =?iso-8859-1?Q?egxBNE0K/Bpsp8I11ehivM1x+idveH8s1nVIjvYnx3QcNmSa5aqREPMOpo?=
 =?iso-8859-1?Q?AWcPNDUhIiXs021nRCzsAaOuWEwiIyAfBtM7KJVvttl3l73B6pi8KrFvCO?=
 =?iso-8859-1?Q?7xAnZvaDmf/QM6oUI7RSiC3tFq4dqDlmfh7ZcVl6bEtwdFkAZv2penTmlv?=
 =?iso-8859-1?Q?ofop7I8WEDC1NiM2ocfo9CWCSmGAqx8PjCRVO9CowWiRyj7WKNy4d2qQq2?=
 =?iso-8859-1?Q?n6W5ODJ0NmXGM+TplzZxDlE2YJQnUxXIFeJT+o8DahB7hpcVFZ3GgMIA7R?=
 =?iso-8859-1?Q?EfwSuUiSbl6kDf+w4HnlalM6RyectRN7qIz9x8KoQxFEUhVtADDKy+eXXL?=
 =?iso-8859-1?Q?DuxoctxO9S7WRTt+ZvHHqx7/JanMHfK0BWw2Grlvjqh8lkfQY6mJKTKc/Q?=
 =?iso-8859-1?Q?5pmOd+ezepZ5gXKErkFaUrwTHkqgs5RlrL/5dB6EI5JL+pXsxt+lx922RQ?=
 =?iso-8859-1?Q?iENQhv0zJCGrLcDZdCFKwpUMCBHhLSEAbstOz0QkeERGRu7Sv/od+yUCW/?=
 =?iso-8859-1?Q?JaoAzGl6vjCEB7C3tWfZ7g6/sG8dDocrOx66S3n2TJ0nY0wwLT+S9Ut47E?=
 =?iso-8859-1?Q?k1d1OJeMpQILj/3DlIucymTJGSE+dLdvc6+PQDr1EZFno4CrkS6RoIch5v?=
 =?iso-8859-1?Q?KybEg19lu6hOIqCS/fBfa8CjjcWsXJz0Jaap8RIH/XBGIvRmgd+MsCf/qO?=
 =?iso-8859-1?Q?Vk5hCHk7S/zJi/YWixq/2CtpnzyojO8Dr8Xrq3YIWLyXEGB+QQShodduGH?=
 =?iso-8859-1?Q?kaGpV4s3ck9A4Ce2UrOHpy3vrCLlr5jM78RvYDuBX+77SusJzxzWvqBYIE?=
 =?iso-8859-1?Q?L2h3HWG1xTLJLxB5y/j9Zig8VZVwhLb5aLhRRHqikVda7g+V0K0+6fmKcV?=
 =?iso-8859-1?Q?3GeiWag6WXIU22V4ahUQ2HksPnAkDglhP1AIgvMyaJl8YtiEzBws0+Vvtx?=
 =?iso-8859-1?Q?QypNnCXcwG2MKWMAaBRqC+eOISDyKG5IxknQRZwz7s2J9vCkD3pTtuK9av?=
 =?iso-8859-1?Q?kRnrOOnZ4yw/PqxIiExprgzZ1mwIgEkujGQWks3kQWx43/SiLiRyV/qwDK?=
 =?iso-8859-1?Q?H1dihrEy96n5zPbRUDLaItRten4f/mAXhNUtr+PDTAVuyAzZMfFecUIJGd?=
 =?iso-8859-1?Q?Bc1RqhOXL2NryaDb69acqw3UmvJCds2xxvChRpIpK6jChSf2eHGtVj0V/N?=
 =?iso-8859-1?Q?IrUn75d77qD9o+AsUfYh5tq6r2EBCRh+Jf8tHTt7podOjm3XzO+jNs1f0o?=
 =?iso-8859-1?Q?1curysznJL5nDnSXf9pcuDvuiAcAFJjXQLbihd6UGZB34RXnjB+M9TFGJ6?=
 =?iso-8859-1?Q?IBfgXmkl7EptKfbxARFHARHQZZ15i/u23AEgiGo1Tjzg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7OIIakBCruBrc8xI7XpWc8mBduiNtfUDXahcNpxnLWSG4MHvAuJzBc9NIM?=
 =?iso-8859-1?Q?EaZDq8nNKwQTNYAz/dlxWe9jImRp7gOATJAESZLQog5b5zvLkKqALLKBb9?=
 =?iso-8859-1?Q?cx3vyP1YC1VNcxaBUMnfql84YTVLTZXX9viNH0rsYBLStK5w1Ks7+l5iti?=
 =?iso-8859-1?Q?S4xbwd1ZYIt4Bbd0wr5eKo5Z2sJ2YZ+8km7s/LBPbCk+rYd1OdEBfbMshv?=
 =?iso-8859-1?Q?sxe75VptQoHvpFSRac8WTCT7VyrjGquZB3MqtgcbTvmMtbH6Q8nZJkLGhB?=
 =?iso-8859-1?Q?DJpX4Oj/Gxb2WXMjYd7rk1dZZs5PwNpUqcQ6oDXNLnsU9A8Pi/r/MXlIAH?=
 =?iso-8859-1?Q?BtRzEbDLoUy9RUOm43VmMkXcF2teeiT6e8l9ZvzIaCR+BDivOuP3NX0Ma7?=
 =?iso-8859-1?Q?m9YasCVboLBvcn6gAIe6NfA5Fco5Q36NFOujINZ/YGS//JU6N3ivbTS9Y+?=
 =?iso-8859-1?Q?Kf262gqGR0UOrOmLui2gKHpwygVOlqKLvrFItAyhQTcGqq6CDg0YwjYMi6?=
 =?iso-8859-1?Q?5lsOJLtCFhnWHXBXXKCxX7cWUDk0ZjDvvXLAcvl50+deoQ26xG/9gwlyMz?=
 =?iso-8859-1?Q?GgFWMUo2Q72P15RkB6+JXmQjR1kOGml9bpoZdGMOpjqOhLU9hhqr4A+dAW?=
 =?iso-8859-1?Q?VeIibhm3MepjvuN2d34EQggsAmRnPkPsZUKx8VjeOZYd0fEYR59YaTwxu3?=
 =?iso-8859-1?Q?UdA/5Nvfvj4EaOKkrvfa2AZqubIzBf0kmG+iO8Z0QpIoiQCJ5sSgbLCaGf?=
 =?iso-8859-1?Q?BbLuRxBY4wQMHRzW8m5wUp7DAwEOTUBPfkn31iqmlBgbEUCbEV40uKsNIO?=
 =?iso-8859-1?Q?2On3eEJbPvDrzsP0q55bLeaT9Qz3JZkrQyXdF+iHJ0BVUZUrRneT1ClgFa?=
 =?iso-8859-1?Q?uM+7F22yxrnvDoftba1NKgL9U4e0jmlsbQH8QC2wRm/v0zeuufRwqlQNPW?=
 =?iso-8859-1?Q?APjlydYcN/d6C8TJQ6YRcyVg+IbPlUggy/CiyRBjYiW8MckR3ejpFdQa3J?=
 =?iso-8859-1?Q?nLEtZ8efnViUkJHXzqaWs+9pLma/Ae6oeEpwj5zbgvyttB9RBVPRG9cSlp?=
 =?iso-8859-1?Q?wJY4YlQEfXwOZ6PdoQGt1Oy8Ie1UgCsGDWxqdkjdqkLGb6jUERv3Z1H53M?=
 =?iso-8859-1?Q?SDMZPU7HVfDv75QnmrZulzCEJ2JEzAetyFrQ+ImpWlWxz1RjeZPVyhJ3GM?=
 =?iso-8859-1?Q?depmeesHhWWS3S7EKwOmUYOvkOpaRbeu06XhiphsQS9PKaMaKOYb6/wd5d?=
 =?iso-8859-1?Q?NFAn8bMcujhXpP3uXY/gCHHhFTlV7Ipo0reHxM4+I9aGdvNy4Fe8b0WBPY?=
 =?iso-8859-1?Q?BW8qsaVz/T3/z9XT9/i9fHEj/RH6hg262H8iNfgnlDFSfVtLOTz81d+Ppp?=
 =?iso-8859-1?Q?i8XY9bX/cOcq40F9J9WSWrFTWMVgYOmfqUHRKkO54kTB/wQsN5wuViPf3L?=
 =?iso-8859-1?Q?VF2IHBBDbUkqDp1X3PutTi1hjOBfmJQAZdqrqB0iuWLe+4uW7gViz63hFg?=
 =?iso-8859-1?Q?NSmssQSB+6RQkC9U2CwcUcvvvkUCmIyZZY3fe/E97oJl+JRFvtaMppyy9N?=
 =?iso-8859-1?Q?afNF1M6YW2JTtC0bazlkf/u5qG0zW9z5TOJqCq7FmPfS8DgCp9v4slbBtS?=
 =?iso-8859-1?Q?YPmK7m2TGcsnmehEshVYaYRoJ09mXAHGKBam5xL1ScJj5T9CcA5UQqGw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G25uj1EZNFAGj7xzHheiQTRa5xn60EvTVNE9IGYqqB0OIUgZgSKlac51o/XRM8bDZ7gzOcJNmnvJG/pj1py7h2G1x0sc1mvdeiovF6StK5QrewCSApptDlhIVGKfx94OjJlor6KvntuYXBDu5Retf4uS/AgbLVNPA6mASRZ+ZaADixN3g7WNJRYoZoaJoPsDwMmUFE2TVsVW5xfKLKuj0KKS1jngUimyvjLze4aSJntqhv1Z/mELVPMzzmE6zj5typyMlDt2iKX/Exz8MFBww8bshX8tmZSloZO7XHVcGvD4CpVBcXzYdny0Ql6TOzgtHMGY6kpxcUXnLR9/7o2I3vz26wLnw1ZRGfdAMmhf3/9FIr1uxJP1hFfYqzs+UteVCpLY7cuEdvLLOyuI7JjPjuDz3+05faMW408AfXyqfxJ2kuAHSCRQOjP6HU39WMNyWFVWHWfjhVCnoXuS2wBxpRgg0McgVRzqWslOyYK5P4SMcVgyAPOcV7Mfx5QS12Knmexkz6SbZ3CSY4HALXG0d1zm5uvK7DHgP5D67pOBCQemhUxyYi2YN926EiAFYPRoHufLRgJuX3WI9InxrbjmA4asmLRBewtx1svDgytvb7c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7383375d-1845-4710-e93d-08de0dba74c4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 20:19:20.8295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQQIy9xFc8gCUxl7FcMrZJV0K/XzyD7CM+9AH1HArzjujybUMBYm0hZKOxxIuigxdvwoJu+624ZhZjwgb2YcOTa/XWqI6rGXwBD7zJuPe0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5118
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510170155
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxMCBTYWx0ZWRfX1isZ0g7vCIqS
 NEGW8x+wnnC1Gdv+CSf1yJoxoLPMtn7bzJKwN0xLXoNNXghyp5xA54LBEkVfbCsw87yHF+wX18L
 4FSvVJnQLOC1Z5mgMawnISYVJpVHd6m4wtIXc+IzvfhDEF8rbBgOia0I8hDF4sRvbeFPgRJa3yi
 eDjbT5H05qc76utFZC8VXKnF7fop5ZnNLzCXBG4vG3FuVKYrG0sx3q6Vj80ioAzF1gowWlAH44W
 FIr+CMDekyyybNEu/4snRhfIqHih2BRDtA5U5W+abg/KC9ftUhgpSaS44ztyM/j8eqjb2MrFr5J
 NJUzJKVWg0hp3sseC9PJxRJo7zuSOlPNOHBqVx6dp8MHtemN1UYtc9qocgGBYB8k1MqoKR4ET30
 8MI9xg+Zxp2cwXPtjGZVkSs9dQBIaQ==
X-Authority-Analysis: v=2.4 cv=V7JwEOni c=1 sm=1 tr=0 ts=68f2a4cd cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=vbnexF0Ze4pW0tWVptUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: VHjIfL1rmL-kBDwQYtEa_z6JI26qLH0-
X-Proofpoint-GUID: VHjIfL1rmL-kBDwQYtEa_z6JI26qLH0-

On Fri, Oct 17, 2025 at 03:26:38PM -0400, Eugene Loh wrote:
> On 10/17/25 13:50, Kris Van Hees wrote:
> 
> > On Fri, Oct 17, 2025 at 01:32:46PM -0400, Eugene Loh wrote:
> > > On 10/17/25 02:18, Kris Van Hees wrote:
> > > 
> > > > On Thu, Oct 16, 2025 at 04:56:41PM -0400, eugene.loh@oracle.com wrote:
> > > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > > 
> > > > > The idea behind the test is to check the stack() output for some fbt
> > > > > probe for specific expected frames.  An attempt was made to specify the
> > > > > exact stack that was expected, but there are too many variations among
> > > > > kernel versions and so maintaining the test was difficult.  Loosen the
> > > > > test to check for only a few expected frames.
> > > > > 
> > > > > The test was also checking that stack()'s first 3 frames matched
> > > > > stack(3), but such a test is already provided by, for example,
> > > > >       test/unittest/printf/tst.stack.d
> > > > >       test/unittest/stack/tst.stack.d
> > > > > So, drop the stack(3) stuff.
> > > > Since the kernel implementation can change between versions and architectures,
> > > > why not just verify that the function we're probing is the top frame, and then
> > > > perhaps for sanity ensure that the rest of the frames are resolved addresses
> > > > (i.e. symbolic nmes rather than hex addresses)?  Although that perhaps might be
> > > > a bit strict because I could see some architectures implementing the syscall
> > > > stuff somehow with dynamically generated trampolines or something that would
> > > > not have addr-to-symbol information.  Or ksplice might even cause that if the
> > > > splicing took place while tracing was going on because we never re-read the list
> > > > of kernel symbols after dtarce started.
> > > That feels to me like a different sort of check.  The intention was not
> > > simply that the result should be visually reasonable, but in fact that the
> > > frames are "correct."  That's hard to do (because we don't exactly know what
> > > "correct" means), but there seem to be certain specific frames that we can
> > > generally expect to see.  Maybe there will be some systems where the
> > > generated stack frames are totally different from what we normally expect,
> > > but maybe those situations will be scarce enough that we can just look and
> > > make one-off judgment calls that they're okay.
> > > 
> > > Anyhow, the idea is to check that specific frames are there.
> > OK, bvut that seems to be outside of the scope of DTrace testing because the
> > stack traces that is reported is provided by kernel functionality and we are
> > not testing the kernel inn our testsuite.
> 
> Hmm, if we are relying on something in the kernel that turns out to be
> faulty, then we should want to know about it and users will not care whose
> fault it is.  We care if we are delivering correct results.

But by that logic, we ought to have tests for all kernel functionality we use.
Do the BPF helpers work the way they ouoght to?  Does the BPF interpreter/JIT
work correctly?  Is the perf event buffer handling correct?  Are tracepoints
inplemented correctly?

Some things we test indirectly because we are testing predictable output for
probes to the extend that DTrace provides the information and derives it from
kernel data.  E.g. in network tests we check that the source and/or destination
IP is correct, but we do that primarily to ensure that we are not accidentally
providing them in reverse or that we are reading the data from the wrong offset
in the structure that the kernel provides.  But we do not intentionally try to
ensure that they are the correct addresses as a way to ensure that the kernel is
not providing us with faulty data.

Stack traces are an interesting thing because they are purely data items, and
we have no real way to validate them (unless we perform static analysis on the
kernel to determine what the call stack ought to be, which is not practically
possible).  Your validation based on expecting certain symbols to be in the
call stack is a hardwired assumption based on either analysis of the kernel
source or observation of call stacks as reported by the kernel (and thus could
theoretically be faulty anyway).  Comparison with stacks reported by other
tools is not valid because those tools obtain their call stacks from the same
source and thus if it is wrong for one, it will be wrong for the other.

All I am saying is that we *cannot* take responsibility for performing testing
that validates whether the kernel is doing the right thing.  Yes, if a call
stack is wrong, users may not care who is to blame - but we cannot avoid that
anyway because a kernel update may very well cause a call stack to be wrong,
regardless of our testing before release having validated that to our knowledge
it all ought to work prrfectly fine.  We make it very clear that DTrace depends
on kernel functionality to provide tracing (and trace data).  If the kernel
people ensure they do proper testing, and we ensure we do proper testing on
what we do with the data we get, there is end-to-end testing.  If the kernel
people fail to do proper testing, we are largely at their mercy.  And if they
change implementation details in kernel internals, our attempts to test kernel
functionality may fail, not because the kernel is wrong, but because our
teeting is making assumptions about things that we have no control over.

The call stacks for system calls have changed a lot over all the years I have
been working on DTrace for Linux.  I wouldn't be surprised if they will change
again - it is a popular area to try to reduce performance impact.

If you expect that we perform validation testing on kernel features - where do
you draw the line on what we ought to test and what not?  And what are the
success criteria?

For this particular test...  The system() action in the BEGIN clause will be
executed by the consumer when it sees the trace data in the buffer.  Can you
guarantee that there is nothing else in the kernel that might call vfs_write
by means of a different call path between tracing starting and the system()
being executed?  On any kernel we support DTrace on?

I don't think we can - and to me that indicates that we are being a but too
strict in what we expect our testing to cover.

> > So, if we keep encountering issues
> > with changes in the kernel causing tests like these to be updated, I think we
> > need to reconsider what we are testing and ensure that we limit ourselves to
> > testing DTrace rather than things like the kernel.  The kernel has its own
> > mechanisms for testing that its features are accurate (or it should).  That is
> > not the purpose of DTrace and its testsuite.
> > 
> > As such, if the stack trace being reported has the correct top frame (the
> > fuction that we are tracing), and we are able to resolve addresses (which is
> > DTrace functionality in the consumer), then we have tested the appropriate
> > functionality that DTrace provides.  Accuracy of the stack trace itself is not
> > somehting under our control.  We can only report what we are provided with
> > by the kernel itself.
> > 
> > > > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > > > ---
> > > > >    test/unittest/stack/tst.stack_fbt.r  |  1 +
> > > > >    test/unittest/stack/tst.stack_fbt.sh | 89 +++++++---------------------
> > > > >    2 files changed, 23 insertions(+), 67 deletions(-)
> > > > >    create mode 100644 test/unittest/stack/tst.stack_fbt.r
> > > > > 
> > > > > diff --git a/test/unittest/stack/tst.stack_fbt.r b/test/unittest/stack/tst.stack_fbt.r
> > > > > new file mode 100644
> > > > > index 000000000..2e9ba477f
> > > > > --- /dev/null
> > > > > +++ b/test/unittest/stack/tst.stack_fbt.r
> > > > > @@ -0,0 +1 @@
> > > > > +success
> > > > > diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
> > > > > index 15b85be13..f3d321e7f 100755
> > > > > --- a/test/unittest/stack/tst.stack_fbt.sh
> > > > > +++ b/test/unittest/stack/tst.stack_fbt.sh
> > > > > @@ -5,7 +5,7 @@
> > > > >    # Licensed under the Universal Permissive License v 1.0 as shown at
> > > > >    # http://oss.oracle.com/licenses/upl.
> > > > >    #
> > > > > -# Test the stack action with default stack depth and depth 3.
> > > > > +# Check the stack action for expected frames.
> > > > >    dtrace=$1
> > > > > @@ -26,8 +26,6 @@ BEGIN
> > > > >    fbt::vfs_write:entry
> > > > >    {
> > > > >    	stack();
> > > > > -	printf("first 3 frames\n");
> > > > > -	stack(3);
> > > > >    	exit(0);
> > > > >    }' >& dtrace.out
> > > > > @@ -37,17 +35,16 @@ if [ $? -ne 0 ]; then
> > > > >    	exit 1
> > > > >    fi
> > > > > -# Strip out
> > > > > -# - blank lines
> > > > > -# - "constprop"
> > > > > -# - "isra"
> > > > > +# Ignore blank lines and strip out
> > > > > +# - ".constprop.[0-9]"
> > > > >    # - "_after_hwframe"    (x86 starting with UEK8)
> > > > > -# - pointer values
> > > > > +# - "+0x[0-9a-f]*$"
> > > > > +# - leading spaces
> > > > >    awk 'NF != 0 { sub("\\.constprop\\.[0-9]", "");
> > > > > -               sub("\\.isra\\.[0-9]", "");
> > > > >                   sub("_after_hwframe\\+", "+");
> > > > > -               sub(/+0x[0-9a-f]*$/, "+{ptr}");
> > > > > +               sub(/+0x[0-9a-f]*$/, "");
> > > > > +               sub(/^ */, "");
> > > > >                   print }' dtrace.out > dtrace.post
> > > > >    if [ $? -ne 0 ]; then
> > > > >    	echo ERROR: awk failed
> > > > > @@ -55,77 +52,35 @@ if [ $? -ne 0 ]; then
> > > > >    	exit 1
> > > > >    fi
> > > > > -# Figure out what stack to expect.
> > > > > +# Identify, in order, a few frames we expect to see.
> > > > > -read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> > > > > -
> > > > > -if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
> > > > > -	# up to 5.8
> > > > > -	KERVER="A"
> > > > > -else
> > > > > -	# starting at 5.8
> > > > > -	KERVER="B"
> > > > > -fi
> > > > > -
> > > > > -if [ $(uname -m) == "x86_64" -a $KERVER == "A" ]; then
> > > > > -cat << EOF > dtrace.cmp
> > > > > -              vmlinux\`vfs_write+{ptr}
> > > > > -              vmlinux\`__x64_sys_write+{ptr}
> > > > > -              vmlinux\`x64_sys_call+{ptr}
> > > > > -              vmlinux\`do_syscall_64+{ptr}
> > > > > -              vmlinux\`entry_SYSCALL_64+{ptr}
> > > > > -EOF
> > > > > -elif [ $(uname -m) == "aarch64" -a $KERVER == "A" ]; then
> > > > > -cat << EOF > dtrace.cmp
> > > > > -              vmlinux\`vfs_write
> > > > > -              vmlinux\`__arm64_sys_write+{ptr}
> > > > > -              vmlinux\`el0_svc_common+{ptr}
> > > > > -              vmlinux\`el0_svc_handler+{ptr}
> > > > > -              vmlinux\`el0_svc+{ptr}
> > > > > -EOF
> > > > > -elif [ $(uname -m) == "x86_64" -a $KERVER == "B" ]; then
> > > > > -cat << EOF > dtrace.cmp
> > > > > -              vmlinux\`vfs_write+{ptr}
> > > > > -              vmlinux\`ksys_write+{ptr}
> > > > > -              vmlinux\`do_syscall_64+{ptr}
> > > > > -              vmlinux\`entry_SYSCALL_64+{ptr}
> > > > > -EOF
> > > > > -elif [ $(uname -m) == "aarch64" -a $KERVER == "B" ]; then
> > > > > -cat << EOF > dtrace.cmp
> > > > > -              vmlinux\`vfs_write
> > > > > -              vmlinux\`__arm64_sys_write+{ptr}
> > > > > -              vmlinux\`invoke_syscall+{ptr}
> > > > > -              vmlinux\`el0_svc_common+{ptr}
> > > > > -              vmlinux\`do_el0_svc+{ptr}
> > > > > -              vmlinux\`el0_svc+{ptr}
> > > > > -              vmlinux\`el0t_64_sync_handler+{ptr}
> > > > > -              vmlinux\`el0t_64_sync+{ptr}
> > > > > -EOF
> > > > > +if [ $(uname -m) == "x86_64" ]; then
> > > > > +	frames="vfs_write do_syscall_64 entry_SYSCALL_64"
> > > > > +elif [ $(uname -m) == "aarch64" ]; then
> > > > > +	frames="vfs_write __arm64_sys_write el0_svc_common el0_svc"
> > > > >    else
> > > > >    	echo ERROR: unrecognized platform
> > > > >    	uname -r
> > > > >    	uname -m
> > > > >    	exit 1
> > > > >    fi
> > > > > -
> > > > > -# Add the first 3 frames a second time.
> > > > > -
> > > > > -head -3 dtrace.cmp > dtrace.tmp
> > > > > -echo first 3 frames >> dtrace.cmp
> > > > > -cat dtrace.tmp >> dtrace.cmp
> > > > > +for frame in $frames; do
> > > > > +	echo 'vmlinux`'$frame >> dtrace.cmp
> > > > > +done
> > > > >    # Compare results.
> > > > > -if ! diff -q dtrace.cmp dtrace.post; then
> > > > > -	echo ERROR: results do not match
> > > > > -	diff dtrace.cmp dtrace.post
> > > > > -	echo "==== expect"
> > > > > +diff dtrace.cmp dtrace.post | grep '^<' > missing.frames
> > > > > +if [ `cat missing.frames | wc -l` -ne 0 ]; then
> > > > > +	echo ERROR: missing some expected frames
> > > > > +	echo === expected frames include:
> > > > >    	cat dtrace.cmp
> > > > > -	echo "==== actual"
> > > > > +	echo === actual frames are:
> > > > >    	cat dtrace.out
> > > > > +	echo === missing expected frames:
> > > > > +	cat missing.frames
> > > > >    	exit 1
> > > > >    fi
> > > > >    echo success
> > > > > -
> > > > >    exit 0
> > > > > -- 
> > > > > 2.47.3
> > > > > 
